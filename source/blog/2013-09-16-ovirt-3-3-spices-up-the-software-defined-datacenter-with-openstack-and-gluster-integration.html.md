---
author: admin
comments: true
date: 2013-09-16 21:19:30+00:00
layout: post
slug: ovirt-3-3-spices-up-the-software-defined-datacenter-with-openstack-and-gluster-integration
title: oVirt 3.3 Spices Up the Software Defined Datacenter with OpenStack and Gluster
  Integration
wordpress_id: 410
categories:
- Blog
tags:
- gluster
- kvm
- Networking
- Neutron
- OpenStack
- ovirt
---

The oVirt 3.3 release may not quite let you manage _all the things_ in the data center, but it's getting awfully close. Just shy of six months after the [oVirt 3.2 release](http://www.ovirt.org/OVirt_3.2_release_notes), the team has [delivered an update](http://www.ovirt.org/OVirt_3.3_release_notes) with groundbreaking integration with OpenStack components, GlusterFS, and a number of ways to custom tailor oVirt to your data center's needs. 

## What is oVirt?

oVirt is an entirely open source approach to the software defined datacenter. oVirt builds on the industry-standard open source hypervisor, KVM, and delivers a platform that can scale from one system to hundreds of nodes running thousands of instances.

The oVirt project comprises two main components:

	
  * **oVirt Node**: A minimal Linux install that includes the KVM hypervisor and is tuned for running massive workloads.

	
  * **oVirt Engine**: A full-featured, centralized management portal for managing oVirt Nodes. oVirt Engine gives admins, developers, and users the tools needed to orchestrate their virtual machines across many oVirt Nodes.

See the [oVirt Feature Guide](http://www.ovirt.org/OVirt_3.0_Feature_Guide) for a comprehensive list of oVirt's features.

## What's New in 3.3?

In just under six months of development, the oVirt team has made some impressive improvements and additions to the platform.

### Integration with OpenStack Components

Evaluating or deploying OpenStack in your datacenter? The oVirt team has added integration with Glance and Neutron in 3.3 to enable sharing components between oVirt and OpenStack.

By integrating with Glance, OpenStack's service for managing disk and server images and snapshots, you'll be able to leverage your KVM-based disk images between oVirt and OpenStack.

[OpenStack Neutron integration](http://www.youtube.com/watch?v=S16AfFylcHk) allows oVirt to use Neutron as an external network provider. This means you can tap Neutron from oVirt to provide networking capabilities (such as network discovery, provisioning, security groups, etc.) for your oVirt-managed VMs.

oVirt 3.3 also provides [integration with Cloud-Init](http://www.ovirt.org/Features/Cloud-Init_Integration), so oVirt can simplify provisioning of virtual machines with SSH keys, user data, timezone information, and much more.

### Gluster Improvements

With the 3.3 release, oVirt gains support for using GlusterFS as a storage domain. This means oVirt can take full advantage of Gluster's integration with Qemu, providing a performance boost over the previous method of using Gluster's POSIX exports. Using the [native QEMU-GlusterFS integration](http://raobharata.wordpress.com/2012/10/29/qemu-glusterfs-native-integration/) allows oVirt to bypass the FUSE overhead and access images stored in Gluster as a network block device.

The latest oVirt release also allows admins to use oVirt to manage their Gluster clusters, and oVirt will recognize changes made via Gluster's command line tools. In short, oVirt has gained tight integration with network-distributed storage, and Gluster users have easy management of their domains with a simple user interface.

### Extending oVirt

Out of the proverbial box, oVirt is already a fantastic platform for managing your virtualized data center. However, oVirt can be extended to fit your computing needs _precisely_.

	
  * **[External Tasks](http://www.ovirt.org/Features/ExternalTasks)** give external applications the ability to inject tasks to the oVirt engine via a REST API, and track changes in the oVirt UI.

	
  * **[Custom Device Properties](http://www.ovirt.org/Features/Device_Custom_Properties)** allow you to specify custom properties for virtual devices, such as vNICs, when devices may need non-standard settings.

	
  * **[Java-SDK](http://www.ovirt.org/Java-sdk)** is a full SDK for interacting with the oVirt API from external applications.

## Getting oVirt 3.3

Ready to take oVirt for a test drive? Head over to the [oVirt download page](http://www.ovirt.org/Download) and check out Jason Brooks' [Getting Started with oVirt 3.3 Guide](/blog/2013/09/up-and-running-with-ovirt-3-3). Have questions? [You can find us on IRC](http://www.ovirt.org/Community) or [subscribe to the users mailing list](http://www.ovirt.org/Mailing_lists#Users) to get help from others using oVirt.
