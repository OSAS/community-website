---
title: RDO Packaging
author: rbowen
date: 2014-12-09 22:16:21 UTC
tags: RDO, CentOS, Fedora, Red Hat Enterprise Linux, OpenStack
comments: true
published: true
---

![](blog/rdo-openstacksummit_sm.jpg)When we started the [RDO project](https://openstack.redhat.com/Main_Page) back in April of 2013, the main focus was on producing a distribution of OpenStack that made it easy to deploy on CentOS, Fedora, and Red Hat Enterprise Linux. While we put time into making it easy for the community around that distribution to grow and support itself, most of the technical work was done inside Red Hat, and there were parts of it that weren't very visible to the community.

![](blog/rdo-openstacksummit.jpg){:align="right"}

It's time to prioritize opening up the RDO development process and make the technical governance of the project available to the entire community.

A month ago in Paris, at the OpenStack Summit, 40 or 50 RDO enthusiasts gathered to discuss the RDO community and what we can do to make it more inclusive. The number one thing that was asked for was more documentation around the process, and transparency into the CI results, so that everyone can see what's going on and know where they can jump in.

READMORE

Our first step in this direction is to document the packaging process. The [RDO OpenStack Packaging document](https://openstack.redhat.com/packaging/) is still a work in process, but we felt that getting it out into the open was more important than waiting until it was perfect. 

If you want to get more involved in the RDO community, this is a great place to get started. We're hoping that people that are interested in specific parts of OpenStack will step up to package those bits. The more people that are doing this, the faster we can move on everything. Everyone benefits. And more eyes on all of the moving parts ensures greater quality all around.

The other step that we've taken this week, in an attempt to address the second concern, came via the CentOS community. CentOS has recently spun up a new server specifically for community CI, so that open source communities can verify their builds on CentOS. The full details of this server may be seen on the [CentOS development list archives](http://lists.centos.org/pipermail/centos-devel/2014-December/012454.html), along with [details of the hardware](http://wiki.centos.org/QaWiki/PubHardware) itself. We're in the process of putting some of RDO's CI on that infrastructure, so that it can be more transparent and more accessible for non-redhatters to participate. 

If you'd like to be involved in that process, be sure to join the rdo-list [mailing list](https://www.redhat.com/mailman/listinfo/rdo-list) and also the [centos-devel mailing list]( http://lists.centos.org/mailman/listinfo/centos-devel), where the CentOS side of this conversation will be happening.

We know that the community is the most important component of the RDO project, and we want to do everything we can to open things up for you to participate and access the tools to solve your own problems. If there's anything more that we can do to improve your experience in the community, we want to work toward that. Please get on rdo-list and tell us how we can do things better.