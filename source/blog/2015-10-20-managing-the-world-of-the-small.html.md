---
title: Managing the World of the Small
date: 2015-10-20 20:20 UTC
author: bkp
tags: community, oVirt, RDO, Gluster, ManageIQ
comments: true
published: true
---
![ATO 2015 Logo](blog/allthingsopen2015_sm.png) There is a growing discussion in the IT world about the ways in which we, as information technologists, will approach managing the world of the small.

There are two aspects of current technology that fall into this category of "small"--containers and the Internet of Things. Both technologies were the subject of two intriguing keynotes at the opening session of [All Things Open](http://allthingsopen.org) yesterday.

READMORE

It's been no secret that Intel is keenly interested in the Internet of Things (IoT) of late, and Intel's Director of Embedded Software in the Open Source Technology Center Mark Skarpness laid out a concise look at how the hardware computer company is approaching the promise of a world of interconnected IP devices.

Currently, there are three obstacles that Skarpness perceives as a barrier to IoT growth: a lack of knowledge in embedded systems, a lack of knowledge and implementation of best security, and determining the most efficient ways in which IoT devices can communicate with the cloud and each other. This last aspect is particularly tricky; presently, many IoT devices operate in a siloed fashion. one or many sensored devices will talk to a control device, which in turn will talk to master server in the cloud that will collect data or deliver optimized operation instructions. But Company X's devices will usually only work with Company X's systems. Not Company Y or Z. This situation has led to what some wags on the press have called "[The CompuServe of Things](http://readwrite.com/2013/06/14/whats-holding-up-the-internet-of-things)."

This is clearly a situation about which Skarpness and his colleagues are well aware, and he did not try to give it short shrift when he told his audience what the path to better IoT would be. Issues like connectivity and customization of IoT devices in terms of form factor and purpose were two major elements of Intel's IoT plan moving forward, Skarpness said, along with the aforementioned need to lock such devices down.

It was the fourth element of Intel's plan that particularly caught my attention: building control systems that provide device management within the unique IoT ecosystem. Not only are deployed IoT devices found in very high numbers (think swarm instead of farm), but they can also be hardware-frozen. If you have a number of sensors buried in the road, for example, you can't just dig them out and update their onboard hardware. You may not even be able to update the software; some devices may be transmit-only, not receive.

Managing devices in such circumstances can be tricky at best. The numbers alone can be daunting; sensor-equipped devices can range in the tens of thousands and the amount of data produced can create a huge firehose of incoming data. Indeed, many of these issues may seem familiar to those wrestling with another "new" bit of technology: containers.

Like IoT devices, containers are also proving to be a challange to manage. Containers and the microservices they host are not so much managed as orchestrated, according to the next keynote speaker, Sarah Novotny, Head of Developer Relations at NGINX.

Novotny referenced Skarpness' outline of IoT concerns in her discussion of how information technologists should be approaching the future.of technology. Novotny's talk highlighted Alan Gopnik's 2011 New Yorker article "[The Information](http://www.newyorker.com/magazine/2011/02/14/the-information)," which decribed how people then viewed the influence of the Internet on their lives: "call them the Never-Betters, the Better-Nevers, and the Ever-Wasers." Novotny skillfully weaved these terms into the ways in which we view current technologies, including containers.

For containers, the "Better-Nevers" would look at the problem of managing containers and highlight the huge complexities in dealing with app-centric tools that in some cases, [may only have a mayfly-like lifespan](http://thenewstack.io/containers-as-bacteria-and-other-docker-trends-via-new-relic/). The "Never-Betters" may see the positive benefits of microservices and realize that their benefits will outweigh the costs.

This may very well be true, but whatever your outlook, the challange of maintaining a cohesive form of management in container or IoT space is very real. As powerful as tools like [oVirt](http://www.ovirt.org), [RDO](http://rdoproject.org), and [ManageIQ](http://www.manageiq.org) may be, they are designed for managing whole machines (real or virtual), not potentially millions of containers or inerconnected hardware devices. This is why you see such emphasis placed on projects like [Atomic](http://projectatomic.io), which are a new step towards a world where managing the small is even more of a critical need than managing the large.

This is a case of art (as technology) imitating life. Our tools are becoming reflections of our biology: where untold billions of microsystems make up the macrosystems we call the life we see around us. The transition won't be easy, but the path to this kind of system deployment seems clear. It is fortunate the innovation that's inherent in open source will help speed things along.
