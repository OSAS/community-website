---
author: jbrooks
comments: true
layout: post
title: "GNOME Boxes 3.14, Unboxed"
date: 2014-10-15 08:22 UTC
tags:
- oVirt
- Container
- GNOME
- Desktop
- Fedora
- Debian
- VM
- Boxes
- Virtualization
categories:
- Blog
---

![](blog/gnome-boxes.png)Welcome to the inaugural edition of Boxes of Boxes, a bi-monthly virtualization, containerization, and turduckenization column. Given the title and subject matter of this column, and the fact that version 3.14 of GNOME desktop environment has [recently shipped](http://www.gnome.org/news/2014/09/gnome-3-14-released/), I decided to take a look at the project's built-in application for running virtual machines: GNOME Boxes. I took GNOME Boxes for a spin on [Fedora 21 alpha](http://fedoraproject.org/wiki/F21_Alpha_release_announcement), which also shipped recently, sporting GNOME 3.14 as its default desktop environment.

The GNOME 3.14 [release notes](https://help.gnome.org/misc/release-notes/3.14/more.html.en) point to support for Debian as a newly added "express installation" target for GNOME Boxes, so I started off by pointing the app at a Debian Wheezy installation ISO I'd downloaded. The express installation feature suggests a set of sane defaults for virtual disk size and for VM memory, asks for a password,  and promptly chefs up a fresh VM instance, and the feature worked as expected with the installation I'd kicked off.

READMORE

![Express Installation of Debian Wheezy](blog/BoB-express-install.png)

After the Boxes finished with the Debian install process, I logged into the new VM, opened some applications, and set about testing Boxes' new VM snapshot support. GNOME Boxes has always aimed at simplicity above all else, and there's no question that fewer features make for a simpler user experience, but snapshots are one of my favorite virtualization capabilities. Being able to fool around with a new OS or application at will, confident that you can return to a prior state is nice. I snapped and restored a series of states with my Wheezy VM, and each operation ran without issue.

![GNOME Boxes Snapshot Support](blog/BoB-snapshot-support.png)

Although GNOME Boxes tends to trade extra dials and levers for ease of use, the application's designers had the good sense to accomodate users who require a fuller feature set by making it easy to use Boxes alongside heavier-weight virtualization applications. For instance, I'm a long-time user of [virt-manager](http://virt-manager.org/), so I was pleased to see Boxes offer the option of importing the VMs I'd created earlier with virt-manager; however, I hit an error when I tried to import a VM, [an issue](https://bugzilla.gnome.org/show_bug.cgi?id=736097) that another tester appears already to have encountered.

I had better success with the support in GNOME Boxes for accessing remote VMs hosted on oVirt installations. The feature isn't well-documented -- the app's built-in documentation makes no mention of it -- but by entering `ovirt://ADDRESS_OF_MY_oVIRT_ENGINE` into the "Enter URL" field of the New VM screen, I was able to create a connection between the copy of Boxes in my notebook machine and the oVirt installation running in my lab and access any VMs to which I'd been granted the "User" role.

![oVirt Access](blog/BoB-ovirt-access.png)

Boxes provides access to oVirt-hosted VMs through a combination of the SPICE protocol and the [govirt library](https://github.com/GNOME/libgovirt), but any remote machine or VM accessible via VNC or SPICE ought to be accessible through GNOME Boxes; however, I encountered another issue while attempting to connect to a [Docker container](https://github.com/fedora-cloud/Fedora-Dockerfiles/tree/master/firefox) running a VNC server with a instance of Firefox. After setting up and opening a VNC connection to the container running on my local machine, Boxes' spinning progress indicator spun along without prompting me for a password. I found [an old bug](https://bugzilla.gnome.org/show_bug.cgi?id=686560) that seems to match what I experienced. I hope the issue is as simple as a missing dependency, but I'll have to do more research to get to the bottom of it.

![Spinning Wheel](blog/BoB-spinning-wheel.png)

And, with that final shoehorned-in Docker appearance, it's time to wrap up this week's Boxes of Boxes. Next time, I'll likely be writing about oVirt 3.5, and a new and improved version of my oVirt+Gluster converged virt and storage howto. Until then, talk to me in the comments section below, ping me on Twitter at [jasonbrooks](https://twitter.com/jasonbrooks), and follow [redhatopen](https://twitter.com/redhatopen) for all the latest from the red-hued corners of the open source world.