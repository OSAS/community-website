---
title: Up and Running with oVirt 3.5
author: jbrooks
date: 2014-10-29 13:00:00 UTC
tags: centos, ovirt, gluster, virtualization
comments: true
published: true
---

[![](blog/oVirt-logo.png){:align="right"}](http://www.ovirt.org)
Last week, version 3.5 of oVirt, the open source virtualization management system, [hit FTP mirrors](http://lists.ovirt.org/pipermail/announce/2014-October/000138.html) sporting a slate of fixes and enhancements, including a new-look user interface, and support for using CentOS 7 machines as virtualization hosts.

As with every new oVirt release, I'm here to suggest a path to getting up and running with the project on single server, with an option for expanding to additional machines in the future. First, though, a quick rundown of the different single-machine options for trying out oVirt:

* [oVirt Live ISO](http://www.ovirt.org/OVirt_Live): A LiveCD image that you can burn onto a blank CD or copy onto a USB stick to boot from and run oVirt. This is probably the fastest way to get up and running, but once you're up, this is probably your lowest-performance option, and not suitable for extended use or expansion.
* [oVirt All in One plugin](http://www.ovirt.org/Feature/AllInOne): Run the oVirt management server and virtualization host components on a single machine with local storage. This is a more permanent version of the Live ISO approach, and [had been](/blog/2013/09/up-and-running-with-ovirt-3-3/) my favored kick-the-tires option until the rise of...
* [oVirt Hosted Engine](http://www.ovirt.org/Features/Self_Hosted_Engine): The self-hosted engine approach consists of an oVirt virtualization host that serves up its own management engine. This route is a bit more complicated than those above, but I like it because:
  * oVirt 3.5 supports CentOS 7 as a virtualization host, but not as a host for the management engine. Running oVirt Engine in a separate VM allows you to put CentOS 7 on your metal, and keep CentOS 6 around for the engine.
  * With the All-in-One approach, your management engine is married to the machine it's installed on, limiting your expansion options. The Hosted Engine can move among hosts.
  
For this howto, I'll be walking through the steps you can follow to get oVirt 3.5 up and running on a single machine with a self-hosted engine, and with self-hosted storage, courtesty of GlusterFS. 

In my [next post](/blog/2014/11/up-and-running-with-ovirt-3-5-part-two/), I'll describe how to add two more machines to the mix to give yourself an installation hardy enough to bring a machine down for updates and maintainence without everything grinding to a halt.

If you have access to good external NFS or iSCSI storage to use with your oVirt exploration, I'll point out where you can skip the GlusterFS bits and use your external storage resource.

**IMPORTANT NOTE:** 

I want to stress that this converged virtualization and storage scenario is a bleeding-edge configuration. Many of the ways you might use oVirt and Gluster are available in commercially-supported configurations using RHEV and RHS, but at this time, this oVirt+Gluster mashup isn't one of them. What's more, this configuration is not "supported" by the oVirt project proper, a state that should change somewhat in oVirt 3.6, which is set to include an official [converged setup option](http://www.ovirt.org/Features/Self_Hosted_Engine_Hyper_Converged_Gluster_Support).

I do use this converged setup in my own lab, and it does work reliably for me, but for a multi-host setup it's crucial to use three (not two) gluster replicas, and it's important that you use CTDB, or something like it, to provide for automated IP failover. While it may seem reasonable to simply use "localhost" as the NFS mount point for the hosted engine storage, and rely on Gluster to handle the replication between the servers, this will lead to split brain issues.

READMORE

## Prerequisites

__Hardware:__ You’ll need a machine with at least 4GB RAM and processors with [hardware virtualization extensions](http://en.wikipedia.org/wiki/X86_virtualization#Hardware-assisted_virtualization). A physical machine is best, but you can test oVirt using [nested KVM](http://community.redhat.com/testing-ovirt-3-3-with-nested-kvm/) as well.

__Software:__ For this howto, I'm using CentOS 7 for the host and CentOS 6 for the Engine VM. oVirt does support other OS options. For more info see the project's [download page](http://www.ovirt.org/Download).

__Network:__ Your test machine’s host name must resolve properly, either through your network’s DNS, or through the /etc/hosts file on your virt host(s), on the VM that will host the oVirt engine, and on any clients from which you plan on administering oVirt.

__Storage:__ The hosted engine feature requires NFS or iSCSI storage to house the VM that will host the engine. For this walkthrough, I'll be using a Gluster-based NFS share hosted from my test machine. If you prefer to use external iSCSI or NFS storage, that'll work, too.

## Installing oVirt with hosted engine

I'm starting out with a test machine with 8 GB of RAM and 4 processor cores, running a minimal installation of CentOS 7 with all updates applied. 

I've identified a pair of static IP address on my network to use for this test (one for my first host, and one for the hosted engine), and I've edited the /etc/hosts file on my test machine so that these addresses will resolve properly. 

I'm also adding a second host name, `ovirt-mount.osas.lab`, to use as my NFS mount point -- this will come in handy for my next post, when I'll have multiple machines sharing the NFS-hosting duties over a common virtual IP:

```
10.10.10.1 ovirt-one.osas.lab ovirtmount.osas.lab
10.10.10.2 ovirt-test.osas.lab
```
The oVirt 3.5 release notes suggest disabling NetworkManager and firewalld in favor of the tried and true network and iptables services:

````
# systemctl disable firewalld && systemctl stop firewalld
# systemctl disable NetworkManager && systemctl stop NetworkManager
````

Next, we need to configure the oVirt software repository on the first host:

```
# yum localinstall -y http://resources.ovirt.org/pub/yum-repo/ovirt-release35.rpm
```
Next, install the hosted engine packages, along with [screen](http://www.gnu.org/software/screen/), which can come in handy during the deployment process:

```
# yum install -y ovirt-hosted-engine-setup screen glusterfs-server nfs-utils vdsm-gluster system-storage-manager
```

_I'm experiencing an SELinux issue in which glusterd isn't functional until after a reboot, so go ahead and reboot after installing these packages._

## Gluster preparations

We need a partition to store our Gluster bricks. For simplicity, I'm using a single XFS partition, and my Gluster bricks will be directories within this partition. I use system-storage-manager to manage my storage.

_If you're skipping the local Gluster storage, and using external NFS or iSCSI storage, you can skip this step._ 

````
# ssm add -p gluster $YOUR_DEVICE_NAME
# ssm create -p gluster --fstype xfs -n gluster
````

Next, modify your `/etc/fstab` to add the new partition:

````
# mkdir /gluster
# blkid /dev/gluster/gluster
````

Edit your `/etc/fstab` and add a line like the one below before running `mount -a` to mount your new partition:

````
UUID=$YOUR_UUID /gluster xfs defaults 0 0
````

Next, we'll create some mount points for our Gluster volumes-to-be. We'll have separate Gluster volumes for our hosted engine, and for our oVirt data domain:

````
# mkdir -p /gluster/{engine,data}/brick
````

Now start the Gluster service and configure it to auto-start after subsequent reboots:

````
# systemctl start glusterd && systemctl enable glusterd
````

Next, we create our gluster volumes, substituting your machine's hostname:

````
# gluster volume create engine $HOSTNAME:/gluster/engine/brick
# gluster volume create data $HOSTNAME:/gluster/data/brick
````

Now, apply a set of virt-related volume options to our engine and data volumes:

````
# gluster volume set engine group virt
# gluster volume set data group virt
````

We also need to set the correct permissions on all our volumes:

````
#  gluster volume set engine storage.owner-uid 36 && gluster volume set engine storage.owner-gid 36
# gluster volume set data storage.owner-uid 36 && gluster volume set data storage.owner-gid 36
````

Finally, we need to start our volumes:

````
# gluster volume start engine
# gluster volume start data
````

Before moving ahead, run `gluster volume status` to make sure that the NFS server associated with your `engine` volume is up and running, because we're about to need it.

Due to a conflict between Gluster's built-in NFS server and NFS client-locking, it's necessary to disable file locking in the `/etc/nfsmount.conf` file with the line `Lock=False` to ensure that Gluster will reliably both serve up and access the engine volume over NFS.

## Installing the hosted engine

PXE, ISO image, and OVF-formatted disk image are our installation media options for the VM that will host our engine. Here, I'm using an ISO image, and creating a temporary directory to which oVirt will have access to house the image during the install process:

```
# mkdir /home/tmp && cd /home/tmp
# curl -O http://mirrors.kernel.org/centos/6.6/isos/x86_64/CentOS-6.6-x86_64-minimal.iso
# chown -R 36:36 /home/tmp
```

Now we should be ready to fire up `screen` and kick off the installation process:

````
# screen
# hosted-engine --deploy
````

Follow along with the script, answering its questions. The default answers are fine, but you'll need to supply the path to your NFS share, the type and path to the media you'll be using to install your engine-hosting VM, the host name you've picked out for the hosted engine, and the password you'll be using for the engine admin user.

My NFS path looks like `ovirtmount.osas.lab:/engine`. I'm using that secondary host name I mentioned earlier in the howto, the hosting of which will, in the next post, be shared among my virt+storage machines.


![](blog/ovirt34-deploy-host-1.png){:align="center"}

Once you've supplied all these answers, and confirmed your choices, the installer will launch a VM and provide you with an address and password for accessing the VM with the vnc client of your choice. Fire up a vnc client, enter the address provided and enter the password provided to access the VM.

From here, you can click your way through the installation of your engine-hosting VM. You can configure the VM's correct host name and IP address either now, or after you boot into the VM for the first time. As for software choices, you can simply opt for a "minimal" installation.

When the OS installation on your new VM is complete, head back to the terminal window where `hosted-engine --deploy` is running, and hit enter to let the script know that you're ready for the next step.

![](blog/ovirt34-deploy-host-1b.png){:align="center"}

The VM will reboot, and when it's back up, it's time to install oVirt engine. Either through vnc or through an ssh session (ssh is nicer for copying and pasting commands), access your newly-created VM, and ensure that everything is in order.

* If needed, modify /etc/hosts in the new VM with the same IP address / host name mappings we set up on the first host.
* If you didn't take care of it during the OS installation, fix your network settings to give the VM the correct host name and IP address, as well.
* Apply all updates to the VM, and reboot if needed. If you do reboot the VM, go back to the terminal where you're running `hosted-engine --deploy` and select option 2, "Power off and restart the VM."

Now, just as we did on our first host, we need to configure the oVirt software repository on our hosted engine VM:

````
# yum localinstall -y http://resources.ovirt.org/pub/yum-repo/ovirt-release35.rpm
````

Next, we'll install and then set up ovirt-engine:

```
# yum install -y ovirt-engine
# engine-setup
```

![](blog/ovirt34-configure-engine-1.png){:align="center"}

Go through the engine-setup script, answering its questions. You'll be fine accepting all the default answers, but make sure to supply the same admin password that you chose earlier, while running `hosted-engine --deploy`.

When the installation process completes, head back to the terminal where you're running the hosted engine installer and hit enter to indicate that the engine configuration is complete.

The installer will register itself as a virtualization host on the oVirt engine instance we've just installed. Once this completes, the installer will tell you to shut down your VM so that the ovirt-engine-ha services on the first host can restart the engine VM as a monitored service.

![](blog/ovirt34-configure-engine-1a.png){:align="center"}

It can take a few minutes for the HA services to notice that the engine is down, to check that there's a machine available to host the engine, and to start up the hosted engine VM. You can watch these services do their thing by tailing their log files:

```
# tail -f /var/log/ovirt-hosted-engine-ha/*
```

Once that process is complete, the script will exit and you should be ready to configure storage and run a VM.

## Configuring storage

Head to your oVirt engine console at the address of your hosted engine VM, log in with the user name `admin` and the password you chose during setup, and visit the "Storage" tab in the console.

Click "New Domain," give your new domain a name, and choose Data / GlusterFS from the "domain function / storage type" drop down menu. (If you're using a different sort of external storage, you can choose an option matching that, instead.)

In the "Export Path" field, enter the remote path to your Gluster volume, and hit the OK button to proceed. It'll take a bit of time for your new storage domain to initialize and come online, but once it does, you'll be ready to launch your first VM.

![](blog/ovirt34-configure-storage-1.png){:align="center"}

## Running your first VM

Since version 3.4, oVirt engine has come pre-configured with a public Glance instance managed by the oVirt project. We'll tap this resource to launch our first VM.

From the storage tab, you should see an "ovirt-image-repository" entry next to a little OpenStack logo. Clicking on this domain will bring up a menu of images available in this repository. Click on the "CirrOS" image (which is very small and perfect for testing) in the list and then click "Import," before hitting the OK button in the pop-up dialog to continue.

![](blog/ovirt34-run-vm-1.png){:align="center"}

The image will be copied from the oVirt project's public Glance repository to the storage domain you just configured, where it will be available as a disk to attach to a new VM. In the import image dialog, you have the option of clicking the "Import as Template" check box to give yourself the option of basing multiple future VMs on this image using oVirt's templates functionality.

Next, head to the "Virtual Machines" tab in the console, click "New VM," choose "Linux" from the "Operating System" drop down menu, supply a name for your VM, and choose the "ovirtmgmt/ovirtmgmt" network in the drop down menu next to "nic1" before hitting the "OK" button. For additional configuration, such as setting RAM and CPU values and using cloud-init, there's a "Show Advanced Options" button in the dialog, but you can revisit that later.

![](blog/ovirt34-run-vm-1a.png){:align="center"}

Next you'll get a "Guide Me" dialog box that will ask you to configure a virtual disk. Click the "Configure Virtual Disks" button, check the "Attach Disk" box at the upper left part of the dialog, select the Glance disk image we just downloaded, and hit the "OK" button to continue. Dismiss the "Guide Me" dialog by hitting the "Configure Later" button.

![](blog/ovirt34-run-vm-1b.png){:align="center"}

![](blog/ovirt34-run-vm-1c.png){:align="center"}

Now, back at the Virtual Machines list, right-click your new VM, and choose "Run" from the menu. After a few moments, the status of your new VM will switch from red to green, and you'll be able to click on the green monitor icon next to “Migrate” to open a console window and access your VM.

![](blog/ovirt34-run-vm-1d.png){:align="center"}


## Till next time

That's enough for this post. If you run into trouble following this walkthrough, I’ll be happy to help you get up and running or get pointed in the right direction. On IRC, I’m jbrooks, ping me in the #ovirt room on OFTC, write a comment below, or give me a shout on Twitter [@jasonbrooks](https://twitter.com/jasonbrooks).

Stay tuned for a [followup post](/blog/2014/11/up-and-running-with-ovirt-3-5-part-two/) about adding two more machines to our oVirt+Gluster setup, so that you can bring down one of the machines for maintenance or upgrades without having to shut the whole thing down.

If you’re interested in getting involved with the oVirt Project, you can find all the mailing list, issue tracker, source repository, and wiki information you need [here](http://www.ovirt.org/Community).

Finally, be sure to follow us on Twitter at [@redhatopen](https://twitter.com/redhatopen) for news on oVirt and other open source projects in the Red Hat world.