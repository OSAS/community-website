---
author: maor
comments: true
layout: post
title: oVirt Google Summer of Code Update
date: 2014-07-08 20:02 UTC
tags:
- oVirt
- Google Summer of Code
- GSoC
- Virtualization
- Gerrit
categories:
- Blog
---
![](blog/oVirt-logo.png)
oVirt's stance as the first truly open and comprehensive data center virtualization management provides a venue for user and developer cooperation. The heart of the project is oVirt's open source code, and the open governance of the community, modeled after the Apache Foundation, Eclipse, LVM, and many other well-functioning Linux communities.

So whenever we have a chance to participate in broader events in the open source community, we relish it. We were excited, then, to be a part of this year's [Google Summer of Code](https://www.google-melange.com/gsoc/homepage/google/gsoc2014).

READMORE

This is the first time [oVirt has participated](http://www.ovirt.org/Summer_of_Code) in the Google Summer of Code, so we decided to focus on two small, well-defined tasks. Together with our two outstanding students, Tomasz Kolek and Utkarsh Singh,  we formed two working groups, each one consisting of a student and a seasoned oVirt mentor, focusing on one of the tasks at hand.

The first oVirt GSOC project is [integrating virt-sparsify](http://libguestfs.org/virt-sparsify.1.html). Virt-sparsify is a utility from the libguestfs suite of tools designed to free up in a virtual machine's disk, consecutively freeing up valuable storage resources on the host. Although the libguestfs suite has been around for several years, oVirt has just recently begun leveraging its capabilities, and adding virt-sparsify's capabilities is another important step in the right direction.

The second project is PatchMate (previously known as Add Potential Reviewers). When anyone submits a patch to an open source project using Gerrit (*e.g.*, oVirt), there's always a dilemma of who should be added as a reviewer. PatchMate attempts to smooth this process up by employing different dynamic heuristics to find the most appropriate reviewers, and automatically add them in Gerrit. PatchMate will not only assist the oVirt project, but will also be a big help for other open source projects that use Gerrit for code management.

oVirt is excited to be a part of the Google Summer of Code, which gives us a chance to open our project's capabilities to more community developers and develop the long-lasting relationships that are important to the health of an open source community.
