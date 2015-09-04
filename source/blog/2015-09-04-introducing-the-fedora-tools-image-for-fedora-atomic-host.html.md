---
title: Introducing the “fedora-tools” Image for Fedora Atomic Host
author: jeder
date: 2015-09-04 19:17 UTC
tags: Fedora, Docker, Atomic, Performance, Debugging
published: true
comments: false
---

![Project Atomic logo](blog/atomic.png) Borrowing from the [developerblog](http://developerblog.redhat.com/2015/03/11/introducing-the-rhel-container-for-rhel-atomic-host/) entry, here's an introduction the fedora-tools” image for Fedora Atomic Host.

When Red Hat’s performance team first started experimenting with Atomic, it became clear that our needs for low-level debug capabilities were at odds with the stated goal of Atomic to maintain a very small footprint.  If you consider your current production environment, most standard-builds do not include full debug capabilities, so this is nothing new.  What is new, is that on RHEL you could easily install any debug/tracing/analysis utility, but on Atomic:

`
-bash-4.2# dnf
bash: dnf: command not found
`

Whoops!  What’s this now???  If you haven’t played with Fedora Atomic yet, keep the first rule of Atomic in mind:

You don’t install software on Atomic.  You build containers on RHEL, CentOS, or Fedora, then run them on Atomic... sysadmin tools are no exception.

We always knew we needed an equivalent for Fedora... and we're happy to announce today the availability of the [fedora-tools image](https://hub.docker.com/r/fedora/tools/).

[Read More](http://www.projectatomic.io/blog/2015/09/introducing-the-fedora-tools-image-for-fedora-atomic-host/)
