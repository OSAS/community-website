---
title: A Containers-Eye View of LinuxCon EU
date: 2015-10-12 15:31 UTC
author: bex
tags: Atomic, atomicapp, LinuxCon, linuxcon-europe, containers
comments: true
published: true
---
![Atomic Logo](blog/atomic.png) I recently attended [LinuxCon Europe 2015](http://events.linuxfoundation.org/events/linuxcon-europe) from 5-7 October, 2015 in Dublin, Ireland. I came with high expectations and goals and I am pleased to be able to say they were met.

The conference was combined with two other conferences (CloudOpen and Embedded Linux Conference Europe) and I expected it to be a painful to navigate a huge venue, where I wouldn't be able to find anyone. Instead, at about 1500-2000 people, the combined conference was very addressable, allowed for easy crossing of tracks, and presented a fantastic "hallway track." The organizers, sponsors, and venue did a fantastic job.

Rather than recap every talk I attended, I'll talk about the event from the perspective of a software engineer working with container-related technologies. In my $dayjob I focus on [Project Atomic](http://www.projectatomic.io), a collection of container-related technologies that make containers easier to implement and deploy. While the project focuses on Docker containers and tends to use the Kubernetes orchestrator, Atomic is really container-technology agnostic.

READMORE

I attended Alban Crequy's talk, ["Container Mechanics in rkt and Linux"](http://events.linuxfoundation.org/sites/events/files/slides/Container%20mechanics%20in%20rkt%20and%20Linux.pdf). Because I don't work directly on Docker (or rkt), I have a comprehension of how the software works, but not of how it is actually implemented. Crequy's talk provided an in-depth discussion of namespaces, cgroups, and the like to explain the underlying "judo flips" the kernel does to make a container live in its own world. It was great to understand the underlying layers. However, I would have appreciated a talk that included specifics on rkt's implementation choices versus Docker.

Joe Brockmeier from Red Hat moderated a panel discussion between Tom Barlow (Docker), Sebastian Goasguen (Citrix), and Brandon Philips (CoreOS) about containers. As you may know, the technology underlying containers is not new and that a big part of the innovation provided by Docker and others is an easier way to package and access this technology. The conversation had something for everyone involved with containers--from where the technology is going for core developers, to whether containers are just reinventing packaging for operations people and service discovery issues for application developers. A more detailed overview of this panel is up at [Project Atomic](http://www.projectatomic.io/blog/2015/10/container-roundtable-linuxcon-eu/).

Vaclav Pavlin from Red Hat presented [Nulecule](https://github.com/projectatomic/nulecule), a specification for describing multi-container applications, and [Atomic App](https://github.com/projectatomic/atomicapp), an implementation of the Nulecule specification. Deployment of one or a small number of related containers is easy. Once you get to scale configuring and deploying complex applications becomes more challenging. If you have several orchestrators in the mix, the problem becomes exponentially more challenging. Nulecule steps in to provide a way of handing off the automatable portion of deployment to software which allows the user to focus on the configuration parameters that matter. (Note: If you didn't get to see Vaclav's talk and are in the Brno, Czech Republic area, he will be presenting it again at the [Docker Brno Meetup on 15 October](http://www.projectatomic.io/blog/2015/10/docker-brno-meetup/).)

Project Atomic and its components were presented by Brockmeier in a separate session. Joe covered Atomic Host, an innovative build of Linux distributions that leverages their existing trust and packaging and couples it with an atomic updating and rollback features derived from the Gnome Continuous project. He also talked about how the container execution and deployment tools, /usr/bin/atomic, and Atomic App can be used today and improved by you tomorrow.

CoreOS's Philips also presented a 90-minute talk and demonstration on using the CoreOS platform to deploy container applications. CoreOS is a custom Linux distribution built for containers and atomic updating. It includes an automated management layer for updates with the specific intent of shifting operational focus up the stack to the application. He also covered Kubernetes usage and execution in detail and showed off Tectonic, a graphical console for CoreOS clusters.

Ryan Jarvinen from Red Hat demonstrated [OpenShift](https://www.openshift.org/) and how easy it is to have a fully capable end-to-end dev-ops enabled container deployment environment. During the demo audience members were invited to interact with a running app that was scaled to meet demand. A second interactive demo allowed audience members to do a source-to-image deployment directly from GitHub to OpenShift with a single git commit.

There were many other talks of note, and I encourage you to look at other trip reports and the presentations' slides at [the conference website](http://events.linuxfoundation.org/events/linuxcon-europe) for more details. The opportunity to interact with community members from CloudOpen and the Embedded Linux Conference was super and many ideas that I saw solely from a Linux or container perspective were expanded in my conversations with other attendees.
