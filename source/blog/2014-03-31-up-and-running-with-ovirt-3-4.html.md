---
author: jbrooks
comments: true
date: 2014-03-31 16:46 UTC
layout: post
slug: up-and-running-with-ovirt-3-4
title: Up and Running with oVirt 3.4
categories:
- Blog
tags:
- Fedora
- ovirt
- virtualization
---
[![](blog/oVirt-logo.png){:align=right}](http://www.ovirt.org)Last week, the oVirt Project [delivered a new version](http://lists.ovirt.org/pipermail/announce/2014-March/000098.html) of its open source virtualization management system, complete with a feature I've eagerly awaited for the past two years. The feature, called [Hosted Engine](http://www.ovirt.org/OVirt_3.4_Release_Notes#Hosted_Engine), enables oVirt admins to host the system's management server (aka the engine) on one of the virtualization hosts it manages.

While oVirt was designed to run across separate management and virtualization hosts, it's been possible from early on (version 3.0) to [hack up a machine](http://blog.jebpages.com/archives/how-to-get-up-and-running-with-ovirt/) to serve both roles. In subsequent releases, the project approved and refined this installation option into an easy-to-use All-in-One (AIO) installation plugin.

The problem with AIO is that it leaves you with one of your most important workloads (the oVirt engine) stuck running on a single piece of hardware, where it can't easily be moved around -- a very un-virt scenario. Hosted Engine gives those of us interested in getting oVirt rolling on a single server a new deployment option, and one that promises to scale out more nicely than possible with the AIO plugin.

In this post, I'm going to walk through the installation and first steps of a basic oVirt install using the Hosted Engine feature.

READMORE

## Prerequisites

__Hardware:__ You’ll need a machine with at least 4GB RAM and processors with [hardware virtualization extensions](http://en.wikipedia.org/wiki/X86_virtualization#Hardware-assisted_virtualization). A physical machine is best, but you can test oVirt using [nested KVM](/testing-ovirt-3-3-with-nested-kvm/) as well.

__Software:__ oVirt 3.4 runs on the 64-bit editions of Fedora 19 or Red Hat Enterprise Linux 6.5 (or on an up-to-date version of one of the RHEL-based Linux distributions such as CentOS or Scientific Linux).

__Network:__ Your test machine’s host name must resolve properly, either through your network’s DNS, or through the /etc/hosts file on your virt host(s), on the VM that will host the oVirt engine, and on any clients from which you plan on administering oVirt.

__Storage:__ The hosted engine feature requires NFS storage to house the VM that will host the engine. For this walkthrough, I'll be using an external NFS server for this -- I'll examine the topic of a setup with [fully-converged storage, courtesy of GlusterFS](/blog/2014/05/ovirt-3-4-glusterized/), in a separate post.

## Installing oVirt with Hosted Engine

I'm starting out with a test machine with 8GB of RAM and 4 processor cores, running CentOS 6.5 with all updates applied. I've identified three IP addresses on my network to use for this test (one for my first host, one for the hosted engine, and one for my second host), and I've edited the /etc/hosts file on my first host so that these addresses will resolve properly:

```
10.10.10.1 ovirt34.osas.lab
10.10.10.2 ovirt-hosted.osas.lab
10.10.10.3 ovirt34-2.osas.lab
```

First, we need to configure the oVirt software repository on the first host:

```
sudo yum localinstall -y http://ovirt.org/releases/ovirt-release.noarch.rpm
```

Because I'm using CentOS, I must also configure the EPEL repository:

```
sudo yum localinstall -y http://ftp.osuosl.org/pub/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
```

_(If you're using Fedora, you'll need to enable the virt-preview repo, as well, by editing "/etc/yum.repos.d/fedora-virt-preview.repo")_

Next, install the hosted engine packages, along with [screen](http://www.gnu.org/software/screen/), which can come in handy during the deployment process:

```
sudo yum install -y ovirt-hosted-engine-setup screen
```

Decide on your installation media for the VM that will host your engine. PXE, ISO image, and OVF-formatted disk image are your installation options. Here, I'm using an ISO image, and creating a temporary directory to which oVirt will have access to house the image during the install process:

```
mkdir /home/tmp && cd /home/tmp
curl -O http://mirrors.kernel.org/centos/6.5/isos/x86_64/CentOS-6.5-x86_64-minimal.iso
chown -R 36:36 /home/tmp
```

I mentioned that the hosted engine requires NFS storage. I started and enabled rpcbind and nfslock on my host to allow the installer to mount my NFS share:

```
sudo service rpcbind start && sudo chkconfig rpcbind on
sudo service nfslock start && sudo chkconfig nfslock on
```

Fire up screen and kick off the installation process:

```
screen
hosted-engine --deploy
```

Follow along with the script, answering its questions. The default answers are fine, but you'll need to supply the path to your NFS share, the type and path to the media you'll be using to install your engine-hosting VM, the host name you've picked out for the hosted engine, and the password you'll be using for the engine admin user.

![](blog/ovirt34-deploy-host-1.png){:align=center}

Once you've supplied all these answers, and confirmed your choices, the installer will launch a VM and provide you with an address and password for accessing the VM with the vnc client of your choice. Fire up a vnc client, enter the address provided and enter the password provided to access the VM.

![](blog/ovirt34-deploy-host-1a.png){:align=center}

From here, you can click your way through the installation of your engine-hosting VM. You can configure the VM's correct host name and IP address either now, or after you boot into the VM for the first time. As for software choices, you can simply opt for a "minimal" installation.

When the OS installation on your new VM is complete, head back to the terminal window where `hosted-engine --deploy` is running, and hit enter to let the script know that you're ready for the next step.

![](blog/ovirt34-deploy-host-1b.png){:align=center}

The VM will reboot, and when it's back up, it's time to install oVirt engine. Either through vnc or through an ssh session (ssh is nicer for copying and pasting commands), access your newly-created VM, and ensure that everything is in order.

* If needed, modify /etc/hosts in the new VM with the same IP address / host name mappings we set up on the first host.
* If you didn't take care of it during the OS installation, fix your network settings to give the VM the correct host name and IP address, as well.
* Apply all updates to the VM, and reboot if needed. If you do reboot the VM, go back to the terminal where you're running `hosted-engine --deploy` and select option 2, "Power off and restart the VM."

Now, just as we did on our first host, we need to configure the oVirt and EPEL software repositories on our hosted engine VM:

```
sudo yum localinstall -y http://ovirt.org/releases/ovirt-release.noarch.rpm
sudo yum localinstall -y http://ftp.osuosl.org/pub/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
```

Next, we'll install and then set up ovirt-engine:

```
sudo yum install -y ovirt-engine
sudo engine-setup
```

![](blog/ovirt34-configure-engine-1.png){:align=center}

Go through the engine-setup script, answering its questions. You'll be fine accepting all the default answers, but make sure to supply the same admin password that you chose earlier, while running `hosted-engine --deploy`.

When the installation process completes, head back to the terminal where you're running the hosted engine installer and hit enter to indicate that the engine configuration is complete.

The installer will register itself as a virtualization host on the oVirt engine instance we've just installed. Once this completes, the installer will tell you to shut down your VM so that the ovirt-engine-ha services on the first host can restart the engine VM as a monitored service.

![](blog/ovirt34-configure-engine-1a.png){:align=center}

It can take a few minutes for the HA services to notice that the engine is down, to check that there's a machine available to host the engine, and to start up the hosted engine VM. You can watch these services do their thing by tailing their log files:

```
sudo tail -f /var/log/ovirt-hosted-engine-ha/*
```

Once that process is complete, the script will exit and you should be ready to configure storage and run a VM.

## Configuring Storage

Another handy new feature in oVirt 3.4 is a [simpler model](http://www.ovirt.org/OVirt_3.4_Release_Notes#Storage) for Data Center storage types. In previous versions, each Data Center in oVirt was tied to a specific sort of shared storage: NFS, iSCSI, GlusterFS, etc. Now, Data Centers in oVirt are either Local or Shared, and shared storage Data Centers can include multiple types of storage domains.

I point this out because, when setting up our first storage domain (the storage on which the hosted VM lives always remains separate from the rest of your data domains) it's not necessary to commit to one storage type.

I used an external NFS server for my hosted engine storage, and I'll use another share on that same server for the data domain that will host my VM images.

Head to your oVirt engine console at the address of your hosted engine VM, log in with the user name `admin` and the password you chose during setup, and visit the "Storage" tab in the console.

Click "New Domain," give your new domain a name, and choose Data / NFS from the "domain function / storage type" drop down menu. (If you have another storage type available, you can choose that, instead.)

In the "Export Path" field, enter the remote path to your NFS share, and hit the OK button to proceed. It'll take a bit of time for your new storage domain to initialize and come online, but once it does, you'll be ready to launch your first VM.

![](blog/ovirt34-configure-storage-1.png){:align=center}

## Running Your First VM

oVirt 3.3 [gained the ability](http://www.ovirt.org/OVirt_3.3_release_notes#OpenStack_Integration) to use OpenStack's image server, Glance, as a source of VM images. With 3.4, oVirt engine comes pre-configured with a public Glance instance managed by the oVirt project. We'll tap this resource to launch our first VM.

From the storage tab, you should see an "ovirt-image-repository" entry next to a little OpenStack logo. Clicking on this domain will bring up a menu of images available in this repository. Click on the "CirrOS" image (which is very small and perfect for testing) in the list and then click "Import," before hitting the OK button in the pop-up dialog to continue.

![](blog/ovirt34-run-vm-1.png){:align=center}

The image will be copied from the oVirt project's public Glance repository to the storage domain you just configured, where it will be available as a disk to attach to a new VM. In the import image dialog, you have the option of clicking the "Import as Template" check box to give yourself the option of basing multiple future VMs on this image using oVirt's templates functionality.

Next, head to the "Virtual Machines" tab in the console, click "New VM," choose "Linux" from the "Operating System" drop down menu, supply a name for your VM, and choose the "ovirtmgmt/ovirtmgmt" network in the drop down menu next to "nic1" before hitting the "OK" button. For additional configuration, such as setting RAM and CPU values and using cloud-init, there's a "Show Advanced Options" button in the dialog, but you can revisit that later.

![](blog/ovirt34-run-vm-1a.png){:align=center}

Next you'll get a "Guide Me" dialog box that will ask you to configure a virtual disk. Click the "Configure Virtual Disks" button, check the "Attach Disk" box at the upper left part of the dialog, select the Glance disk image we just downloaded, and hit the "OK" button to continue. Dismiss the "Guide Me" dialog by hitting the "Configure Later" button.

![](blog/ovirt34-run-vm-1b.png){:align=center}

![](blog/ovirt34-run-vm-1c.png){:align=center}

Now, back at the Virtual Machines list, right-click your new VM, and choose "Run" from the menu. After a few moments, the status of your new VM will switch from red to green, and you'll be able to click on the green monitor icon next to “Migrate” to open a console window and access your VM.

![](blog/ovirt34-run-vm-1d.png){:align=center}

## Installing a Second Host

Installing a second host to perform virtualization duties and share in the hosting of the oVirt engine itself is similar to setting up the first host, but simpler because our hosted engine is already up and running.

Start out with another machine that meets the same requirements (hardware, software, network) listed above for the first virt host.

Next, install the packages you need and start services for NFS mount:

```
sudo yum install -y http://ovirt.org/releases/ovirt-release.noarch.rpm` `&&` `sudo yum install -y http://ftp.osuosl.org/pub/fedora-epel/6/i386/epel-release-6-8.noarch.rpm` `&&` `sudo yum install -y screen ovirt-hosted-engine-setup` `&&` `sudo service rpcbind start` `&&` `sudo chkconfig rpcbind on` `&&` `sudo service nfslock start` `&&` `sudo chkconfig nfslock on
```

Deploy the second host:

```
screen
sudo hosted-engine --deploy
```

Again, follow the prompts, supplying your NFS share information for the hosted engine.

When your second machine reaches the NFS share, it will recognize an existing data domain and ask if you're installing a second host. Answer Yes, and assign this host number 2. The installer will ask for the address and credentials from your first host in order to fetch the rest of the setup answers it requires.

Once the process completes, and the ha services on your hosts have time to scope each other out, you should be able to see your second host's report itself as ready for hosted engine duty in the "General" tab of its lower pane in the oVirt admin console.

![](blog/ovirt34-second-host-1.png){:align=center}

With two hosts qualified to host the engine, you can live migrate the HostedEngine between the hosts, in order, for instance, to bring down one host for maintenance. Which brings us to...

## Maintenance

The ovirt-hosted-ha agent and broker that run on each of your hosts keep tabs on where your engine is running, and which hosts are viable locations relocating the host, if need be.

You can signal that one of your hosts shouldn't be used for hosting the engine, because, for instance, it's ungoing maintenance, you can run the command:

```
hosted-engine  --set-maintenance --mode=local
```

To put your whole setup into maintenance mode, you can run the command:

```
hosted-engine  --set-maintenance --mode=global
```

You should do this before performing updates on the engine, so that when the engine goes down for the update, your hosts don't mistakenly swing into action to rectify the planned downtime.

To return the system to normal condition, run the command:

```
hosted-engine  --set-maintenance --mode=none
```

## Till Next Time

That's enough for this post. If you run into trouble following this walkthrough, I’ll be happy to help you get up and running or get pointed in the right direction. On IRC, I’m jbrooks, ping me in the #ovirt room on OFTC or write a comment below.

Stay tuned for a followup post about [GlusterFS & converged storage](/blog/2014/05/ovirt-3-4-glusterized/).

If you’re interested in getting involved with the oVirt Project, you can find all the mailing list, issue tracker, source repository, and wiki information you need [here](http://www.ovirt.org/Community).

Finally, be sure to follow us on Twitter at [@redhatopen](https://twitter.com/redhatopen) for news on oVirt and other open source projects in the Red Hat world.
