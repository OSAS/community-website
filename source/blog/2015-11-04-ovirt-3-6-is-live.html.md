---
title: oVirt 3.6 Is Live!
date: 2015-11-04 14:47 UTC
author: mikey
tags: oVirt, releases
comments: true
published: true
---
![oVirt logo](blog/oVirt-logo.png) As the dust settles on LinuxCon / CloudOpen Europe 2015 and preparations are starting for FOSDEM 2016, the oVirt team has been hard at work to launch the latest iteration of oVirt, version 3.6. With features like tech previews of Docker integration and Debian support; Fedora 22 support; VirtIO Serial Console; a new Affinity Rules Enforcement Manager; and self-hosted Engine support for FibreChannel and Gluster, this is an exciting and important milestone for the oVirt project.

As the upstream development project for [Red Hat Enterprise Virtualization](http://www.redhat.com/en/technologies/virtualization), [UDS Enterprise](https://www.udsenterprise.com/en/), and [Wind River Open Virtualization](http://www.windriver.com/announces/open_virtualization/), oVirt’s integrated virtualization enables enterprises to manage virtual machines with a robust toolset, without the need to re-develop applications to conform to cloud platforms' APIs. oVirt also offers advanced virtualization capabilities, including high availability, live VM migration, live storage migration, the ability to self-host the oVirt engine on a managed virtual machine, and more.

READMORE

## What’s New in oVirt 3.6?

 * **[Experimental Docker integration for Cinder and Glance](http://www.ovirt.org/CinderGlance_Docker_Integration).** The cinder and glance services are now available as Docker images that you can deploy and configure within the engine from engine-setup. The images are provided by the [Kolla (kollaglue) project](https://github.com/openstack/kolla) and are built by Holla project maintainers, along with other production-ready containers and deployment tools for operating OpenStack clouds.

 * **[VirtIO Serial Console](http://www.ovirt.org/Features/Serial_Console).** This feature allows you to directly connect to the VM's serial consoles, emulated through VirtIO channels and using ssh, without directly accessing Engine. Engine is still used by in background to learn about the VM placement and to store authentication keys.

 * **Self-hosted Engine support for [FibreChannel](http://www.ovirt.org/Features/Self_Hosted_Engine_FC_Support) and [Gluster](http://www.ovirt.org/Features/Self_Hosted_Engine_Gluster_Support).** You can now use FibreChannel and Gluster for the Hosted Engine data domain.

 * **[New Affinity Rules Enforcement Manager](http://www.ovirt.org/Affinity_Rules_Enforcement_Manager).** The new manager enforces affinity rules for running VMs by periodically checking each cluster for affinity rule conflicts and attempting to resolve those conflicts by migrating problematic VMs. The manager leverages the existing automatic migration mechanism to prevent conflicts and ensure a smooth migration process.

 * **Fedora 22 support.** Support for running oVirt on Fedora 22 (or similar) has been added with custom packaging of Wildfly 8.2.0.

 * **[Experimental Debian support for hosts](http://www.ovirt.org/Features/Debian_support_for_hosts).** You can now run oVirt Hosts on Debian (or similar) with custom packaging of the required dependencies.

Check out the [release notes and complete feature list](http://www.ovirt.org/OVirt_3.6_Release_Notes) on the [oVirt website](http://www.ovirt.org), and [get started with oVirt 3.6](http://www.ovirt.org/Download) today.
