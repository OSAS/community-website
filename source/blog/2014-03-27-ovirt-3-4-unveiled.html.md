---
author: bkp
comments: yes
layout: post
title: oVirt 3.4 Unveiled
date: 2014-03-27 14:45 UTC
tags:
- oVirt
- Virtualization
- KVM
categories:
- Blog
---
[oVirt 3.4](http://www.ovirt.org/OVirt_3.4_Release_Notes) is finally out on the virtual shelves, an achievement of many hours of work from a global team of developers who are continuing to improve a virtual datacenter platform that's getting more attention all of the time.

If you could pick a theme around the efforts of the oVirt team, it would probably be lowering the barrier of entry. What can be done not only to make oVirt more useful, but also easier to install and implement?

The new hosted engine, for instance, enables the oVirt engine to be run as a virtual machine (VM) on the same host it manages. Hosted engine solves the classic chicken-and-the-egg problem you have when solving the basic challenge of deploying and running an oVirt engine inside a VM. This will streamline installation and make oVirt easier to deploy.

Work contributed from IBM and the El Dorado Research Center in Brazil gives oVirt 3.4 PPC64 support, making oVirt a true cross-architecture virtualization platform. At the same time, we've made efforts to continue integrating with other projects and solutions that users want, such as oVirt guest agents for openSUSE and Ubuntu. 

READMORE

## Making It Great

There are other platforms out there to manage your virtual machines, and if you need something to run your mission-critical production systems, then just being "free as in beer" is not going to be enough. For oVirt, it's not just about being free, it's about being great. 

In storage, oVirt 3.4 has the capability to have multiple concurrent storage domains. Users can mix local storage and shared storage as they need, in the same datacenter. This enables VMs that need to access several virtual disks to allocate these disks on different storage domains, such as NFS, iSCSI, or Fibre Channel. 

oVirt 3.4 capitalizes on the current scheduler features to apply affinity (and anti-affinity) rules to VMs that will manually dictate scenarios in which those VMs should run together on the same hypervisor, or separately on different hypervisor hosts. Power-saving rules can be added to the scheduler, as well.

oVirt now has the scheduling capability to flag individual VMs for high availability. In the event of a host failure, these VMs are rebooted on an alternate hypervisor host. Currently, it is possible that the resulting utilization of a cluster during a host failure may either not be allowed or could cause a notable performance degradation when HA VMs are rebooted. The new HA VM Reservations feature in oVirt 3.4 will serve as a mechanism to ensure that appropriate capacity exists within a cluster for HA VMs in the event the host on which they currently reside does unexpectedly fail.

Network configuration is also simplified in oVirt 3.4, especially with multi-host network configuration, which enables the administrator to modify a network (*e.g.*, vlan-id, MTU) that is already provisioned by the hosts and to apply those network changes to all of the hosts within the data center in which the network is assigned. This reduces the number of steps required to reflect a logical network definition change, and will also reduce the risk of having a host's network configuration not synchronized with the logical network definition. New networking labels will also provide the capability to label networks and use that label on the host's interfaces, so the label abstracts the networks from the physical interface/bond, which in turn can be labeled with one or more labels.

We are [looking forward to hearing from our growing user base](http://www.ovirt.org/Community) about their reactions to the new release, even as we settle in toward oVirt 3.5. The oVirt team has been nothing less than impressive to me in my first months as the community manager, and for my part, they get a big round of applause.
