---
title: CentOS Project Rolling Builds
author: quaid
date: 2014-12-18 18:48:33 UTC
tags: CentOS, Linux, SIG, Docker
comments: true
published: true
---

![](blog/CentOS_200x.png)Something has been in the works over the past few months in the CentOS Project, what we're calling 'rolling builds'.

Generally a rolling build is where a software project makes regular builds of the latest code (for example, every month, week, or day). Typically all the updates or changes to the software are included in the build. 

For CentOS Linux, this means rolling in all the latest updates from upstream Red Hat Enterprise Linux for each rolling build. The CentOS Project produces installable images (ISO files) of CentOS Linux, generic cloud images for popular service providers, the formal [Docker image available via the Docker Hub](https://registry.hub.docker.com/_/centos/), and an [image for use with Project Atomic](http://buildlogs.centos.org/rolling/7/isos/x86_64/).

Project leader Karanbir Singh described it this way [in his announcement](http://lists.centos.org/pipermail/centos-announce/2014-December/020807.html):

> CentOS Linux rolling builds are point in time snapshot media rebuild from original release time, to include all updates pushed to mirror.centos.org's repositories. This includes all security, bugfix, enhancement and general updates for CentOS Linux. Machines installed from this media will have all these updates pre-included and will look no different when compared with machines installed with older media that have been yum updated to the same point in time. All rpm/yum repos remain on mirror.centos.org with no changes in either layout or content.

The aim is to update and release a new set of these files at the end of every month. There may be interim and test builds done, as well as the possibility of building and releasing due to a security vulnerability, such as the recent Heartbleed and Shellshock exploits.
    
As the release cycles progress, we'll be pulling in more images, such as CentOS Linux 7 live media, and probably future releases coming from project [special interest groups (SIGs)](http://community.redhat.com/blog/2014/10/CentOS-SIGs-update/).  The SIGs provide additional software on top of the CentOS Linux platform, which may include changing out components in the base distro. It will be a great benefit to these SIGs and their user communities to have rolling builds of this software, as it is often representative of leading edge project work that many are interested in using such as OpenStack and software-defined storage and networking.

As it stands now, these rolling builds are not the same as a nightly snapshot and build that is common in some open source projects. The CentOS Project often will need a few days to test before release. Regardless of when the release actually happens (end of one month, or the start of another), the name and datestamp on the build will reflect the month in which it was built.

In this second month of rolling builds the following images were included:

 * CentOS Linux distro installer media ([DVD ISO](http://buildlogs.centos.org/rolling/7/isos/x86_64/CentOS-7-x86_64-DVD.iso), [Everything ISO](http://buildlogs.centos.org/rolling/7/isos/x86_64/CentOS-7-x86_64-Everything.iso), and [Minimal ISO](http://buildlogs.centos.org/rolling/7/isos/x86_64/CentOS-7-x86_64-Minimal.iso))
 * [Cloud and instance images](http://cloud.centos.org/centos/7/images/) ([qcow2](http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2), [qcow2c](http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2c), [qcow2.xz](http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2.xz), and [raw](http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.raw))
 
 *Follow CentOS on Twitter at [@CentOS](https://twitter.com/centos) and learn more about the dojos by following [@CentOSEvents](https://twitter.com/centosevents). You can also keep up with the CentOS community on [G+](https://plus.google.com/u/0/b/113258037797946990391/+CentOS/posts),  [Facebook](https://www.facebook.com/groups/centosproject/), [YouTube](https://www.youtube.com/user/TheCentOSProject), and in [IRC](http://wiki.centos.org/irc).*