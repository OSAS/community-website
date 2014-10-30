---
title: oVirt 3.4, Glusterized
layout: post
comments: true
author: jbrooks
date: 2014-05-22 00:08 UTC
tags:
- oVirt
- CentOS
- Gluster
- virtualization
- storage
categories:
- Blog
---
[![](blog/oVirt-logo.png){:align=right}](http://www.ovirt.org)oVirt's [Hosted Engine](http://www.ovirt.org/Features/Self_Hosted_Engine) feature, introduced in the project's [3.4 release](http://www.ovirt.org/OVirt_3.4_Release_Notes), enables the open source virtualization system to host its own management server, which means one fewer required machine, and more self-sufficiency for your oVirt installation. 

While a self-sufficient oVirt installation has been achievable for some time using the project's ["All-in-One"](http://www.ovirt.org/Feature/AllInOne) method of running an oVirt virtualization host and management server together on one machine, the Hosted Engine feature allows multiple machines to partake in the hosting duties, eliminating any one host as a single point of failure.

The Hosted Engine feature relies on NFS storage to house the management VM. Running an NFS server on one of our virtualization hosts would make that host a new single point of failure, which means we need either to tap an external NFS filer (the approach I took in [the walkthrough](/blog/2014/03/up-and-running-with-ovirt-3-4/) I posted here recently) or we need to figure out how to make our oVirt hosts serve up their own, replicated NFS storage.

In this post, I'm going to walk through that latter option -- setting up a pair of CentOS 6 machines to serve as oVirt virtualization hosts that together provide the NFS storage required for the Hosted Engine feature, using [Gluster](http://www.gluster.org/) for this replicated storage and for NFS and [CTDB](https://ctdb.samba.org/) to provide a virtual IP address mount point for the storage.

READMORE

{:.alert.alert-warning}
**NOTE:** People have been [running into](http://lists.ovirt.org/pipermail/users/2014-July/026088.html) [some issues](https://bugzilla.redhat.com/show_bug.cgi?id=1097639) with converged Gluster + oVirt setups like the one I describe here.

It's important to use CTDB, or something like it, to provide for [automated IP failover]((https://access.redhat.com/documentation/en-US/Red_Hat_Storage/2.1/html/Administration_Guide/ch09s05.html)). While it may seem reasonable to simply use "localhost" as the NFS mount point for the hosted engine storage, and rely on Gluster to handle the replication between the servers, this ends up not working reliably. 

In my own lab, I'm running a setup like the one below, but with three machines, each serving as virt+storage hosts, with replica 3 Gluster volumes to ensure that a 51% quorum is maintained when one of the machines is down for maintenance.

My planned outages, where (as described below) I first stop the ctdb service on the to-be-shutdown machine, thereby prompting another node to pick up the job, have run smoothly.

I recently tested with an unplanned outage, where I pulled the plug (stopped via power management) on the machine hosting my Gluster NFS storage. Here the handoff left much to be desired -- it took 18 minutes for oVirt engine to become fully available again. However, it took the only other VM I had running at the time (which wasn't on the downed machine) never went offline, as is the norm for oVirt engine outages.


## Prerequisites

The prerequisites are the same as for the [Up and Running with oVirt 3.4](/blog/2014/03/up-and-running-with-ovirt-3-4/) walkthrough, with the addition of a healthy-sized disk or partition to use for our Gluster volumes. The hosted engine VM will require 20GB, and you'll want to have plenty of storage space left over for the VMs you'll create and manage with oVirt.

For networking, you can get away with a single network adapter, but for best results, you'll want three: one for the CTDB heartbeat, one for Gluster traffic, and one for oVirt management traffic and everything else. No matter how you arrange your networking, your two hosts will need to be able to reach other on your network(s). If need be, edit `/etc/hosts` on both of your machines to establish the right ip address / host name mappings.

{:.alert.alert-warning}
_NOTE:_ Unless I indicate otherwise, you'll need to perform the steps that follow on both of your machines.

## Prepare Partition for Gluster

We need a partition to store our Gluster bricks. For simplicity, I'm using a single XFS partition, and my Gluster bricks will be directories within this partition.

You'll need to carry out these steps on both of your oVirt/Gluster machines, as each will be sharing in the storage duties.

I'm using CentOS 6 hosts for this walkthrough, which is missing one of my favorite utilities from Fedora, [system-storage-manager](https://fedoraproject.org/wiki/Features/SystemStorageManager). I packaged up ssm for CentOS using Fedora's nifty [Copr service](http://copr.fedoraproject.org/):

````
cd /etc/yum.repos.d/ && curl -O http://copr.fedoraproject.org/coprs/jasonbrooks/system-storage-manager/repo/epel-6-x86_64/jasonbrooks-system-storage-manager-epel-6-x86_64.repo && yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && yum install -y system-storage-manager python-argparse
````

I use ssm to add a new disk to my LVM pool and to create an XFS partition for Gluster (you can do it however you want):

````
ssm list (take note of your pool name)
````
````
ssm add -p $YOUR_POOL_NAME $YOUR_DEVICE_NAME
````
````
ssm create -p $YOUR_POOL_NAME --fstype xfs -n gluster
````

Next, modify your `/etc/fstab` to add the new partition:

````
mkdir /gluster
````
````
blkid $YOUR_NEW_VOLUME_NAME (something like /dev/pool/gluster)
````
Edit your `/etc/fstab` and add the line:

````
UUID=$YOUR_UUID /gluster xfs defaults 1 2
````
````
mount -a
````

## Configure Firewall

Edit `/etc/sysconfig/iptables` to include the rules you'll need for Gluster, oVirt and CTDB:

````
# oVirt/Gluster firewall configuration
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

-A INPUT -i lo -j ACCEPT

# vdsm
-A INPUT -p tcp --dport 54321 -j ACCEPT

# SSH
-A INPUT -p tcp --dport 22 -j ACCEPT

# snmp
-A INPUT -p udp --dport 161 -j ACCEPT

# libvirt tls
-A INPUT -p tcp --dport 16514 -j ACCEPT

# guest consoles
-A INPUT -p tcp -m multiport --dports 5900:6923 -j ACCEPT

# migration
-A INPUT -p tcp -m multiport --dports 49152:49216 -j ACCEPT

# glusterd
-A INPUT -p tcp -m tcp --dport 24007 -j ACCEPT

# portmapper
-A INPUT -p udp -m udp --dport 111   -j ACCEPT
-A INPUT -p tcp -m tcp --dport 38465 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 38466 -j ACCEPT

# nfs
-A INPUT -p tcp -m tcp --dport 111   -j ACCEPT
-A INPUT -p tcp -m tcp --dport 38467 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 2049  -j ACCEPT

# status
-A INPUT -p tcp -m tcp --dport 39543 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 55863 -j ACCEPT

# nlockmgr
-A INPUT -p tcp -m tcp --dport 38468 -j ACCEPT
-A INPUT -p udp -m udp --dport 963   -j ACCEPT
-A INPUT -p tcp -m tcp --dport 965   -j ACCEPT

# ctdbd
-A INPUT -p tcp -m tcp --dport 4379  -j ACCEPT

# Ports for gluster volume bricks (default 100 ports)
-A INPUT -p tcp -m tcp --dport 24009:24108 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 50152:50251 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 34865:34867 -j ACCEPT

# Reject any other input traffic
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -m physdev ! --physdev-is-bridged -j REJECT --reject-with icmp-host-prohibited
COMMIT
````

{:.alert.alert-warning}
_NOTE:_ During the oVirt Hosted Engine install process, which we'll get to shortly, the installer script will ask if you want it to configure your iptables. You should answer no, but if you answer yes on accident, the installer will saved a backup copy of the previous configuration as something like `/etc/sysconfig/iptables.$DATE` and you can just copy that back over. Keep an eye on this, because your pair of machines will have to communicate with each other for Gluster, for CTDB, for NFS, etc.


Restart your iptables service:

````
service iptables restart
````

## Install Gluster

````
yum localinstall -y http://resources.ovirt.org/releases/ovirt-release.noarch.rpm && yum install -y glusterfs-server
````

Edit `/etc/glusterfs/glusterd.vol`, uncomment the line `option base-port 49152` and change the value `49152` to `50152`. This change works around a conflict between the ports used by libvirt for live migration, and the ports Gluster uses for its bricks.

Now start the Gluster service and configure it to auto-start after subsequent reboots:

````
service glusterd start && chkconfig glusterd on
````

Now, we'll probe our second machine from our first, combining them into a single Gluster trusted pool. Unlike many of the other commands in this walkthrough, it's only necessary to run this on one of your two machines. If you're using a separate network for Gluster traffic, you must use your machine's address on that network for this command:

````
gluster peer probe $YOUR_OTHER_MACHINE
````

## CTDB Configuration

### First Machine Only

First, we'll create a "meta" volume for the clusted file system that CTDB requires for its own needs:

````
gluster volume create meta replica 2 $YOUR_FIRST_HOST:/gluster/meta0 $YOUR_SECOND_HOST:/gluster/meta1
````
Then, we'll start that volume:

````
gluster volume start meta
````
````
chkconfig rpcbind on
````
````
service rpcbind start
````
````
yum install -y nfs-utils ctdb
````

Set up conf files for ctdb:

````
mkdir -p /mnt/lock
````
````
mount -t glusterfs localhost:/meta /mnt/lock
````
Edit `/mnt/lock/ctdb`:

````
CTDB_PUBLIC_ADDRESSES=/mnt/lock/public_addresses
CTDB_NODES=/etc/ctdb/nodes
# Only when using Samba. Unnecessary for NFS.
CTDB_MANAGES_SAMBA=no
# some tunables
CTDB_SET_DeterministicIPs=1
CTDB_SET_RecoveryBanPeriod=120
CTDB_SET_KeepaliveInterval=5
CTDB_SET_KeepaliveLimit=5
CTDB_SET_MonitorInterval=15
CTDB_RECOVERY_LOCK=/mnt/lock/reclock
````

Edit `/mnt/lock/nodes` to include the list of CTDB interconnect/heartbeat IPs. For our two-node install there'll be two of these. For more info on CTDB configuration, see [Configuring CTDB](https://ctdb.samba.org/configuring.html).

Next, edit `/mnt/lock/public_addresses` to include the list of virtual addresses to be hosted between the two machines (we only need one), and the network range, and the nic we're using to host this virtual address:

````
XX.XX.XX.XX/24 eth0
````

### Second Machine Only

````
chkconfig rpcbind on
````
````
service rpcbind start
````
````
yum install -y nfs-utils ctdb
````
````
mkdir -p /mnt/lock
````
````
mount -t glusterfs localhost:/meta /mnt/lock
````

### On Both Machines

Now, on both hosts, we'll point our CTDB configuration files at the files we've created in the shared `meta` volume:

````
mv /etc/sysconfig/ctdb /etc/sysconfig/ctdb.orig
````
````
ln -­s /mnt/lock/ctdb /etc/sysconfig/ctdb
````
````
ln -s /mnt/lock/nodes /etc/ctdb/nodes
````
````
ln -s /mnt/lock/public_addresses /etc/ctdb/public_addresses
````
````
mount -t glusterfs localhost:/meta /mnt/lock && service ctdb start
````

## Create a Gluster Volume for the Engine VM

### First Machine Only

````
gluster volume create engine replica 2 $YOUR_FIRST_MACHINE:/gluster/engine0 $YOUR_OTHER_MACHINE:/gluster/engine1
````
````
gluster volume set engine storage.owner-uid 36 && gluster volume set engine storage.owner-gid 36
````
````
gluster volume start engine
````

Create a file named `/var/lib/glusterd/groups/virt' and paste in the lines below. This provides a "virt" group with settings optimized for VM storage. I've left off two quorum-related options present in the [original group definition](https://github.com/gluster/glusterfs/blob/master/extras/group-virt.example). These quorum settings help prevent split-brain, but will cause VMs hosted on Gluster volumes with the settings applied to pause when one of our two machines goes offline.

````
quick-read=off
read-ahead=off
io-cache=off
stat-prefetch=off
eager-lock=enable
remote-dio=enable
```` 

Next, we'll add our new engine volume to this virt group:

````
gluster volume set engine group virt
````


## Create a Gluster Volume for an oVirt Storage Domain

### First Machine Only

While we're at it, let's create a third Gluster volume, for our regular VM storage in oVirt:

````
gluster volume create data replica 2 $YOUR_FIRST_MACHINE:/gluster/data0 $YOUR_OTHER_MACHINE:/gluster/data1
````
````
gluster volume set data storage.owner-uid 36 && gluster volume set data storage.owner-gid 36
````
````
gluster volume set storage group virt
````
````
gluster volume start data
````


## Finish Hosted oVirt Installation

With our Gluster-provided NFS storage for the oVirt engine VM arranged, we can proceed with the Hosted Engine installation. See the "Installing oVirt with Hosted Engine" heading in the [Up & Running walkthrough](/blog/2014/03/up-and-running-with-ovirt-3-4/) and follow the steps there.

As you do, keep these things in mind:

* Before running the `hosted-engine --deploy` command on your first machine, run 'service ctdb stop' to ensure that the shared virtual IP address is hosted from your _other_ machine. This will ensure that the `ovirtmgmt` network bridge will be created correctly. When it comes time to install your second host (under the heading "Installing a Second Host"), run `service ctdb start` on your first host and then `service ctdb stop` on your second host, and then start CTDB back up on the second host when the install is done.
* When the installer script asks you to supply the path to your NFS share, make sure to provide the virtual IP address (the one you listed in `/mnt/lock/public_addresses`) or a host name that resolves to this address. Using this virtual IP ensures that when one machine goes down, the other will automatically pick up the hosting duties for the NFS share.
* When it's time to configure storage (under the heading "Configuring Storage"), choose "Data / GlusterFS" as the storage type, and for the storage path, use `$YOUR_VIRTUAL_IP:data` to use the "data" Gluster volume we configured above for your VM storage.
* You can create additional volumes for iso and export domains, in the same way as we created our data domain above. These Gluster volumes will be accessible via NFS (required for the export domain) and via POSIX (iso domains can be POSIX or NFS type).

## Maintenance 

To take down one of the machines, while enabling VM workloads and the management server to continue running on the other machine, follow these steps:

* Migrate VMs away from the machine to be taken down.
* Put the oVirt host that corresponds to the machine you're taking offline in maintenance mode.
* On your to-be-maintained host, run `service ctdb stop` to ensure that the second node takes on the virtual IP / NFS hosting chores.
* Maintain as you will: update/reboot/shutdown/etc.

When it's time to boot your maintained host back up, follow these steps on that machine:

* `mount -t glusterfs localhost:/meta /mnt/lock`
* `service ctdb start`
* In the oVirt admin console, re-activate the maintenance mode host

Commands that will come in handy:

* Is CTDB running ok? `service ctdb status`
* What's the state of my Gluster volume replication? `gluster volume heal $YOURVOL statistics`
* What's the state of the ovirt-ha daemons on my machine? `tail -f /var/log/ovirt-hosted-engine-ha/*`

## Until Next Time

I hope that this walkthrough helps you get up and running with Gluster-based storage on your oVirt installation. The Hosted Engine feature is relatively new, and I'm still fully wrapping my brain around it. The biggest issue to watch out for with this configuration is getting your Gluster volumes into a split-brain state. On IRC, I’m jbrooks, ping me in the #ovirt room on OFTC, or the #gluster room on Freenode, or write a comment below.

If you’re interested in getting involved with oVirt or Gluster, you can find all the mailing list, issue tracker, source repository, and wiki information you need on the [oVirt](http://www.ovirt.org/Community) or [Gluster](http://www.gluster.org/interact/) project sites.

Finally, be sure to follow us on Twitter at [@redhatopen](https://twitter.com/redhatopen) for news on oVirt and other open source projects in the Red Hat world.



