---
title: FOSDEM Notes&mdash;Examining Live VM Migration
date: 2016-01-27 12:39 UTC
author: bkp
tags: FOSDEM, events, KVM
published: true
comments: true
---
![qemu logo](blog/Qemu-logo.png) The notion that all virtualization workloads and use cases are the same is not widespread in IT, but it remains an idea that is somewhat hard to shake. In point of fact, the differences in how virtual machines are deployed and run can be seen in the existence of differing platforms like OpenStack, oVirt, and virt-manager.

All three of these platforms use the KVM hypervisor, but their target use cases are clearly very different. Cloud, datacenter management, and single-server virtual machine management satisfy very different needs, and getting KVM to cater to those needs has proven to be a challenge over the years.

READMORE

This, particularly in regards to live migration of virtual machines from one host to another, is the topic of Amit Shah's [upcoming talk at FOSDEM](https://fosdem.org/2016/schedule/event/live_migration/).

Shah, a senior software engineer at Red Hat specializing in QEMU and KVM development, sees the challenges of accommodating these different use cases from one layer of multi-layer environments that include Linux, KVM, libvirt, and project-specific layers like oVirt Node and OpenStack Nova. For Shah, the QEMU layer is the place where many of the issues for these higher layers can be resolved.

Attendees of Shah's talk may expect to hear a lot about live migration&mdash;and indeed they will&mdash;but they will also be getting a guided tour through the many layers that comprise virtualization tools today. This, Shah says, will help attendees understand the complexity of the problems facing virtual machine management today.

For instance, older QEMU versions successfully migrate modern workloads whereas newer ones could not. Modern VMs, with several vCPUs and lots of RAM make live migration very interesting, and there are several approaches the QEMU team are undertaking. One such approach is something Shah refers to as "post copy," where a guest VM is initially migrated quickly, and then remote memory page calls are performed after the migration to complete the sync of the new copy.

Shah's talk in the FOSDEM main track will contain strong technical detail on virtualization. So, too, will the talks in the [Virtualization/IaaS DevRoom](https://fosdem.org/2016/schedule/track/virtualisation_and_iaas/) at FOSDEM. Developers and administrators with any interest in virtualization will definitely find something of interest at this year's conference in Brussels.
