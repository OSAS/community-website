---
title: Containers Aren't the Extinction Event for Operating Systems
date: 2014-08-05 21:18 UTC
author: bkp
layout: post
comments: true
tags:
- OSCON
categories:
- Blog
---
A little while back, I made the argument that any hype or positioning around virtual machines versus containers was [very much a fake conflict](http://www.projectatomic.io/blog/2014/06/containers-vs-virtual-machines-is-a-fake-conflict/).

Containers, after all, have a wonderful set of uses, particularly for application developers who want to use Just What They Need, and then get on with what they want to really do: develop for the application, not mess around with the changing libraries and failed dependencies that seem endemic to operating systems, whether on bare metal or virtual.

Sys admins have similar issues with operating systems, with the additional hurdle of having to schedule and provision around updates and failed machines.
In such a world, it would seem that containers, like [42](http://en.wikipedia.org/wiki/42_%28number%29), are the Answer to Life, the Universe, and Everything. Indeed, even [oVirt](http://www.ovirt.org) has been containerized, with a prototype of the oVirt Engine running on Fedora 19 [now available](https://registry.hub.docker.com/u/danielerez/ovirt-engine/).

But even as I have been assisting with [Project Atomic](http://www.projectatomic.io/), watching the building success of cloud solutions like [RDO](http://openstack.redhat.com/Main_Page) and of virtual machine management platforms like oVirt, it seems unlikely that containers, as useful as they are, will be the final solution for all things IT.

Recently at OSCON, I gave a talk under my Project Atomic hat that put forth what I believe to be the one thing that will ensure the continued need for operating systems: innovation. To learn more, watch this short five-minute video from my Ignite OSCON presentation.

<iframe width="640" height="360" src="//www.youtube.com/embed/lBUwSpoWXh8" frameborder="0" allowfullscreen></iframe>

