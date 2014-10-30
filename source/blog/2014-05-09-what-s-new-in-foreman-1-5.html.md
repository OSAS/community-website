---
author: dcleal
layout: post
comments: true
title: What's New in Foreman 1.5
date: 2014-05-09 21:09 UTC
tags:
- Foreman
- Puppet
categories:
- Blog
---
![](blog/foreman.png)
[Foreman 1.5](http://projects.theforeman.org/) has been [released](http://projects.theforeman.org/rb/release/4), bringing a host of new features to the popular systems management tool, including improved Puppet management and new levels of integration with FreeIPA and virtualization projects.

Foreman is an open source project that helps system administrators manage servers throughout their lifecycle, from initial provisioning and configuration to orchestration and monitoring. Using Puppet or Chef and Foreman's smart proxy architecture, you can easily automate repetitive tasks, quickly deploy applications, and proactively manage change, both on-premise with VMs and bare-metal or in the cloud. Here's what's new in the latest release:

##What's New

 * Puppet class management simplified with config groups: adminstrators can now assemble groups of Puppet classes, making it one click to re-apply the same set of configuration to different hosts or host groups.
 * Full provisioning integration with FreeIPA: now hosts are set up in the Kerberos realm for identity and policy management automatically when kickstarted from Foreman.
 * New Role Based Access Control (RBAC) authorization system: enables administrators to create fine-grained roles allowing users and groups access to hosts and resources in Foreman.
 * Image provisioning: Foreman can now deploy hosts from images or templates on a trio of compute resources (oVirt, libvirt [KVM] and VMware) using a script to complete the bootstrap process.
 * Growing plugin support: the Foreman installer now offers a range of plugins to enhance Foreman, and the first compute resources as plugins (Docker, Xen) are also available.

This is just the latest and greatest, though. There's much more to learn about Foreman.

Find out more about Foreman 1.5: 

* [Official Foreman 1.5 announcement](https://groups.google.com/forum/#!topic/foreman-announce/bJoGsiHIEq4)
* [Foreman 1.5 release notes](http://theforeman.org/manuals/1.5/index.html#Releasenotesfor1.5)
* [Quickstart installation](http://theforeman.org/manuals/1.5/index.html#2.Quickstart)
* Visit [theforeman.org](http://theforeman.org)
* Join the [Foreman Google+ Community](https://plus.google.com/u/0/communities/106976851375995577697)
* Participate in our [IRC channels and mailing lists](http://theforeman.org/support.html).
