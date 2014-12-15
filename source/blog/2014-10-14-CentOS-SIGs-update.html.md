---
title: CentOS Community Update -- All About SIGs
author: quaid
date: 2014-10-14 14:00:00 UTC
tags: CentOS, Linux, SIGs
comments: true
published: true
---

![](blog/CentOS_200x.png) One of the most exciting aspects of the expanding CentOS Project is the work being done by [Special Interest Groups](http://wiki.centos.org/SpecialInterestGroup/), or SIGs, to bring emerging technologies to the CentOS community. The work of these SIGs happens on top of the CentOS Linux core release, providing new software alongside the core in the form of repositories or images. In some cases SIGs may replace core packages as part of making a variant targeted at a specific audience. SIGs can do this because members must come from the involved upstream project, and thus are authoritative about what that software and its community needs

READMORE

There has been significant interest all year long to get new SIGs up and running, which has taken its fair share of time in each case. This is mainly because we are building the scaffolding in real time for an open and participatory community that can help set the direction of the CentOS Project.

Because the entirety of the CentOS developers are now contributing more broadly across the Project, we're all adjusting to the way some things are moving faster and others more slowly. In order to maintain velocity, in some cases we're creating policy and process in real time, and still learning how best to share all that.

Here is a quick overview of the various SIGs that are active or becoming active soon. In future columns, we’ll go more in to one or two SIGs at a time to show what is happening in detail.

# Fresh and Getting Started:

 * [Cloud](http://wiki.centos.org/SpecialInterestGroup/Cloud) - The Cloud SIG focuses on what is needed for running a Cloud Infrastructure / Hypervisor for on-premise clouds. The SIG also supports other SIGs and projects looking to consume some of the shared resources around on-premise cloud infrastructure.
 * [Cloud Instance](http://wiki.centos.org/SpecialInterestGroup/CloudInstance) - The Cloud Instance SIG has a goal of maintaining all the base cloud images that are used for all the various private and public cloud setups. 
  * For private, IaaS cloud controllers, we are currently targeting OpenStack, CloudStack, OpenNebula, Eucalyptus, oVirt, Docker, and Vagrant.
  * Examples of vendor ecosystems (i.e., public clouds) are [Amazon Web Services](http://wiki.centos.org/Cloud/AWS), HP Cloud, and Google Compute. 
 * [Virtualization](http://wiki.centos.org/SpecialInterestGroup/Virtualization) - This SIG is focused around virtualization in and of CentOS Linux. The SIG has been focused primarily on producing a Xen4 hypervisor kernel variant.
 * [Storage](http://wiki.centos.org/SpecialInterestGroup/Storage) - The Storage SIG focuses on deploying CentOS as a storage node. Software groups involved include OpenAFS, Ceph, and GlusterFS.
* [Atomic](http://wiki.centos.org/SpecialInterestGroup/Atomic) - The Atomic SIG aims to build, deliver, and maintain an [Atomic Host](http://projectatomic.io) based on CentOS Linux, and stand up tooling that would allow additional CentOS spins to be built with rpm-ostree. An _Atomic host_ is a minimal host, optimized to run and
manage Docker containers, and using rpm-ostree to deliver "atomic" updates.

# Underway but New
 * [Artwork](http://wiki.centos.org/SpecialInterestGroup/Artwork) - The Artwork SIG provides the look/feel and art/design standards for the project as well as the CentOS Linux distro.
 * [Promo](http://wiki.centos.org/SpecialInterestGroup/Promo) - The Promo SIG works on bringing people together to discuss and learn about CentOS Linux and doing interesting things with it, everywhere from small groups to conferences to specialized [CentOS Dojos](https://wiki.centos.org/Events/Dojo).

# Stable SIGs
 * [Xen4CentOS](http://wiki.centos.org/Manuals/ReleaseNotes/Xen4-01) - The Xen4CentOS SIG maintains the Xen4 kernel for CentOS Linux.

# Mature, Self-supporting 

This is the stage in which a SIG has full-authority, powers, and tooling within its purview to get its work done.

 * [Core](http://wiki.centos.org/SpecialInterestGroup/Core) - The Core SIG produces the CentOS Linux Distribution. There is minimal Board oversight, and the SIG essentially has seats on the CentOS Board due to the highest importance put on this aspect of the Project, the production of CentOS Linux core.
 * Infrastructure - The Infrastructure SIG runs all the essential participation platforms for contributors to get work done.
 * [QA](http://wiki.centos.org/QaWiki) - The QA SIG includes aspects of release engineering, focused on several QA aspects. One aspect is the re-branding of source code to make the distro CentOS Linux, another is testing and working through package build issues.

For more information about CentOS SIGs, visit the [Special Interest Groups](http://wiki.centos.org/SpecialInterestGroup) page in the wiki.

Find CentOS online at:

 * Twitter - [@centos](https://twitter.com/centos) and [@centosevents](https://twitter.com/centosevents)
 * [G+ CentOS](https://plus.google.com/+CentOS/)
 * [CentOS Facebook Group](https://www.facebook.com/groups/centosproject/)