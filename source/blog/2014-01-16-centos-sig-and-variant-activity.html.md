---
title: CentOS SIG and Variant Activity
author: jbrooks
date: 2014-01-16 18:35 UTC
tags: oVirt, CentOS, OpenStack, Variant, Cloud
comments: true
published: true
---

The CentOS Project is increasing its efforts to empower contributors to produce and collaborate on new CentOS Variants, in which groups of contributors combine the CentOS core with newer or otherwise custom components to suit that group’s needs.

[Xen4CentOS](http://wiki.centos.org/Manuals/ReleaseNotes/Xen4-01), which combines CentOS 6 with components from the Xen project and the ["longterm maintenance"](https://www.kernel.org/releases.html) release of the Linux kernel, is an example of an existing variant project. For more on variants, refer to [the CentOS Project site](http://centos.org/variants/) and [the CentOS and Variants](/centos-faq/#_centos_and_variants) section of our FAQ.

The contributor groups behind variants are called Special Interest Groups. For more on SIGs, refer to [the CentOS Project wiki](http://wiki.centos.org/SpecialInterestGroup).

The CentOS Project put out a call for the formation of new SIGs and variants last week, and has fielded a healthy response from the community. Several projects have expressed interest in forming a Cloud SIG, and there’s been interest in Web Hosting, Documentation, and other SIG themes, as well.

If you’re interested in proposing a SIG or variant, or would like to learn more, drop a line to [centos-devel@centos.org](mailto:centos-devel@centos.org), ask on irc in \#centos on the Freenode network, or tune in next week for a chat about establishing the Cloud SIG at the [CentOS Office Hours](https://plus.google.com/+CentOS/posts) session on 23rd Jan 2014 @ 16:00 UTC.

Below is a rundown of the new variant and SIG activity on the [centos-devel](http://lists.centos.org/pipermail/centos-devel) mailing list since last week:

### Cloud SIG and Variant Discussion

#### [Cloud-Infra SIG creation request](http://lists.centos.org/pipermail/centos-devel/2014-January/009343.html)

> We’re looking to create an easy to use distribution of RDO/OpenStack built on CentOS. Our understanding is that we need to first create a SIG and then we’re able to create 1 or more variants.
>
> What we’d like to do:
>
> -   Provide all the dependencies that are either not in base CentOS or are too old in the base CentOS in a single location (maybe a distinct yum repo)
>
> -   Be able to build and sign packages needed to run RDO/OpenStack within the CentOS infrastructure
>
> -   Be able to generate a LiveCD in the CentOS infrastructure that allows people to get up and running quickly.
>
> -   Provide Install media for people that do not want to use a LiveCD."
>
— Mike Burns on behalf of The RDO Team

#### [OpenNebula Variant and Cloud SIG proposals](http://lists.centos.org/pipermail/centos-devel/2014-January/009346.html)

> We have been involved with CentOS for the past year making a stable Cloud Management Platform [2]. I would like to hereby propose a new CentOS variant, namely the OpenNebula variant.
>
> This variant would add three roles to the CentOS installation:
>
> -   OpenNebula Frontend
>
> -   OpenNebula Node KVM
>
> -   OpenNebula Node Xen
>
— Jaime Melis from the OpenNebula project

#### [Cloud SIG interest from CloudStack](http://lists.centos.org/pipermail/centos-devel/2014-January/009350.html)

> Reading the call for SIG, there is definitely interest from CloudStack to participate and create a ClouStack centOS variant for both instances and head/hypervisor nodes. Our default image template is already a centos template and our best quick start guide is based on CentOS. We also have a community run yum repo for all our packages.
>
> I see interest to create a Cloud Image for CloudStack clouds as well as creating variants for our management server and our hypervisor setup.

— Sebastien from the Apache CloudStack project

#### [A formal request to create a Eucalyptus Special Interest Group](http://lists.centos.org/pipermail/centos-devel/2014-January/009375.html)

> …​I would like to formally request the formation of a Eucalyptus SIG…​
>
> We build Eucalyptus, a cloud infrastructure application, around CentOS and have for 3 years now. We have an installer that is derived from Anaconda. We’ve sponsored CentOS events, and we deliver CentOS images to our users. Our packages are currently in a standalone repository, but we would be happy to merge these into whatever CentOS repository emerges (EPEL? Some new version of EPEL? CentOS core itself? I’m unclear on where this sits currently.)

— Greg DeKoenigsberg from Eucalyptus

#### [oVirt and CentOS Cloud SIG](http://lists.centos.org/pipermail/centos-devel/2014-January/009451.html)

> Cloud SIG seems very relevant to oVirt. We’re looking forward to assist with oVirt support as well. We have some CentOS fans in the oVirt community, so this should work well for everyone.
>
> Currently we have our live oVirt [1] built using CentOS. So having you guys reviewing it would be beneficial.
>
> For the standard el platform, we need some help with dependencies. Here’s a short list which we would like to see go in over & above 6.5
>
> -   qemu-kvm compiled with RHEV flags
>
> -   Support of librbd, libgfapi in qemu-kvm & libvirt, including sanlock & kernel modules
>
> -   Network namespaces, VXLAN, GRE support in the IP stack (kernel through iproute, dnsmasq, etc)
>
> -   The cloud-init version being used in RHEL 6.5.
>
> -   Support of cgroups
>
> -   selinux policies
>
— Doron Fediuck from oVirt

#### [Unified Cloud SIG](http://lists.centos.org/pipermail/centos-devel/2014-January/009467.html)

> There seems to be some consensus in various different threads that what we need is a single consolidated Cloud SIG effort, and decide, over time, if it’s sensible to split into project-specific SIGs. Easier to start consolidated than try to figure out how to merge later.

— Rich Bowen from Red Hat

### Other Variants and SIGs under Discussion

#### [NethServer as CentOS Variant and SME SIG Proposal](http://lists.centos.org/pipermail/centos-devel/2014-January/009393.html)

> We’d like to share with you our experience and our ideas for the future developments. You could think of NethServer as CentOS with some extra packages, particularly a powerful and extensible web interface that simplifies common administration tasks. NethServer is for the sysadmin who appreciates the effectiveness of a user interface which saves time compared to direct configuration file modification and for users who want to approach CentOS without having Linux skills.

— Alessio Fattorini from NethServer

#### [Create the CentOS Hosting SIG](http://lists.centos.org/pipermail/centos-devel/2014-January/009400.html)

> One of the proposed Future SIGs ([http://wiki.centos.org/SpecialInterestGroup](http://wiki.centos.org/SpecialInterestGroup)) is the Hosting (or "Web Hosters") SIG. Since Web Hosters are one of the key and core users of CentOS, this seems like a SIG that should be started sooner, rather than later :)
>
> I’d like to propose that such a SIG be started.

— Jim Jagielski

#### [Documentation SIG](http://lists.centos.org/pipermail/centos-devel/2014-January/009408.html)

> Has there been any interest or progress in the suggested Documentation SIG?

— Philip Mather

#### [VoIP SIG](http://lists.centos.org/pipermail/centos-devel/2014-January/009340.html)

> I’d like to put my hand up to be part of the VoIP SIG.
>
> After mentioning this in IRC, I’ve also had two other people contact me privately (puzzled and JHogarth) with their interest too.
>
> Currently we (FreePBX) build 'FreePBX Distro', which is a up-to-date CentOS distro, with a couple of known-broken packages upgraded (drbd, pacemaker) or replaced (asterisk).

— Rob Thomas from FreePBX

#### [ClearCenter Marketplace for CentOS Variant](http://lists.centos.org/pipermail/centos-devel/2014-January/009430.html)

> ClearCenter and ClearFoundation are interested in starting a CentOS variant called 'ClearCenter Marketplace for CentOS'. This will allow management of various CentOS services, EPEL packages, and third party applications to be easily managed and configured under CentOS.
>
> We are also interested in being part of a SIG centered around 'Server Management.' Please let us know the next steps. We’d like to get started right away and we are willing to participate in the process of helping to set up shop. Let us know how we can serve.

— David Loper from ClearFoundation
