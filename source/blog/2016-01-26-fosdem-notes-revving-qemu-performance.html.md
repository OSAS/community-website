---
title: FOSDEM Notes&mdash;Revving QEMU Performance
date: 2016-01-26 11:40 UTC
author: bkp
tags: FOSDEM, events, KVM
published: true
comments: true
---
![KVM logo](blog/kvm-logo-200.png) The KVM hypervisor has always been at or near the top of any sort of performance chart in virtualization land. But when it comes to disk input/output, things are not as always so well behaved.

In terms of block storage, KVM can fall short in performance, because the hypervisor is tapping into the QEMU block layer, not the Linux kernel. And when large blocks come through, things can slow way down, according to Paolo Bonzini, a Senior Principal Software Engineer at Red Hat and maintainer for the [KVM Project](http://www.linux-kvm.org/page/Main_Page).

READMORE

This, Bonzini explains, is because the QEMU block layer does not use threads effectively. Initially, the solution to the problem was to duplicate all of the code for disk I/O in QEMU and then strip out features used for libvirt and oVirt. This solution, as you might expect, worked very well, but was an important limitation.

"As long as you can forego these features, it's great," Bonzini said.

To compensate, the QEMU and KVM developers' efforts turned to making the block layer thread safe. By introducing multi-thread capabilities, the QEMU block layer gained big performance benefits.

Much of the initial work is done, Bonzini added, and in [his FOSDEM talk](https://fosdem.org/2016/schedule/event/virt_iaas_optimizing_qemu_kvm_high_iops/), he will explain the structure of the QEMU block layer, why it has traditionally preferred cooperative multitasking (coroutines) to threads, and how to reconcile this design with the high level of parallelism required by modern PCIe storage devices.

"But we are not done yet, because we are discovering new things to do as we go along," Bonzini said. KVM will clearly benefit from this ongoing process, which you can hear more about at this week's FOSDEM.
