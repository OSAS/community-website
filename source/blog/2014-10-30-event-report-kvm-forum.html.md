---
title: 'Event Report: Tracing Summit & KVM Forum'
author: kchamarthy
date: 2014-10-30 14:28:08 UTC
tags: oVirt, KVM, KVM Summit, LinuxCon, Linux Foundation, libvirt, virtualization,
  cloud, CloudOpen, Linux
comments: true
published: true
---

![](blog/logo_kvmforum_crop.png)
[LinuxCon](http://events.linuxfoundation.org/events/linuxcon-europe)/[CloudOpen](http://events.linuxfoundation.org/events/cloudopen-europe) (Europe), [KVM Forum](http://events.linuxfoundation.org/events/kvm-forum), [Linux Plumbers Conference](http://www.linuxplumbersconf.org/2014/), and a few other Linux Foundation events were co-located in October in Düsseldorf, Germany. The Linux Foundation events were held at an excellent venue, Congress Center Düsseldorf, on the bank of Rhine river. 

In case you're not familiar with the KVM Forum, it's a developer event that mainly focuses on KVM, QEMU, and libvirt projects and their integration work. I spent most of my time at KVM Forum, with an occasional shuffle to LinuxCon/CloudOpen events to give a talk or to attend a discussion.

## Tracing Summit

On the first day of LinuxCon and related events, I attended [Stefan Hajnoczi](http://blog.vmsplice.net/)'s talk,  [User Case Study: Tracing in the QEMU Emulator](http://sched.co/1typxjj), which was part of the [Tracing Summit](http://tracingsummit.org/wiki/TracingSummit2014). Stefan is QEMU's tracing sybsystem maintainer (along with Block and Network subsystems). His talk was about how QEMU project uses tracing and how it integrates different types of tracers. He began by outlining QEMU's architecture: QEMU is a user space process on the host and the guest runs as part of QEMU. The KVM Kernel module switches between host and guest modes. QEMU performs I/O on behalf of the user (e.g., if the virtual machine wants to send a network packet, QEMU will do that for you). Each guest vCPU is a thread on the host when using KVM.

READMORE

Then he described how to observe/profile the KVM/QEMU stack using various tools, depending on what specific aspect you want to probe. To examine _inside_ a guest, use tools like perf-kvm(1); to observe QEMU, use static probes, or dynamic probes using perf, strace, etc. To instrument KVM, use LTTng, ftrace, perf, netstat, top, etc.

Next he discussed the QEMU's 'tracetool', a Python script that generates tracing code for multiple tracer backends (DTrace, LTTng-UST, QEMU's in-built "simple" tracer, etc). The talk ended with a discussion of tracing TCG (Tiny Code Generator, which compiles machine code from the guest architecture to the host arch) and some Q&A.

Slides (PDF) from his talk are [posted online](http://vmsplice.net/~stefan/stefanha-tracing-summit-2014.pdf). 

## KVM Forum, LinuxCon, and CloudOpen

![](blog/logo_kvmforum.png){:align="right"} KVM Forum started on Tuesday, and I caught Paolo Bonzini's KVM Keynote ([Video](http://www.youtube.com/watch?v=7aA7FQAbHsE)). Traditionally, KVM Forum kicks off with this keynote by the current KVM maintainer, discussing the state of KVM in the past year or so, highlights, architecture support and improvements, optimizations, benchmark details, and so on. (Keynote slides are [available online](http://events.linuxfoundation.org/sites/events/files/slides/kvmforum14-kvm.pdf) (PDF).)

After the keynote, I attended Andrew Honig's [Security Hardening of KVM](http://sched.co/1zF98ZT) talk. Andrew took a deep dive into security aspects of KVM at the kernel level. Google Compute Engine uses KVM, but Andrew mentioned that they don't use QEMU as user space with KVM, rather as "something else" (without exactly naming what that something is). He also discussed different types of KVM vulnerabilities (including specific CVEs), how to reduce the attack surface, and approaches to move attack surfaces to user space VMM. He concluded by talking about a couple of new I/O controls (ioctls) that they're experimenting with at Google.
If you're into KVM and kernel internals and security, Andrew's talk might interest you, so check out his [slides (PDF)](http://events.linuxfoundation.org/sites/events/files/slides/KVM%20Hardening.pdf) online.

On Wednesday, I went to the LinuxCon keynote by Joanna Rutkowska, founder of [Invisible Things Lab](http://invisiblethingslab.com/itl/Welcome.html). Joanna talked about [Qubes OS](https://qubes-os.org/), a Fedora-based open source operating system designed to provide strong security for desktop/GUI computing ("Security by Compartmentalization"), by using Xen-based virtualization. See the [LinuxCon EU video archives on YouTube](http://www.youtube.com/user/TheLinuxFoundation/videos) to watch [Joanna's talk](http://youtu.be/CqONg8w5nkw?list=UUfX55Sx5hEFjoC3cNs6mCUQ) and the other keynotes. 

Later in the day, I gave my talk, [An Update (and Demo) on Techniques to Manage libvirt/QEMU-based Virtual Machine Snapshots and Disk Image Chains](http://sched.co/1rhLUul). My [slides (PDF)](http://events.linuxfoundation.org/sites/events/files/slides/Update-on-QEMU-and-libvirt-snapshots-disk-image-chains-CloudOpen-Eu-2014.pdf) and [examples](https://kashyapc.fedorapeople.org/virt/lcco-2014/examples/) are online now.

Thursday I attended Daniel Berrange's talk, [OpenStack Performance Optimization with NUMA, Huge Pages and CPU Pinning](http://youtu.be/rqMc9DqtMfs). Daniel began with an overview of [Nova](https://wiki.openstack.org/wiki/Nova), and its concepts and architecture (simplified one), with a focus on these interactions between Nova <-> libvirt <-> KVM. Then he talked about virtual machine scheduling and its goals in the context of Network Functions Virtualization (NFV) and maximising hardware utilization. 

Next he discussed four specific topics and their configuration details in the context of Nova and libvirt: NUMA config, Large pages, CPU pinning, I/O devices (assigining PCI devices on a local NUMA node). His [slides (PDF)](http://people.redhat.com/berrange/kvm-forum-2014/kvm-forum-2014-openstack-perf.pdf) are available online.

If you are interested in virtualization, here are a few other KVM Forum talk videos available online now:

* [Automatic NUMA Balancing](http://youtu.be/mjVw_oe1hEA) by Rik van Riel
* [Towards Multi-Threaded Device Emulation in QEMU](http://youtu.be/KVD9FVlbqmY) by Stefan Hajnoczi
* [Memory Externalization with userfaultfd](http://youtu.be/pC8cWWRVSPw) by Andrea Arcangeli & Dr. David Alan Gilbert
* [More Block Device Configuration](http://youtu.be/VYGSD0aK2mk) by Kevin Wolf and Max Reitz

See the KVM Forum channel on YouTube for additional videos.

## Also Read
* [User Stories, Dialogs Are Central Theme of oVirt Workshop](/blog/2014/10/ovirt-workshop-2014/)
