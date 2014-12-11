---
title: 'Fedora 21: Fedora Goes Atomic'
author: jbrooks
date: 2014-12-10 16:54:23 UTC
tags: Atomic, Docker, Fedora, Kubernetes, cloud, containers, Kolla
comments: true
published: true
---

![](blog/boxes.jpg) This week, [Fedora 21](https://getfedora.org/) (a.k.a., the release that [must not be named](http://www.eweek.com/enterprise-apps/nameless-fedora-21-linux-is-an-opportunity-for-growth.html)) hit FTPs mirrors everywhere, with a feature list led by a new organizational structure for the distribution. Fedora is now organized into three separate flavors: Workstation, Server, and Cloud.

Fedora's [Cloud flavor](https://getfedora.org/en/cloud/) is further divided into a "traditional" base image for deploying the distribution on your cloud of choice, and an [Atomic Host](http://www.projectatomic.io/) image into which Fedora's [team of cloud wranglers](http://fedoraproject.org/wiki/Cloud_SIG) has herded a whole series of futuristic operating system technologies.

**Applications:** Fedora Atomic is built to host applications in [docker](https://www.docker.com/whatisdocker/) containers, which provide a simple-to-use means of getting at all the workload-hosting goodness that's built into Linux, but that tends to require some assembly. 

READMORE

If you're looking for examples of containerized applications to run, both the [Fedora](https://github.com/fedora-cloud/Fedora-Dockerfiles) and [CentOS](https://github.com/CentOS/CentOS-Dockerfiles) projects maintain repositories of popular open source applications in containerized form. 

**System Updates:** Like every other Fedora distribution, Fedora Atomic is built from RPMs, but thanks to a project called [rpm-ostree](http://www.projectatomic.io/docs/os-updates/), system updates are atomic; either the whole set of updates applies, or none of them do, and Fedora Atomic automatically keeps the previous version of the OS available for rollback in case something doesn't work out as expected.

If you're playing with Fedora Atomic and want to extend or otherwise modify its package set, I wrote a [howto on the topic](http://www.projectatomic.io/blog/2014/11/build-your-own-atomic-updates/) over at the Project Atomic site.

**Management:** Fedora Atomic also ships with a slick new web-based server management UI, called Cockpit, which exposes a range of basic services, storage, networking, and performance configuration options, as well as some really interesting controls over containers running on your host.

![](blog/cockpit1.jpg){:align="right"}

**Orchestration:** Fedora Atomic includes [Kubernetes](http://kubernetes.io/) for orchestration and management of its containerized applications. Kubernetes is a fairly young project, and as such, is somewhat rough around the edges and fairly fast-moving. I wrote a howto on the Project Atomic site for [getting started with Kubernetes](http://www.projectatomic.io/blog/2014/11/testing-kubernetes-with-an-atomic-host/) on Atomic.

### Getting Started with Fedora Atomic

Head over to the Fedora [download site](https://getfedora.org/en/cloud/download/) and grab one of the *For Containers* images. If you're using virt-manager or OpenStack, you'll want to download the qcow image. The Fedora Atomic image ships without a default password, relying instead on [cloud-init](http://cloudinit.readthedocs.org/en/latest/) to facilitate logging in. If you're using virt-manager or another cloud-init-less option, check out the article [Running Cloud Images Locally](https://www.technovelty.org/linux/running-cloud-images-locally.html) to learn how to roll your own ISO image-based cloud-init provider.

From there, check out the [Getting Started](http://www.projectatomic.io/download/) page over at Project Atomic as well as the [Q&A site](http://ask.projectatomic.io/en/questions/) for the project. If you're into IRC, you can find Atomic fellows in #atomic on Freenode. I'm usually in that channel as jbrooks, so say hi if you drop in!

Finally, if you're more into CentOS, there's an Atomic option for you as well. Check out [the new CentOS Atomic image article](http://www.projectatomic.io/blog/2014/12/new-centos-atomic-image-updated-centos-containers-and-freeipa-4-1-2/) on the Project Atomic blog to learn more about the latest test release.

### For Next Time...

Once you get your hands on the Atomic hammer, every problem starts looking like an opportunity for containerization. I've been poking lately at [Kolla](https://github.com/stackforge/kolla), a project aimed at deploying and running OpenStack within a series of docker containers, all orchestrated by Kubernetes.

I'll attempt to walk through setting up Kolla on Fedora Atomic in my next column, but until then, here's a talk on the project from the recent OpenStack Summit in Paris:

<iframe width="560" height="315" src="//www.youtube.com/embed/rZBkCovEIZI" frameborder="0" allowfullscreen></iframe>