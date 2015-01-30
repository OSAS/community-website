---
title: Network Management and SDN at FOSDEM
author: dneary
date: 2015-01-30 10:30:07 UTC
tags: FOSDEM, networking, devroom, VPNS, ethernet, SDN, Software Defined Networking,
  virtualization, OpenStack, virtual, Open vSwitch, OpenNMS, DNS server
comments: true
published: true
---

![](blog/fosdem2015.png) For the first time, [FOSDEM](http://www.fosdem.org) will include [a dedicated track](https://fosdem.org/2015/schedule/track/network_management_and_sdn/)
for networking. The DevRoom covers two distinct topics: network management (the configuration of host-level networking, such as VPNS, and ethernet and wifi connections) and SDN (Software Defined Networking, the management of networking in large networks, including routing and switching traffic, and enforcing network policy).

Software Defined Networking
===========================

The DevRoom opens with presentations on Software Defined Networking, the ability to define network flow centrally for an entire network. Presentations cover three themes:

* SDN controllers, overlay networks: These projects can manage networking for clusters of hosts, potentially with many virtual machines running on them. An SDN controller can manage both physical and virtual infrastructure centrally, whereas an overlay network completely dissociates the virtual network topology from the physical network topology. Learn how to use OpenContrail as a network virtualization platform with OpenStack, or discover newer open source projects including Calico, MidoNet, and VXVDE. We will also have an overview of OpenLISP, an open source implementation of the Locator/ID Separation Protocol.

* Virtual switches: A virtual switch is a way to bridge network connections for multiple virtual machines on a host to the physical network. Thomas Graf will give us a guide to tracking stateful services with Open vSwitch.

* Packet filtering, dataplane processing: A key piece of virtual networking is the ability to move network packet processing functionality out of the kernel and into userspace, where it can be less of a bottleneck. There are a number of presentations on the high-performance packet filtering project pflua, and on the Dataplane Development Kit (DPDK).

Network Management
==================

The second part of the day focuses on network configuration inside a host -- automating the process of connecting to the network and managing network connections and network hardware.

* Hardware management: Learn more about OpenNMS, open source solutions for managing hardware switches, and using the netlink protocol with pyroute2.

* Network management projects: There will be status updates from NetworkManager and networkd.

* Network services: Learn about Knot DNS, a stand-alone DNS server.

For this first edition, we will have 16 half-hour talks, which allows attendees to get a brief overview of a lot of projects. All of the presentations will be recorded and will be online soon after the conference. 

For more information about the projects presented, check out these links:

* [OpenContrail](http://www.opencontrail.org/)
* [Project Calico](http://www.projectcalico.org/)
* [MidoNet](http://midonet.org/)
* [VXVDE](http://wiki.v2.cs.unibo.it/wiki/index.php/Main_Page)
* [Open vSwitch](http://openvswitch.org/)
* [pflua](https://github.com/Igalia/pflua)
* [DPDK](http://dpdk.org/)
* [OpenNMS](http://www.opennms.org/)
* [pyroute](http://pyroute2.org/pyroute2-0.3.4/)
* [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager)
* [networkd](http://www.freedesktop.org/software/systemd/man/systemd-networkd.service.html)
* [Knot DNS](https://www.knot-dns.cz/)