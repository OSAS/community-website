---
title: Collaboration with CentOS is a Win-Win for oVirt
author: bkp
date: 2015-01-19 21:07:11 UTC
tags: oVirt, CentOS, RHEL, SIG, Fedora, virtualization
comments: true
published: true
---

![](blog/oVirt-logo.png) Normally within the oVirt release cycle, we don't offer new features in mid-cycle. Instead, we just improve upon or fix up the features that are already in there, and new features will come out the next major point release. But last week we announced the [oVirt 3.5.1 release candidate](http://lists.ovirt.org/pipermail/users/2015-January/030657.html), and we're pleased to confirm that oVirt Engine will indeed run on el7 distributions, which includes Red Hat Enterprise Linux and CentOS 7.

As of this RC, [oVirt packages for oVirt are now available](http://resources.ovirt.org/pub/ovirt-3.5-pre/) for Fedora 20, el6, and el7.

There are two big reasons why this new functionality was added in mid-cycle. The first was straightforward: Users wanted it. A lot. As soon as 3.5 came out, there were many requests (online and face-to-face) that amounted to: When will Engine run on CentOS 7? That kind of community demand deserves a lot of attention.

The second reason was more strategic, and no less important. Recently, oVirt joined the [CentOS Virtualization Special Interest Group](http://wiki.centos.org/SpecialInterestGroup/Virtualization) (Virt SIG), and being a part of this SIG gets oVirt a lot of collaborative capability with the CentOS Project.

Initially being in the Virt SIG was attractive for the oVirt Project because we were looking  for a way to ensure that the qemu-kvm package in CentOS would have live snapshot capability enabled. This flag is not usually set to enabled by default. But there are other benefits. Our [oVirt Live](http://www.ovirt.org/OVirt_Live) ISO images use CentOS 6 packages as their base with Kickstart files from Scientific Linux. In the SIG, oVirt can make oVirt Live fully CentOS-based and eventually move to CentOS 7.

[oVirt Node](http://www.ovirt.org/Category:Node) is a small, robust operating system image using minimal resources, while providing the capability to control virtual machines. Node is based on CentOS as well, and it makes a lot of sense to stay active in the Virt SIG.

oVirt is happy to participate in the Virt SIG with CentOS and other virtualization projects, and we're looking forward to gaining the benefits of closer collaboration in the broader virtualization community.