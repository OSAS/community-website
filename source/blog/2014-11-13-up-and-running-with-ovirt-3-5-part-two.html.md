---
title: Up and Running with oVirt 3.5, Part Two
author: jbrooks
date: 2014-11-13 14:00:00 UTC
tags: ovirt, centos, gluster, glusterization, virtualization, storage
published: true
comments: true
---

[![](blog/oVirt-logo.png){:align="right"}](http://www.ovirt.org)
Two weeks ago in this space, I [wrote about](/blog/2014/10/up-and-running-with-ovirt-3-5/) how to deploy the virtualization, storage, and management elements of the new oVirt 3.5 release on a single machine. Today, we're going to add two more machines to the mix, which will enable us to bring down one machine at a time for maintenance while allowing the rest of the deployment to continue its virtual machine hosting duties uninterrupted.

We'll be configuring two more machines to match the system we set up in [part one](/blog/2014/10/up-and-running-with-ovirt-3-5/), installing and configuring [CTDB](https://ctdb.samba.org/) to provide HA failover for the nfs share where the hosted engine lives, and expanding our single brick gluster volumes to replicated volumes that will span all three of our hosts.

Before proceeding, I'll say that this converged virtualization and storage scenario is a leading-edge sort of thing. Many of the ways you might use oVirt and Gluster are available in commerically-supported configurations using RHEV and RHS, but at this time, this sort of oVirt+Gluster mashup isn't one of them. With that said, my test lab has been set up like this for the past six or seven months, and it's worked reliably for me.

READMORE

## Prerequisites

The hardware and software prerequisites are the same as for the [Up and Running with oVirt 3.5](/blog/2014/10/up-and-running-with-ovirt-3-5/) walkthrough. In addition to the system we set up last time, you'll need two more machines running minimal installs of CentOS 7. 

For networking, you can get away with a single network adapter, but for best results, you'll want three: one for the CTDB heartbeat, one for Gluster traffic, and one for oVirt management traffic and everything else. No matter how you arrange your networking, your three hosts will need to be able to reach other on your network(s). If need be, edit `/etc/hosts` on your machines to establish the right ip address / host name mappings.

{:.alert.alert-warning}
**NOTE:** There are a few spots in this setup where I'm still tracking down SELinux issues, so, for now, this howto requires that SELinux be in *permissive* mode. On **all three** of your hosts, run `setenforce 0` and edit `/etc/selinux/config` and change `SELINUX=enforcing` to `SELINUX=permissive` to make the setting stick.

## Shut down your engine

First, if you're following along from Part One, and have a running hosted engine, turn that off for now by putting the engine into maintenance mode:

````
# hosted-engine --set-maintenance --mode=global
````

And then by either logging into your hosted engine VM and shutting it off with something like `shutdown -P now`, or, from your first host, with `hosted-engine --vm-shutdown` or with the less subtle`hosted-engine --vm-poweroff`.

Then stop the following services:

````
# systemctl stop ovirt-ha-agent && systemctl stop ovirt-ha-broker && systemctl stop vdsmd
````

You should end up with your hosted engine volume unmounted (you can check with `mount`). This is important because we're going to change the IP address it's mounted at from the address for our first host to a new, virtual IP.

## Setting up the additional pair of hosts

For convenience, I'm going to smush together as many of the steps (already covered in part one) needed to prepare our two additional CentOS 7 minimal machines to join our installation as possible. On machines **two and three**, you need to:

````
# systemctl disable firewalld && systemctl enable iptables && systemctl disable NetworkManager && systemctl stop NetworkManager && yum localinstall -y http://resources.ovirt.org/pub/yum-repo/ovirt-release35.rpm && yum install -y ovirt-hosted-engine-setup screen glusterfs-server nfs-utils vdsm-gluster system-storage-manager ctdb && systemctl reboot
````

## Configure your firewall

I left this step out of Part One, because oVirt's default firewall configuration worked "out of the box" there, but for this configuration, we'll need to update the firewall configuration on **all three** of our machines.

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
-A INPUT -p tcp -m tcp --dport 49152:49251 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 34865:34867 -j ACCEPT

# Reject any other input traffic
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -m physdev ! --physdev-is-bridged -j REJECT --reject-with icmp-host-prohibited
COMMIT
````
Reload your iptables service:

````
# systemctl reload iptables
````

## Gluster preparations

Again, a smushed-together version of the storage-setup steps I covered in part one. Assuming a new storage device for use with Gluster on each of your machines, named `/dev/vdb` (change to fit your environment), the commands would be:

````
# mkdir /gluster && ssm create -p gluster --fstype xfs -n gluster /gluster /dev/vdb && mkdir -p /gluster/{engine,data,meta}/brick && mkdir /mnt/lock && systemctl start glusterd && systemctl enable glusterd && blkid /dev/gluster/gluster 
````

Take the UUID from above and edit it into your `/etc/fstab`(s) with a line like the one below:

````
UUID=$YOUR_UUID /gluster xfs defaults 0 0
````


Now, we should be ready to add our two new machines to the Gluster trusted pool, combining them into a single Gluster trusted pool. 

````
# gluster peer probe $YOUR_SECOND_MACHINE
# gluster peer probe $YOUR_THIRD_MACHINE
````

Next, we'll convert our single machine, single brick `engine` and `data` volumes to replica three volumes that span all three hosts:

````
# gluster volume add-brick engine replica 3 $YOUR_SECOND_MACHINE:/gluster/engine/brick $YOUR_THIRD_MACHINE:/gluster/engine/brick
# gluster volume add-brick data replica 3 $YOUR_SECOND_MACHINE:/gluster/data/brick $YOUR_THIRD_MACHINE:/gluster/data/brick
````

During my tests, I found either that Gluster either wasn't replicating the data from my initial first-host brick over to the new pair of hosts I added on its own, even after I issued the `gluster volume heal engine full` command that should have spurred replication. I managed to force the sync, however.

By running `ls /gluster/engine/brick/` on my **first host**, I saw the directory and file contained in my engine volume:

````
de38fb3c-6eb4-4241-9ca8-45793d864033 __DIRECT_IO_TEST__
````

I switched to my **second host**, created a temporary mount point, mounted the engine volume, and ran `stat` on that file and directory:

````
# mkdir tmpmnt
# mount localhost:engine tmpmnt
# stat tmpmnt/de38fb3c-6eb4-4241-9ca8-45793d864033
# stat tmpmnt/__DIRECT_IO_TEST__
# umount tmpmnt
````

Finally, due to a conflict between Gluster's built-in NFS server and NFS client-locking, it's necessary to disable file locking in the `/etc/nfsmount.conf` file with the line `Lock=False` to ensure that Gluster will reliably both serve up and access the `engine` volume over NFS. Make this configuration change on **all three** machines.


## CTDB configuration

We need a new Gluster volume to use with CTDB. Make a new brick directory on your **first host**, create and start the volume, and then create a mount point and mount the volume locally. There's no need to mess with the `stat` workaround here, because (I think) this volume is beginning life as a replicated volume.

````
# mkdir -p /gluster/meta/brick
# gluster volume create meta replica 3 $YOUR_FIRST_MACHINE:/gluster/meta/brick $YOUR_SECOND_MACHINE:/gluster/meta/brick $YOUR_THIRD_MACHINE:/gluster/meta/brick 
# gluster volume start meta
# mkdir -p /mnt/lock
# mount -t glusterfs localhost:/meta /mnt/lock
````

We also need to install ctdb on our **first host**:

````
# yum install ctdb -y
````

Next, we'll set up the configuration files for ctdb. Still on your **first host**, start by editing `/mnt/lock/ctdb`:

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

Edit `/mnt/lock/nodes` to include the list of CTDB interconnect/heartbeat IPs. For our three-node install there'll be three of these. For more info on CTDB configuration, see [Configuring CTDB](https://ctdb.samba.org/configuring.html).

Next, edit `/mnt/lock/public_addresses` to include the list of virtual addresses to be hosted between the three machines (we only need one), and the network range, and the nic we're using to host this virtual address:

````
XX.XX.XX.XX/24 eth0
````

in part one of this howto, we created a host name to use for mounting our Gluster-hosted NFS share (I called mine `ovirtmount.osas.lab`) and associated that host name with the IP address of our first host. Now that we're almost ready to hand over hosting duties for that role to CTDB, we need to change our DNS or `/etc/hosts` to associate this extra host name with the virtual address specified in `/mnt/lock/public_addresses` above.

Now, we'll mount the `meta` volume, and point our CTDB configuration files at the files we've created in the shared `meta` volume. Run this series of steps on your **first machine** :

````
# mv /etc/sysconfig/ctdb /etc/sysconfig/ctdb.orig && ln -s /mnt/lock/ctdb /etc/sysconfig/ctdb && ln -s /mnt/lock/nodes /etc/ctdb/nodes && ln -s /mnt/lock/public_addresses /etc/ctdb/public_addresses && systemctl start ctdb && systemctl enable ctdb
````

Then, on machines **two and three**, run `mount -t glusterfs localhost:/meta /mnt/lock` followed by the string of commands above.

You can check the status of ctdb by running `ctdb status`, or `systemctl status ctdb`. 

Following future reboots, we'll want ctdb to start after our `meta` volume is mounted, which depends on Gluster being up and running. If the service fails for some reason, we want it to start back up. On **all three** machines, create  `/etc/systemd/system/ctdb.service`  to ask systemd to make it so:

````
[Unit]
Description=CTDB
After=mnt-lock.mount
Requires=mnt-lock.mount
Requires=glusterd.service

[Service]
Type=forking
LimitCORE=infinity
PIDFile=/run/ctdb/ctdbd.pid
ExecStart=/usr/sbin/ctdbd_wrapper /run/ctdb/ctdbd.pid start
ExecStop=/usr/sbin/ctdbd_wrapper /run/ctdb/ctdbd.pid stop
KillMode=control-group
Restart=on-failure

[Install]
WantedBy=multi-user.target
````

Then, edit `/etc/systemd/system/mnt-lock.mount` to handle the `meta` volume mounting:

````
[Unit]
Description=ctdb meta volume
Requires=glusterd.service
Before=ctdb.service

[Mount]
What=localhost:meta
Where=/mnt/lock
Type=glusterfs
Options=defaults,_netdev

[Install]
WantedBy=multi-user.target
````

## Installing the hosted engine


First we'll start the hosted engine back up on **host one**:

````
# systemctl start ovirt-ha-agent && systemctl start ovirt-ha-broker
# hosted-engine --set-maintenance --mode=none
````

Then, wait for a few minutes for the hosted engine to come back up. If you'd like, fire up `tail -f /var/log/ovirt-hosted-engine-ha/agent.log` to watch its progress. You can get less verbose progress-checking by running `hosted-engine --vm-status` periodically.

Once the engine is back up and available, head to your **second** machine to configure it as a second host for our oVirt management server:

````
# screen
# hosted-engine --deploy
````

As with the first machine, the script will ask for the storage type we wish to use. Just as before, answer `nfs3` and then provide the information for your NFS share. In my case, this is `ovirtmount.osas.lab:/engine`. 

After accessing your storage, the script will detect that there's an existing hosted engine instance, and ask whether you're setting up an additional host. Answer yes, and when the script asks for a Host ID, make it `2`. The script will then ask for the IP address and root password of your first host, in order to access the rest of the settings it needs. 

When the installation process completes, head over to your **third machine** and perform the same steps you did w/ your second host, substituting `3` for the Host ID.

I found that the installer reset my iptables rules, so on both the second and third hosts, I moved the iptables rules that the installer replaced (but, considerately, backed up) back into place. On my machines, the command looked like this:

````
# mv /etc/sysconfig/iptables.20141112134450 /etc/sysconfig/iptables
# systemctl reload iptables
````

## Maintenance, failover, and storage

Once you have everything set up, you should be able to power cycle all three machines and, after a few minutes, have your hosted engine and full oVirt installation back up and running without intervention. 

You can bring a single machine down for maintenance by first putting the system into maintenance mode from the oVirt console, and updating, rebooting, shutting down, etc. as desired. 

If you bring down two machines at once, you'll run afoul of the Gluster quorum rules that guard us from split-brains states in our storage, and the volumes served by your remaining host will go read-only.

Triple replication is necessary for our hosted engine volume and for the master data volume, but can create additional storage domains that live on just one of your hosts, or distributed across all of them. 

Within an oVirt data center, it's easy to migrate VM storage from one data domain to another, so you could save on replication traffic overhead with domains hosted from different Gluster volume types, shuttling disks around as needed when it's time to bring one of your storage hosts down.

## Till next time

If you run into trouble following this walkthrough, I’ll be happy to help you get up and running or get pointed in the right direction. On IRC, I’m jbrooks, ping me in the #ovirt room on OFTC, write a comment below, or give me a shout on Twitter [@jasonbrooks](https://twitter.com/jasonbrooks).

If you’re interested in getting involved with the oVirt Project, you can find all the mailing list, issue tracker, source repository, and wiki information you need [here](http://www.ovirt.org/Community).
