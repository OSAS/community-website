---
title: Red Hat Joins the OPNFV Project as Platinum Founding Member
author: dneary
date: 2014-09-30 16:27:00.000000000 Z
tags: Red Hat, NFV, Virtualization, Linux Foundation, OPNFV, Telecommunications
comments: true
published: true
---

![](blog/opnfv_logo.jpg)
In recent years, the telecommunications industry has looked toward Network Function Virtualization (NFV) to revolutionize the way that telco services are developed and delivered to customers. A "network function" is any service that acts on the data passing through the network. In the typical datacenter, this would include services like a firewall, a VPN endpoint, or an intrusion detection system. In the telco industry, network functions also cover voice, data and internet services, broadband and cellular network services, and the delivery of video content, such as streaming TV.

Traditionally these network services have been provided by big, expensive, custom-built servers that require a multi-year investment for the network operators, so progress tends to be in fits and starts because previous investments are amortized before replacement features are deployed.

By moving the operation of these network services to virtual network functions (VNFs) running on a private cloud platform, on industry standard high-density servers, NFV enables operators to deliver customer-facing services more easily and faster. DevOps can finally come to the deployment of network services.

The Open Platform for NFV (OPNFV) project [launched](http://www.linuxfoundation.org/news-media/announcements/2014/09/telecom-industry-and-vendors-unite-build-common-open-platform) earlier today on [opnfv.org](http://opnfv.org) as an industry-wide effort that includes network operators, network equipment providers, platform vendors, and hardware vendors working together to create a reference platform for NFV. The goal is to take existing open source projects such as OpenStack, OpenDaylight, DPDK, libvirt, and KVM, and identify any areas where we can improve these platforms to enable the deployment of network services.

As a founding member of the project at the highest Platinum level, Red Hat recognizes the project's potential to change the telco industry, and is committed to bringing the company’s strengths to the table in support. One of the key challenges for the project will be to ensure that code developed for NFV is submitted and accepted upstream in the relevant projects, and Red Hat has a wealth of experience upstream in these communities and in affecting change across a number of projects.

READMORE

OPNFV was created as a continuation of the work of the [European Telecommunications Standards Institute (ETSI) NFV Industry Standardization Group](http://www.etsi.org/technologies-clusters/technologies/nfv), which created a set of [NFV use-cases](http://www.etsi.org/deliver/etsi_gs/NFV/001_099/001/01.01.01_60/gs_NFV001v010101p.pdf) (PDF link) representing common workloads that operators would like to deploy. From these use-cases, you can identify gaps in the underlying virtualization platform that need to be plugged to enable NFV. We have not waited for the OPNFV project to launch before rolling up our sleeves and getting to work. The [NFV working group in the OpenStack project](https://wiki.openstack.org/wiki/Teams/NFV) has already started creating feature requests and submitting patches to OpenStack and its dependencies in advance of the [Juno release in October](http://redhatstackblog.redhat.com/2014/07/10/juno-preview-for-openstack-compute-nova/).

Given existing efforts in ETSI and OpenStack, what gap does OPNFV fill? The creation of an NFV platform is a broader effort than just OpenStack -- the high throughput and low latency requirements of certain network functions will need engineering work throughout the network stack, from enabling hardware acceleration features such as SR-IOV and NUMA in the kernel or in the hypervisor, to enabling the guest kernel to hand off packet processing to user-space, and everything in between.

OPNFV will look at the problem holistically, and for each project included in the reference platform, argue for the importance of the NFV use-case, and submit bug requests and patches to address technology gaps. The result will be a platform that everyone can build on and contribute to, and that enables standard interfaces for the definition, deployment, and management of virtual network functions on an NFV platform.

Starting this week at the OPNFV technical steering committee kick-off, we look forward to ensuring that OpenStack and OpenDaylight form the heart of a great NFV platform that this industry effort can support and adopt.
For more information about OPNFV, see the [FAQ](https://www.opnfv.org/news-faq/faq) and [white paper](https://www.opnfv.org/sites/opnfv/files/pages/files/opnfv_whitepaper_092914.pdf).

### Resources


* [Telecom Industry and Vendors Unite to Build Common Open Platform to Accelerate Network Functions Virtualization](http://www.linuxfoundation.org/news-media/announcements/2014/09/telecom-industry-and-vendors-unite-build-common-open-platform)
* [OPNFV.org](https://www.opnfv.org/)
* [Network Functions Virtualisation](http://www.etsi.org/technologies-clusters/technologies/nfv)
* [Network Functions Virtualisation (NFV) Use Cases (PDF)](http://www.etsi.org/deliver/etsi_gs/NFV/001_099/001/01.01.01_60/gs_NFV001v010101p.pdf)
* [NFV Wiki](https://wiki.openstack.org/wiki/Teams/NFV)
* [Juno Preview for OpenStack Compute (Nova)](http://redhatstackblog.redhat.com/2014/07/10/juno-preview-for-openstack-compute-nova/)
