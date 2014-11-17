---
title: NFV and SDN at the OpenStack Summit Paris
author: dneary
date: 2014-11-17 17:41:55 UTC
tags: NFV, SDN, OpenStack, OpenStack Summit, video, Nova, OpenDaylight
published: true
comments: true
---

![](blog/openstacksummit_button.jpg) My first dilemma was at 11:40AM on Monday, right after the morning keynotes on the first day of the [OpenStack Summit](https://www.openstack.org/summit/openstack-paris-summit-2014/), which was held November 3-7 in Paris, France. I had to decide between a design summit session for [OpenDaylight Neutron plug-in design](http://sched.co/1nfFPwC), and three main track sessions: [IPv6 in OpenStack Juno](http://sched.co/1qeOfm4) in the Networking track, [Open Networking and SDN for Next-Generation OpenStack Clouds](http://sched.co/1vI1m0I) in the sponsored sessions, and [ Orange: A Leading Operator of the Internet Era Leaping to Cloud ](http://sched.co/1qeRBFy) in the telco track. In the end, IPv6 won out, but the dilemmas continued all day.

Throughout the conference, finding two, three, or four networking or SDN sessions occurring at the same time was not unusual. In the main conference, there were 15 sessions specifically on NFV and related topics, many to standing-room-only audiences, and another 30 or so on networking and SDN. In the developer conference across the street, the [OpenStack Kilo Design Summit](http://kilodesignsummit.sched.org/), two sessions were dedicated entirely to [NFV](https://etherpad.openstack.org/p/kilo-nova-nfv) and [telco needs](https://etherpad.openstack.org/p/kilo-summit-ops-telco). In addition, it was a prominent theme all week in design summit sessions related to OpenStack projects Nova (compute), Neutron (network) and Congress (policy).

READMORE

Added to that,  SDN vendors made a number of prominent announcements. For example, three new open source SDN projects were announced: [MidoNet](http://midonet.org/), [Akanda](https://github.com/dreamhost/akanda), and [ONOS](http://onlab.us/).

Saying that NFV was a prominent theme during the conference would be an understatement. 

## NFV Videos from Paris

The  OpenStack Foundation quickly uploaded [session videos](https://www.openstack.org/summit/openstack-paris-summit-2014/session-videos/), and the following sessions provide a taste of the NFV content:

<iframe width="560" height="315" src="//www.youtube.com/embed/uBlE9GatNz4" frameborder="0" allowfullscreen></iframe>

Michael Still, the OpenStack Nova project technical leader, interviewed a panel of people deploying OpenStack clouds in the telecommunications industry. The panel included speakers from [Swisscom](http://www.swisscom.ch), [AT&T](http://www.att.com/), and [Orange](http://www.orange.com/en/home). The keynote gives a high-level overview of NFV and other problems telcos are solving with OpenStack. 

<iframe width="560" height="315" src="//www.youtube.com/embed/gyzMOeYjoQg" frameborder="0" allowfullscreen></iframe>

Chris Wright from Red Hat and Tom Nadeau from Brocade talked about [OPNFV](https://www.opnfv.org/), the Open Platform for NFV, a recently launched Linux Foundation project for network function virtualization, and they explained its relationship to OpenStack and OpenDaylight.


<iframe width="560" height="315" src="//www.youtube.com/embed/aQJ2du2UalA" frameborder="0" allowfullscreen></iframe>

For OpenStack developers who want to understand better the constraints of NFV use-cases, the changes that are being requested by telcos, and how the changes affect performance, this session is pure gold. Steve Gordon of Red Hat, Adrian Hoban of Intel, and Alan Kavanaugh of Ericsson go over the changes required to make OpenStack a good platform for NFV, without assuming that you are familiar with networking or telco already.

<iframe width="560" height="315" src="//www.youtube.com/embed/nqxKKJBCDjE" frameborder="0" allowfullscreen></iframe>

If you want to see a virtual network function in action and understand the management and orchestration features being requested by telcos, this presentation from Toby Ford of AT&T and Mats Karlsson of Ericsson show how an orchestration platform can allow a network function to self-heal and maintain service throughout a server outage, and they explain some of the constraints that the telco business imposes on the platform.

<iframe width="560" height="315" src="//www.youtube.com/embed/nqxKKJBCDjE" frameborder="0" allowfullscreen></iframe>

*You might also like:*

[Red Hat Joins the OPNFV Project as Platinum Founding Member](http://community.redhat.com/blog/2014/09/opnfv-launches/)