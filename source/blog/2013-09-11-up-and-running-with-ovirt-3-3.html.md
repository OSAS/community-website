---
author: jbrooks
comments: true
date: 2013-09-11 16:46:31+00:00
layout: post
slug: up-and-running-with-ovirt-3-3
title: Up and Running with oVirt 3.3
wordpress_id: 391
categories:
- Blog
tags:
- Fedora
- gluster
- ovirt
- virtualization
---

{:.alert.alert-warning}
There's [a new version of "Up and running with oVirt"](/blog/2014/03/up-and-running-with-ovirt-3-4/),
updated for oVirt 3.4.

The [oVirt Project](https://twitter.com/redhatopen) is now putting the finishing touches on version 3.3 of its KVM-based virtualization management platform. The release will be feature-packed, including expanded support for Gluster storage, new integration points for OpenStack’s [Neutron networking](http://www.youtube.com/watch?v=S16AfFylcHk) and [Glance image](http://www.youtube.com/watch?v=_Nyi1xyiQnY) services, and a raft of new [extensibility and usability upgrades](http://www.ovirt.org/OVirt_3.3_release_notes).

oVirt 3.3 also sports an overhauled All-in-One (AIO) setup plugin, which makes it easy to get up and running with oVirt on a single machine to see what oVirt can do for you.

## Prerequisites

  * **Hardware**: You’ll need a machine with at least 4GB RAM and processors with hardware virtualization extensions. A physical machine is best, but you can test oVirt effectively using [nested KVM](/testing-ovirt-3-3-with-nested-kvm/) as well.

  * **Software**: oVirt 3.3 runs on the 64-bit editions of Fedora 19 or Red Hat Enterprise Linux 6.4 (or on the equivalent version of one of the RHEL-based Linux distributions such as CentOS or Scientific Linux).

  * **Network**: Your test machine’s domain name must resolve properly, either through your network’s DNS, or through the /etc/hosts files of your test machine itself and through those of whatever other nodes or clients you intend to use in your installation.On Fedora 19 machines with a static IP address (dhcp configurations appear not to be affected), you must disable NetworkManager for the AIO installer to run properly [[BZ](https://bugzilla.redhat.com/show_bug.cgi?id=1001186)]:

    ```
    $> sudo systemctl stop NetworkManager.service
    $> sudo systemctl mask NetworkManager.service
    $> sudo service network start
    $> sudo chkconfig network on
    ```

Also, check the configuration file for your interface (for instance, `/etc/sysconfig/network-scripts/ifcfg-eth0`) and remove the trailing zero from `GATEWAY0` `IPADDR0` and `NETMASK0` as this syntax appears only to work while NetworkManager is enabled. [[BZ](https://bugzilla.redhat.com/show_bug.cgi?id=911949)]


  * All parts of oVirt _should_ operate with SELinux in enforcing mode, but SELinux bugs do surface. At the time that I’m writing this, the Glusterization portion of this howto requires that SELinux be put in permissive mode. Also, the All in One install on CentOS needs SELinux to be in permissive mode to complete.You can put selinux in permissive mode with the command:

    `sudo setenforce 0`

To make the shift to permissive mode persist between reboots, edit `/etc/sysconfig/selinux` and change `SELINUX=enforcing` to `SELINUX=permissive`.

* * *

## Install & Configure oVirt All in One

{:.steps}
  1. Run one of the following commands to install the oVirt repository on your test machine.


      1. _For Fedora 19:_

              $ sudo yum localinstall http://ovirt.org/releases/ovirt-release-fedora.noarch.rpm -y


      2. _For RHEL/CentOS 6.4 (also requires EPEL):_

              $ sudo yum localinstall http://resources.ovirt.org/releases/ovirt-release-el6-8-1.noarch.rpm -y
              $ sudo yum localinstall http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm -y

  2. Next, install the oVirt All-in-One setup plugin:

          $> sudo yum install ovirt-engine-setup-plugin-allinone -y


  3. Run the engine-setup installer. When asked whether to configure VDSM on the host, answer yes. You should be fine accepting the other default values.


          $> sudo engine-setup

      ![engine-setup33.png](blog/engine-setup33.png)

      Once the engine-setup script completes, you’ll have a working management server that doubles as a virtualization host. The script sets up a local storage domain for hosting VM images, and an iso domain for storing iso images for installing operating systems on the VMs you create.


  4. Before we leave the command line and fire up the oVirt Administrator Portal, we’re going to create one more storage domain: an export domain, which oVirt uses for ferrying VM images and templates between data centers.We can do this by creating the export domain mount point, setting the permissions properly, copying and tweaking the configuration files that engine-setup created for the iso domain, and reloading nfs-server:

          $> sudo mkdir /var/lib/exports/export
          $> sudo chown 36:36 /var/lib/exports/export


      1. _For Fedora:_

              $> sudo cp /etc/exports.d/ovirt-engine-iso-domain.exports /etc/exports.d/ovirt-engine-export-domain.exports

          In _ovirt-engine-export-domain.exports_ Change "iso" to "export"

              $> sudo vi /etc/exports.d/ovirt-engine-export-domain.exports

              $> sudo service nfs-server reload


      2. _For RHEL/CentOS:_

              $> sudo vi /etc/exports

          In /etc/exports append the line:

              /var/lib/exports/export    0.0.0.0/0.0.0.0(rw)

          Restart the NFS service:

              $> sudo service nfs reload


  5. Now, fire up your Web browser, visit the address your oVirt engine machine, and click the "Administrator Portal" link. Log in with the user name "admin" and the password you entered during engine-setup.

      ![admin-portal-login33.png](blog/admin-portal-login33.png)

      ![admin-portal-login-a33.png](blog/admin-portal-login-a33.png)

      Once logged into the Administrator Portal, click the "Storage" tab, select your ISO_DOMAIN, and visit the the "Data Center" tab in the bottom half of the screen. Next, click the "Attach" link, check the check box next to "local_datacenter," and hit "OK." This will attach the storage domain that houses your ISO images to your local datacenter.

      ![storage-tab33.png](blog/storage-tab33.png)

      ![attach-iso33.png](blog/attach-iso33.png)

      Next, we’ll create and activate our export domain. From the "Storage" tab, click "New Domain," give the export domain a name (I’m using EXPORT_DOMAIN), choose "local_datacenter" in Data Center drop down menu, choose "Export / NFS" from "Domain Function / Storage Type" drop down menu, enter your oVirt machine IP / FQDN :/var/lib/exports/export in the Export Path, and click OK.

      ![new-export-domain33.png](blog/new-export-domain33.png)


  6. Before we create a VM, let’s head back to the command line and upload an iso image that we can use to install an OS on the VM we create.Download an iso image:

          $> curl -O http://mirrors.kernel.org/fedora/releases/19/Fedora/x86_64/iso/Fedora-19-x86_64-netinst.iso

      Upload the image into your iso domain (the password is the same as for the Administrator Portal):

          $> engine-iso-uploader upload -i ISO_DOMAIN Fedora-19-x86_64-netinst.iso


  7. Now we’re ready to create and run a VM. Head back to the oVirt Administrator Portal, visit the "Virtual Machines" tab, and click "New VM." In the resulting dialog box, give your new instance a name and click "OK."

      ![new-VM33.png](blog/new-VM33.png)

      In the "New Virtual Machine - Guide Me" dialog that pops up next, click "Configure Virtual Disks," enter a disk size, and click "OK." Hit "Configure Later" to dismiss the Guide Me dialog.

      ![add-disk33.png](blog/add-disk33.png)

      Next, select your newly-created VM, and click "Run Once." In the dialog box that appears, expand "Boot Options," check the "Attach CD" check box, choose your install iso from the drop down, and hit "OK" to proceed.

      ![run-once33.png](blog/run-once33.png)

      After a few moments, the status of your new vm will switch from red to green, and you can click on the green monitor icon next to "Migrate" to open a console window.

      ![run-VM33.png](blog/run-VM33.png)

      oVirt defaults to the SPICE protocol for new VMs, which means you’ll need the virt-viewer package installed on your client machine. If a SPICE client isn’t available to you, you can opt for VNC by stopping your VM, clicking "Edit," "Console," "Show Advanced Options," and choosing VNC from the "Protocol" drop down menu.

That’s enough for this blog post, but stay tuned for more oVirt 3.3 how-to posts. In particular, I have walkthroughs in the works for [making use of oVirt’s new and improved Gluster storage support](/ovirt-3-3-glusterized/), and for making oVirt and OpenStack play nicely together.

If you’re interested in getting involved with the project, you can find all the mailing list, issue tracker, source repository, and wiki information you need [here](http://www.ovirt.org/Community).

On IRC, I’m `jbrooks`, ping me in the #ovirt room on OFTC or write a comment below and I’ll be happy to help you get up and running or get pointed in the right direction.

Finally, be sure to follow us on Twitter at [@redhatopen](https://twitter.com/redhatopen) for news on oVirt and other open source projects in the Red Hat world.
