---
author: jbrooks
comments: true
date: 2013-09-17 01:00:53+00:00
layout: post
slug: ovirt-3-3-glusterized
title: oVirt 3.3, Glusterized
wordpress_id: 441
categories:
- Blog
tags:
- Fedora
- gluster
- kvm
- ovirt
---

The All-in-One install I detailed in [Up and Running with oVirt 3.3](/blog/2013/09/up-and-running-with-ovirt-3-3/) includes everything you need to run virtual machines and get a feel for what oVirt can do, but the downside of the local storage domain type is that it limits you to that single All in One (AIO) node.

You can shift your AIO install to a shared storage configuration to invite additional nodes to the party, and oVirt has supported the usual shared storage suspects such as NFS and iSCSI since the beginning.

New in oVirt 3.3, however, is a storage domain type for GlusterFS that takes advantage of Gluster’s new [libgfapi](http://www.gluster.org/2012/11/integration-with-kvmqemu/) feature to boost performance compared to FUSE or NFS-based methods of accessing Gluster storage with oVirt.

With a GlusterFS data center in oVirt, you can distribute your storage resources right alongside your compute resources. As a new feature, GlusterFS domain support is rougher around the edges than more established parts of oVirt, but once you get it up and running, it’s worth the trouble.

In oVirt, each host can be part of only one data center at a time. Before we decommission our local storage domain, we have to shut down any VMs running on our host, and, we’re interested in moving them to our new Gluster storage domain, we need to ferry those machines over to our export domain.

_GlusterFS Domain & RHEL/CentOS:_

The new, libgfapi-based GlusterFS storage type has a couple of software prerequisites that aren’t currently available for RHEL/CentOS — the feature requires qemu 1.3 or better and libvirt 1.0.1 or better. Earlier versions of those components don’t know about the GlusterFS block device support, so while you’ll be able to configure a GlusterFS domain on one of those distros today, any attempts to launch VMs will fail.

Versions of qemu and libvirt with the needed functionality backported are in the works, and should be available soon, but for now, you’ll need Fedora 19 to use the GlusterFS domain type. For RHEL or CentOS hosts, you can still use Gluster-based storage, but you’ll need to do so with the POSIXFS storage type.

The setup procedures are very similar, so I’ll include the POSIXFS instructions below as well in case you want to pursue that route in the meantime. Once the updated packages become available, I’ll modify this howto accordingly.

_SELinux, Permissive_

Currently, the GlusterFS storage scenario described in this howto requires that SELinux be put in permissive mode. You can put selinux in permissive mode with the command:

    
    sudo setenforce 0

To make the shift to permissive mode persist between reboots, edit "/etc/sysconfig/selinux" and change SELINUX=enforcing to SELINUX=permissive.

## Glusterizing Your AIO Install in _n_ Easy Steps

	
  1. Evacuate Your VMs

Visit the "Virtual Machines" tab in your Administrator Portal, shut down any running VMs, and click "Export," "OK" to copy them over to your export domain.

While an export is in progress, there’ll be an hourglass icon next to your VM name. Once any VMs you wish to save have moved over, you can reclaim some space by right-clicking the VMs and hitting "Remove," and then "OK."

	
  2. Detach Your Domains

Next, detach your ISO_DOMAIN from the local storage data center by visiting the "Storage" tab, clicking on the ISO_DOMAIN, visiting the "Data Center" tab in the bottom pane, clicking "local_datacenter," then "Maintenance," then "Detach," and "OK" in the following dialog. Follow these same steps to detach your EXPORT_DOMAIN as well.

	
  3. Modify Your Data Center, Cluster & Host

Now, click the "Data Centers" tab, select the "Default" data center, and click "Edit." In the resulting dialog box, choose "GlusterFS" in the "Type" drop down menu and click "OK."

_If you’re using RHEL/CentOS and taking the Gluster via POSIXFS storage route I referenced above, choose "POSIXFS" in the "Type" drop down menu instead._

Next, click the "Clusters" tab, select the "Default" cluster, and click "Edit." In the resulting dialog box, click the check box next to "Enable Gluster Service" and click "OK."

Then, visit the "Hosts" tab, select your "local_host" host, and click "Maintenance." When the host is in maintenance mode, click "Edit," select "Default" from the "Data Center" drop down menu, hit "OK," and then "OK" again in the following dialog.

	
  4. Next, hit the command-line for a few tweaks that ought to be handled automatically, but aren’t (yet).

Install the vdsm-gluster package, start gluster, and restart vdsm:

    
    sudo yum install vdsm-gluster

Now, edit the file "/etc/glusterfs/glusterd.vol" [bz#] to add "option rpc-auth-allow-insecure on" to the list of options under "volume management."

As part of the virt store optimizations that oVirt applies to Gluster volumes, there’s a Gluster virt group in which oVirt places optimized volumes. The file that describes this group isn’t currently provided in a package, so we have to fetch it from Gluster’s source repository:

    
    sudo curl https://raw.github.com/gluster/glusterfs/master/extras/group-virt.example -o /var/lib/glusterd/groups/virt [bz#]

Now, we’ll start the Gluster service and restart the vdsm service:

    
    sudo service glusterd start
    sudo service vdsmd restart

	
  5. Next, we’ll create a mount point for our Gluster brick and set its permissions appropriately. To keep this howto short, I’m going to use a regular directory on our test machine’s file system for the Gluster brick. In a production setup, you’d want your Gluster brick to live on a separate XFS partition.

    
    sudo mkdir /var/lib/exports/data
    chown 36:36 /var/lib/exports/data [bz#]

	
  6. Now, we’re ready to re-activate our host, and use it to create the Gluster volume we’ll be using for VM storage. Return to the Administrator Portal, visit the "Hosts" tab, and click "Activate."

Then, visit the "Volumes" tab, click "Create Volume," and give your new volume a name. I’m calling mine "data." Check the "Optimize for Virt Store" check box, and click the "Add Bricks" button.

In the resulting dialog box, populate "Brick Directory" with the path we created earlier, "/var/lib/exports/data" and click "Add" to add it to the bricks list. Then, click "OK" to exit the dialog, and "OK" again to return to the "Volumes" tab.

	
  7. Before we start up our new volume, we need to head back to the command line to apply the "server.allow-insecure" option we added earlier to our volume:

    
    sudo gluster volume set data server.allow-insecure on

	
  8. Now, back to the Administrator Portal to start our volume and create a new data domain. Visit the "Volumes" tab, select your newly-created volume, and click "Start."

Then, visit the "Storage" tab, hit "New Domain," give your domain a name, and populate the "Path" field with your machine’s hostname colon volume name:

    
    mylittlepony.lab:data

_If you’re using RHEL/CentOS and taking the Gluster via POSIXFS storage route I referenced above, you need to populate the "Path" field with with your machine’s hostname colon slash volume name instead. Again, this is only if you’re taking the POSIXFS route. With the GlusterFS storage type, that pesky slash _[[BZ](https://bugzilla.redhat.com/show_bug.cgi?id=988299)] _won’t prevent the domain from being created, but it’ll cause VM startup mysteriously to fail! Also, in the "VFS Type" field, you’ll need to enter "glusterfs"_

Click "OK" and wait a few moments for the new storage domain to initialize. Next, click on your detached export domain, choose the "Data Center" tab in the bottom pane, click "Attach," select "Default" data center, and click "OK." Perform the same steps with your iso domain.

	
  9. All Right. You’re back up and running, this time with a GlusterFS Storage Domain. If you ferried any of the VMs you created on the original local storage domain out to your export domain, you can now ferry them back:

Visit the "Storage" tab, select your export domain, click "VM Import" in the lower pane, select the VM you wish to import, and click "Import." Click "OK" on the dialog that appears next. If you didn’t remove the VM you’re importing from your local storage domain earlier, you may have to "Import as cloned."

### Next Steps

From here, you can experiment with different types of Gluster volumes for your data domains. For instance, if, after adding a second host to your data center, you want to replicate storage between the two hosts, you’d create a storage brick on both of your hosts, choose the replicated volume type when creating your Gluster volume, create a data domain backed by that volume, and start storing your VMs there.

You can also disable the NFS ISO and Export shares hosted from your AIO machine and re-create them on new Gluster volumes, accessed via Gluster’s built-in NFS server. If you do, make sure to disable your system’s own NFS service, as kernel NFS and Gluster NFS conflict with each other.

