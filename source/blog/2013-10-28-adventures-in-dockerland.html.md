---
author: alarsson
comments: true
date: 2013-10-28 13:42:29+00:00
layout: post
slug: adventures-in-dockerland
title: Adventures in Dockerland
wordpress_id: 513
categories:
- Blog
tags:
- Docker
- Fedora
---

I have an interest in application deployment systems, having created three different application bunding system ([1](https://people.gnome.org/~alexl/glick/),[2](https://people.gnome.org/~alexl/glick2/), [3](https://github.com/alexlarsson/bundler)). These were all experiments in the area of desktop applications, but recently there has been some interesting motions in related areas, namely [Docker](http://www.docker.io/).

Docker is a server application/container deployment system, which nicely sidesteps a lot of the complexity with desktop apps (not having to integrate deeply with the desktop) which makes it a lot easier to deploy. Additionally, docker is more than a deployment system, it also has some interesting ideas about how to create and distribute applications.

Every docker container is a copy-on-write clone of a specific parent Image, which means instantiation of docker containers is very fast and cheap. It also gives some very interesting properties because you can track the changes in a container (compared to t its parent image) and “commit” this to a new image. This creates a git-like hierarchy of images where every commit is a filesystem layer that applies to a previous layer, up to some base image. The git-like workflow is really nice to work with when creating images, and the final result is very easy to share and deploy, and at the same time automatically shares as much as possible with common base images.

Unfortunately Docker relies on AUFS, a union filesystem that is not in the upstream kernel, nor is it likely to ever be there. Also, while AUFS is in the current Ubuntu kernel it is deprecated there and will eventually be removed. This means Docker doesn’t run on Fedora which has a primarily-upstream approach to packaging.

So, the last month or so I’ve been working on making Docker work in Fedora (and thus eventually in RHEL, which is the nr 1 requested [Docker feature](https://github.com/dotcloud/docker/issues/172)). Of course, this work will benefit other distributions that don’t have AUFS too.

I started looking at possible replacements for the copy-on-write support, and there are a few possibilities availible:

	
  * overlayfs

	
  * btrfs

	
  * lvm snapshots

	
  * lvm thin provisioning

Overlayfs is a different union filesystem implementation than AUFS, and the one that seems most likely to land upstream. But that is happening slowly, if at all. Long-term I think this is the best option, but right now it is out of the question.

Btrfs has copy-on-write both using filesystem snapshots and one a file basis using reflink. However, btrfs is not currently used much in production as its not considered stable enough. It would also be a very heavy dependency for Docker, as may users would have to reformat their disks to use it.

Lvm snapshots are useful for doing e.g. backup of a snapshot, but regress badly in performance when you start having many snapshots of the same device.

This leaves us with only lvm thin provisioning. This is a fairly recent, but relatively stable technology that allows you to create copy-on-write block devices that are “thinly” provisioned, meaning they don’t use real space until the device is in use. This is not ideal for Docker as it really wants copy-on-write at the file level, but with some work it is possible to work around this.

Rather than interacting with lvm which is a very generic volume manager I chose to use the lower level device-mapper kernel APIs directly (via libdevmapper). This allows us greater ease of access to the devices programmatically, as well as avoiding confusion with possible system use of LVM. Also it avoids some LVM performance issues with very many devices.

So, we set up a single large block device on which we create a device-mapper “thinp” pool. On this we then creates a single “base” block device formated with ext4. Every image and container are then created as snapshot (in multiple steps) from this base device. So, say you’re starting a container based on an image “apache” which itself is based on a “fedora” image, we would:

	
  1. Create a snapshot of the base device.

	
  2. Mount it and apply the changes in the fedora image.

	
  3. Create a snapshot based on the fedora device.

	
  4. Mount it and apply the changes in the apache image.

	
  5. Create a snapshot based on the apache device.

	
  6. Mount it and use as the root in the new container.

And of course, these devices will be reused (with corresponding steps skipped) as needed by other images/containers.

The devicemapper pool need to be set up on a large block device that fits all the images  and containers that you will be used which would be painful for most people. Docker handles this by automatically creating the a large sparse file, using it as a loopback device for the devicemapper work. Additionally we ensure that DISCARD support is enabled in the filesystem so that any files removed in the conttainer filters down to the loopback file making it sparse again.

This means that there is no need for setup, and space for images and containers will only be used as needed. Of course, there are still issues, like the max size of the loopback mount (100G by default, but this should be easy to grow) and the max size of the base extt4 image (10G by default, resizing is harder after initial construction, but should be possible).

We’re currently in the process of landing this in Docker, and hope to have a 0.7 release out based on my device-mapper work pretty soon. Then I will continue working on making docker a first-class citizen on Fedora.
