---
author: bkp
title: oVirt 3.5 Rolls Out
date: 2014-10-17 12:00 UTC
tags:
- oVirt
- KVM
- Virtualization
---
![oVirt logo](blog/oVirt-logo.png) To say that October was a big month for [oVirt](http://www.ovirt.org) would be a little bit of an understatement.

This past week was the [KVM Forum](http://events.linuxfoundation.org/events/kvm-forum), a three-day event in Düsseldorf that brought together the entire KVM community, which included oVirt users and developers. The October 16th [oVirt Workshop](http://www.ovirt.org/KVM_Forum_Workshop_Oct_2014), a free-of-charge event co-located with the KVM Forum, focused on the oVirt datacenter platform and its use in business and academic worlds.

READMORE

To finish off the events, the oVirt team has released the next iteration of oVirt, release 3.5.

As the upstream development project for [Red Hat Enterprise Virtualization](http://www.redhat.com/en/technologies/virtualization), [UDS Enterprise](https://www.udsenterprise.com/en/), and [Wind River Open Virtualization](http://www.windriver.com/announces/open_virtualization/), oVirt’s integrated virtualization enables enterprises to manage virtual machines with a robust toolset, without the need to re-develop applications to conform to cloud platforms' APIs. oVirt also offers advanced virtualization capabilities, including high availability, live VM migration, live storage migration, the ability to self-host the oVirt engine on a managed virtual machine, and more. 

## What's Happening with oVirt 3.5?

* [Live Merge](http://www.ovirt.org/Features/Live_Merge): If an image has one or more snapshots, oVirt 3.5's merge command will combine the data of one volume into another. Live merges can be performed with data pulled from one snapshot into another snapshot. The engine can merge multiple disks at the same time and each merge can independently fail or succeed in each operation.

* [Import Storage Domain](http://youtu.be/YbU-DIwN-Wc): This latest release expands oVirt's feature of importing ISOs and exporting storage domains to expand support for importing an existing data storage domain. Based on information stored in the storage domain, oVirt can revive entities such as disks, virtual machines, and templates in the setup of any data center to which the storage domain is attached.

* [Advanced Foreman Integration](http://www.ovirt.org/Features/ForemanIntegration): oVirt 3.5 adds the capability to provision and add hypervisors to oVirt from bare metal. Foreman is a complete lifecycle management tool for physical and virtual servers. Through deep integration with configuration management, DHCP, DNS, TFTP, and PXE-based unattended installations, Foreman manages every stage of the lifecycle of your physical or virtual servers. Integrating Foreman with oVirt helps add hypervisor hosts managed by Foreman to the oVirt engine.

oVirt 3.5 also provides enhanced [Authentication, Authorization, and Accounting support](http://youtu.be/aavmOAw7Fa8), a [new interface based on the popular PatternFly interface](http://www.ovirt.org/Features/NewLookAndFeelPatternFlyPhase1), and a new optimizer tool integration that will guide users on how to reduce resource fragmentation. The enhanced self-hosted engine now supports iSCSI storage as requested by the community. oVirt 3.5 will also feature JSON-RPC support for message-based communication, as well as a new oVirt appliance that can be launched in an existing virtual machine manager as a complete oVirt machine, ready for operation.

To see a complete list of oVirt 3.5 features, check out the [oVirt 3.5 release notes page](http://www.ovirt.org/OVirt_3.5_Release_Notes). We're pretty excited for this new version of oVirt, and we [invite you to check it out today](http://www.ovirt.org/Download).
