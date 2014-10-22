---
author: bkp
layout: post
comments: true
title: "oVirt Community Update: July 2014"
date: 2014-07-10 13:33 UTC
tags:
- oVirt
- KVM
- PatternFly
categories:
- Blog
---
![](blog/oVirt-logo.png)
oVirt 3.5 is in beta phase this month, as the community progresses toward the latest release of the open source datacenter virtual management platform.

Right out of the gate, users are going to notice an all-new look and feel to the oVirt interface, as the UX  team rolls out phase one of the new [PatternFly interface](http://www.ovirt.org/Features/NewLookAndFeelPatternFlyPhase1).

READMORE

This is a major interface improvement for oVirt, integrating the Bootstrap3 CSS library into ovirt-engine via [PatternFly open interface project](https://www.patternfly.org/). Working in the PatternFly framework will give oVirt a common set of interface tools with other enterprise-ready tools using PatternFly. As indicated earlier, this it the first phase of several that the oVirt project will undergo to shift completely to a PatternFly-based interface.

![](http://www.ovirt.org/images/f/f7/OVirt-LAF-Admin-Banner-Only.png)

But the changes will go beyond just looks. Big improvements are coming under the hood, too. The Authentication, Authorization, and Accounting (AAA) system in oVirt is getting a significant overhaul, to provide a clear separation of authentication from authorization. This separation will enable oVirt to have more flexibility in both authentication and authorization, such as authenticating with a tool other than Kerberos, if desired. Even more useful, a developer API will be exposed to enable coders to create custom extensions for authentication and authorization.

Other AAA improvements will include a generic LDAP provider for ovirt-engine and, if you still choose to use Kerebros, a tech preview to access Kerebros via REST API.

Another big change is a parting of the ways between oVirt and the websocket, DWH historical database, and report tools. No, they're not going away, but they *can* be separated from the ovirt-engine host. Currently, all of these tools have to reside on the same host as ovirt-engine. As of 3.5, oVirt admins can install all three of these components on separate hosts from ovirt-engine and gain potential performance improvements for Engine and this tool set.

We've already highlighted the new [oVirt Engine Appliance](/blog/2014/06/simplify-vm-management-with-appliances/), and there's another new appliance joining the oVirt ecosystem, the [Neutron Virtual Appliance](http://www.ovirt.org/Features/NeutronVirtualAppliance), which will enable OpenStack's Neutron server as a network provider. This means deploying Neutron will become easier without having to deploy Neutron manually.

Support for guest virtual machines is also growing. Although oVirt can handle any KVM-managed VM, we have offered additional support for some VM operating systems in the past, such as guest agents for Windows and Ubuntu. In 3.5, there will be guest agents for SUSE Linux Enterprise Server and Debian 7, as well as an updated Windows guest agent and drivers for easier deployment. Users will also be able to clone a down VM without a snapshot or template.

Users will be able to set up iSCSI-based storage for hosted engine, as well as import existing data domains and live merge snapshots from an active chain.

oVirt 3.4 saw the first support of the PPC64 architecture, and with the release of Power8, oVirt 3.5 is pleased to continue the progress, with new pre-built packages of VDSM available for PPC64. No more building your own.

These are just a few of the many enhancements coming in oVirt 3.5, which continues to make great strides as the premier open source virtual machine manager. 
