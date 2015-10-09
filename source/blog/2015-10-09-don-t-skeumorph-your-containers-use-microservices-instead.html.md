---
title: Don't Skeumorph your Containers, Use Microservices Instead
date: 2015-10-09 12:48 UTC
author: ghaff
tags: containers, Project Atomic, OpenShift
comments: true
published: true
---

The genesis of this article was a financial industry luncheon in New York City a couple of years back at which I was invited to speak. The topic was this new "containers" thing: what it was, where it was going, and how it could best be used. Of particular interest was how containers related to virtual machines (VMs).

At this point, it's worth remembering the context in which server virtualization and its VMs became such a popular technology, fundamentally changing how many datacenters were operated and spawning a mini-industry of complementary vendors and products. Although initially introduced as primarily a tool for developers, virtualization rapidly became instead a way to carve out multiple virtual servers from a single physical server. This server consolidation was initially driven by cost-cutting, a popular pasttime after the dot-com bubble popped.

READMORE

Server virtualization didn't much change, at least at first, the basic model for operating and managing servers. The individual server instances, i.e. operating system copies, looked and acted pretty much like physical servers from the perspective of the sysadmin. Indeed, that was sort of the idea. Improve server utilization but keep everything else the same. What's not to like? It's almost like free money.

Of course, server virtualization has evolved to be about much more than server consolidation. Indeed, a project like OpenStack builds on server virtualization to tie together many servers into a software-defined infrastructure. However, the basic building block remains the virtual server which still shares many of the operational characteristics of a physical server.

## Skeumorphism

We discussed these and other topics at our aforementioned luncheon. Then someone (whose name I unfortunately didn't get) made an observation which stuck with me. He said something to the effect of "Oh, so virtual machines are skeumorphed servers."

Some further background may be needed here. At around that time, there was a lot of discussion going on about skeumorphism as a design concept because of recent changes Apple had made to the look of its operating systems. Skeumorphism retains design features and cues from older technologies to newer ones. The idea is that familiarity makes for an easier transition.

In Apple's case, the shift was mostly about discarding physical world elements like leather bindings on books from their digital representation. My lunchtime companion was logically extending the term to suggest that traditional server virtualization was maintaining practices and approaches from the physical server world that weren't necessarily the best fit with today's software-defined world and distributed application architectures.

In the case of containers, the change comes about by moving to more modular applications that encapsulate their component parts with containers and communicate through well-documented APIs. In practice, there's a great deal of variation in how applications are and will be componentized and the details of a modern service-oriented approach. For our purposes here, however, I'm going to focus on microservices as the (somewhat idealized) implementation of application decomposition that's an obvious match with the container model.

## Microservices

[Martin Fowler](http://martinfowler.com/articles/microservices.html) describes microservices as putting "each element of functionality into a separate service and scaling by distributing these services across servers, replicating as needed." While aspects of this may sound a bit like traditional Service-Oriented Architectures--which few remember fondly--there are important differences.

Today service-oriented (whether microservices or the more general case) approaches almost universally use lightweight communications mechanisms like RESTful APIs rather than heavyweight ones like SOAP. Open source also plays a *far* larger role than previously and, at least partly for this reason, the overall landscape is much more standards-based and vendor-neutral. Even without taking containers and microservices into account, IT architectures are also more oriented toward horizontal scale, rapid provisioning, and automation than they were a decade or two ago. Finally, businesses are simply demanding much more rapid and flexible application delivery; modern DevOps tooling, processes, and culture in support of this mandate require infrastructure that is also flexible.

Characteristics of microservices involve words like autonomous and small.

Autonomous means that implementation changes can happen independently of other services and that data and functionality exposed only through service calls over the network. In effect, a microservice may or may not have a public API that's exposed to the world as a whole--but it acts like it does. Autonomy is also closely related to the "bounded context" concept, discussed by Eric Evans in his book *Domain Driven Design.* Bounded context means that you want to avoid a service having to know too much about surrounding services and being robust in the face of changes to other services.

Autonomy should generally be a feature of good service design generally. A microservice is perhaps most distinct in that it is also "small." What's small? One element is that it's a well-defined function: a video transcoder or a query of a subscriber ID. However, microservices are also often described in terms of their relationship to people. It "fits in one person's head." Or it's the responsibility of a single cross-functional team. (This latter characteristic is an example of [Conway's Law](http://www.melconway.com/Home/Conways_Law.html) by which systems reflect organizational structure or vice versa.

## Why Might You Want to Use Microservices?

Small size and autonomy have several consequences. Microservices can make it easier for teams to pick the right tool for the job and to pick the release cycle that's most appropriate for their component. Small units of functionality also encourage experimentation, which can lead to more innovation, and make it easier to push rapid updates as part of a continuous integration/continuous delivery process.

Smaller and more modular components can also make it easier to build-in resiliency and performance at scale. That said, high-performance and robust microservices architectures tend to be complex and require careful thought about where service boundaries lie, the implications of service failures, and the effect of communication overhead. A recent piece by [Stavros Korokithakis](http://www.stavros.io/posts/microservices-cargo-cult/) is a good read on the tradeoffs involved.

## Containers Plus Microservices

Because containers are built around the concept of packaging an application component together with just the supporting code (like libraries) that it needs, containers are a good match for the microservices concept. Furthermore, microservices can be spun up and down quickly which also fits well with an architecture consisting of many small, discrete functional elements that need to be scaled up or down rapidly.

A varied set of technologies and open source projects are associated with containers including Linux, Docker, and Kubernetes. One can get started by working directly with the individual upstream projects. However, in many cases, it will be easier to start with a platform such as [Atomic Host](http://www.projectatomic.io/) that's designed specifically to run containerized applications and which brings together the needed technologies in one place. (A PaaS, like [OpenShift Origin](http://www.openshift.org/)--or its online and commercial on-site downstreams provides an even higher level of integration specifically oriented toward the developer experience.)

However, even if containerized infrastructure isn't used for deploying applications in a strictly microservices-architected manner today (or even tomorrow), they are increasingly the basis for the modern distributed application platform. As part of that platform, they may be used as lighter-weight VMs at first. But think about using them in new, and potentially more powerful, ways.
