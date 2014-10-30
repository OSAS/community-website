---
author: bkp
comments: true
layout: post
title: Simplify VM Management with Appliances
date: 2014-06-20 16:07 UTC
tags:
- oVirt
- KVM
- Virtual Appliance
categories:
- Blog
---
![](blog/oVirt-logo.png)
The [oVirt project](http://www.ovirt.org/Home) is rolling nicely along, as the team keeps moving forward toward oVirt 3.5. I will focus more on that in a later post, but today I wanted to talk about a cool side project within oVirt that's been made public: the oVirt Engine Virtual Appliance.

Fabian Deutsch, one of the developers on the oVirt Node project, gives a [pretty good outline of what this new virtual appliance](http://dummdida.tumblr.com/post/88944206100/say-hello-to-the-ovirt-engine-virtual-appliance) can do. He writes, "Well, imagine a cloud image with oVirt Engine 3.5 and its dependencies pre-installed, and a sane default answer file for ovirt-engine-setup. All of this delivered in an OVA file. The intention is to get you a running oVirt Engine without much hassle. Furthermore this appliance can be used in conjunction with the Self Hosted Engine feature, and the upcoming oVirt Node Hosted Engine plugin (note the *Node* within)."

[Engine](http://www.ovirt.org/OVirt_Engine_Development_Environment) itself is the central component of the oVirt project, processing user requests, scheduling, monitoring virtual machines and host agents through VDSM, and handling error flows.

Having Engine as a virtual appliance makes it a lot easier to install as a cloud image, which is going to be music to the ears of IT managers looking to integrate virtual machine management into a cloud-based solution.

Like all new technologies, the oVirt Engine Virtual Appliance will need the kinks worked out. Deutsch has already made the request for heavy testing of the new appliance, so interested users are invited to build the appliance on their own and start kicking the tires today.
