---
author: dneary
comments: true
layout: post
title: OpenDaylight Helium Gets Out of the Gate
date: 2014-10-02 17:38 UTC
tags:
- OpenDaylight
- Helium
- Virtualization
- OVSDB
- Open vSwitch
- wcbench
categories:
- Blog
---
![](blog/opendaylight_logo.png)Whether you are deploying applications in containers, VMs, or on bare metal, being able to group related services together into private networks and control the traffic flowing into and out of your infrastructure is important. The SDN controller fulfills that role by allowing you to define network policy centrally and have that policy applied at the edges of your network, in the physical and virtual network switches. 

[OpenDaylight](http://opendaylight.org ) is an open source SDN controller. In its short lifetime, OpenDaylight has gained support from a diverse set of companies and individuals who are eager to see an open source controller serve the networking needs of traditional IT, cloud infrastructure platforms, traditional virtualization management, and fleets of containers. Cisco released the initial code in 2013 and the project now includes 41 paying members. Red Hat is a founding member of the project at Platinum level. 

This week the OpenDaylight project had its second major code release, code-named Helium, which is a big advancement for the project. The release includes more than 4,700 contributions from 183 engineers, representing [20 companies](http://spectrometer.opendaylight.org/?project_type=all&metric=commits). More than 300 commits came from the affiliation "independent", which also shows the breadth of the project's appeal. 

READMORE

The new release includes significant improvements developed by Red Hat engineers, especially in the areas of OVSDB (Open vSwitch Database), SFC (service function chaining), performance analysis and enhancements, and AAA (authorization, authentication, accounting). 

## OVSDB

OVSDB is OpenDaylight's “Southbound” interface for Open vSwitch, which means it translates higher order network topology requests into instructions to configure Open vSwitch virtual switches. Open vSwitch is installed on hosts on the network and connects virtual network interfaces in virtual machines to a physical network interface.
In the Helium release, Red Hat engineers implemented major features for the OVSDB driver. Among the new features is distributed L3 forwarding, which enables Open vSwitch to send traffic efficiently across the network, and gives distributed ARP handling as a bonus. OVSDB underwent a significant module redesign, which, among other things, makes using it as a stand-alone module with a RESTful API easier. We also enabled OpenStack Neutron features in OVSDB, such as security rules, load balancing as a service, and firewall as a service, which makes OpenDaylight Helium with OVSDB a great choice for an OpenStack Neutron back-end. VLAN networking was added as an option for creating virtual networks, in addition to the existing tunnel-based networking options, which were available in the previous OpenDaylight release.

## Service Function Chaining

Traffic coming into a tenant network often needs to pass through a number of services before it gets to your tenant. For example, traffic into a VPN may need to go through a VPN endpoint, then an intrusion detection system, then a firewall, and finally through a load balancer before getting to its destination at a webserver. Service function chaining is a way to define a series of services through which traffic must go in a certain order on its journey through the network. This feature is vital in applications such as network function virtualization. In this release cycle, we defined the SFC architecture and data models for an implementation on OpenDaylight focused on building Service Chains with Open vSwitch-based Service Functions.

## Performance Work

Although many performance tools are available for systems programming, few tools exist for analyzing performance in the network. Red Hat developers developed a tool called wcbench, which is a Python wrapper around the network performance tool CBench, and integrated performance testing into OpenDaylight's continuous integration process. This helped with identifying and fixing a number of critical performance issues.

## Authentication, Authorization, and Accounting

Authentication is the verification of your identity, authorization is checking whether you have permission to do what you want to do, and accounting records what you did. If you are using OpenDaylight as part of a virtualization or cloud platform, you probably already have an identity store that you are using for it. The AAA module in OpenDaylight serves two purposes: enabling fine-grained permissions for resource usage, and enabling the ability to share an external identity service with other platforms.

For Helium, we have been working on updating the module to leverage authentication services and identity information provided by the underlying System Security Services Daemon (SSSD) of the platform. This means you can use identity providers such as FreeIPA to provide centralized authentication, user, and group information for assignment of roles. This centralized identity information can easily be shared with other applications in your enterprise, such as OpenStack.

## What's Next for OpenDaylight? 

With the Helium release, OpenDaylight is ready for widespread adoption.
OpenDaylight is now a viable SDN controller for use with projects such as CloudStack and OpenStack, and gives significant scalability advantages over alternative approaches that avoid an SDN controller. The release establishes a great baseline for future feature development, with a diverse community and a solid platform for the development of network functionality.

As containers become more popular for the deployment of complex applications, multi-tenancy and the ability to define a network topology with software will become vital for Docker and friends, which is exactly what an SDN controller is designed to provide.
OpenDaylight is already useful for network engineers managing physical network hardware the old-fashioned way. By separating the control plane from the data plane,  OpenDaylight also allows users to centralize and automate managing and deploying network configurations.

You can find out more about the Helium release on the [Open Daylight website](http://www.opendaylight.org/announcements/2014/09/opendaylight-paves-way-innovation-software-defined-networking-latest-open_). [Get started](http://www.opendaylight.org/resources/getting-started-guide) with Open Daylight Helium today, and consider [getting involved](http://www.opendaylight.org/community) to improve the project for the next release, Lithium, due out in early 2015.