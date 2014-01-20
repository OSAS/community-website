---
author: bkp
comments: true
layout: post
slug: ovirt-3.4-all-about-easier-installation-administration
title: oVirt 3.4 Is All About Easier Installation, Administration
date: 2014-01-17 19:42 UTC
categories:
- Blog
---

As the new year gets underway, the [oVirt](http://ovirt.org) development team is well on its way to preparing oVirt 3.4 for release. There's some pretty nice features coming up in the next point release for oVirt, making a better platform than ever for virtualization management.

One of the most exciting features is hosted engine, which will enable oVirt engine to be run as a virtual machine (VM) on the host it manages. Hosted engine will solve the basic chicken-and-the egg problem when you have to solve the basic challenge of deploying and running an oVirt engine inside a VM. In later releases, the hosted engine solution enables oVirt to be used as a virtual appliance, because you won’t have to install it, it will already come pre-installed and ready for configuration. The oVirt team has invested a lot in making oVirt installation easier, and providing a virtual appliance is a big step towards that goal.

And, thanks to efforts from IBM and the El Dorado Research Center in Brazil, the upcoming oVirt release will have PPC64 support, which gives oVirt a cross-architecture capability not found in competing virtualization platforms.

# Improved Storage and Scheduling

An existing legacy limitation in oVirt that the team is working to remove is the capability to have multiple storage domains. Once this limitation is fixed, users will be able to mix local storage and shared storage as they need. This will enable VMs that need to access several virtual disks to allocate these disks on different storage domains, such as NFS, iSCSI, or Fibre Channel. The team is still working hard on this feature, which will be a nice add in oVirt 3.4.

Building on the scheduler features that were introduced in oVirt 3.3, the 3.4 release will capitalize on the scheduler to apply affinity (and anti-affinity) rules to VMs that will manually dictate scenarios in which those VMs should run together on the same hypervisor, or separately on different hypervisor hosts. Power-saving rules can also be added to the scheduler, as well.

Scheduling improvements will also show up in oVirt Manager, which has the capability to flag individual VMs for high availability. In the event of a host failure, these VMs are rebooted on an alternate hypervisor host. Currently, it is possible that the resultant utilization of a cluster during a host failure may either not be allowed or could cause a notable performance degradation when HA VMs are rebooted. The new HA VM Reservations feature in oVirt 3.4 will serve as a mechanism to ensure that appropriate capacity exists within a cluster for HA VMs in the event the host on which they currently reside does unexpectedly fail.

# Easier to Manage Networks

Network configuration will also be simplified in oVirt 3.4, especially with multi-host network configuration, which will enable the administrator to modify a network (i.e., vlan-id, MTU) that is already provisioned by the hosts and to apply those network changes to all of the hosts within the data center in which the network is assigned. This will no only reduce the number of steps required to reflect a logical network definition change, it will also reduce the risk of having a host's network configuration not synchronized with the logical network definition.

Along the same lines as reducing networking steps, the new networking labels will provide the capability to label networks and use that label on the host's interfaces, so the label abstracts the networks from the physical interface/bond, which in turn can be labeled with one or more labels.

# Lowering Barriers to Entry

That's just a few of the features set to come in oVirt 3.4. Meanwhile, efforts to continue to integrate with other projects and solutions that users want, such as oVirt guest agents for openSUSE and Ubuntu. 2014 will be about making oVirt better for sure, but also easier to use and build upon.
