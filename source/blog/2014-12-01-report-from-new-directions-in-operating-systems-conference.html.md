---
title: Report from New Directions in Operating Systems Conference
author: misc
date: 2014-12-01 15:20:24 UTC
tags: 'Project Atomic, operating system, conference, rumprun, DragonFlyBSD, BSD, CoreOS,
  Puppet, CentOS, '
published: true
comments: true
---

![](blog/london.jpg) On the 25th November 2014, I was invited to speak about [Project Atomic](http://projectatomic.io) at [New Directions in Operating Systems](http://operatingsystems.io/). Thanks to a friend, I was able to come the day before, and had the joy of taking the metro to the venue. Of course, it had problems, and of course, I lost my way while going there, so I arrived at the venue just in time for the start of the first talk. 
 
After a quick but well-deserved coffee and breakfast, I sat down for the first talk, which was about the concept of [rump kernel](http://wiki.netbsd.org/rumpkernel/) and its applications. The whole idea of rump kernel is to take an OS kernel (for example, NetBSD) and compile it as a regular userspace program to be run on another OS. The speaker, [Antti Kantee](https://twitter.com/anttikantee), explained why, spoke of the history of the project, how it progressed, and how they  managed to interface with Linux drivers. I would recommend people who never heard of rump kernel take a look at [the website](http://rumpkernel.org/), and if you are familiar with it, check out [the book about it]( http://book.rumpkernel.org/). Kantee said they are currently looking for a publisher for the second edition, so if you know one, do not hesitate to contact them using the website. 

READMORE
 
The second talk of the day was about [Genode, a secure micro kernel](http://genode.org/). After discussing a few common trade-off in CS (such as ease of use vs security), the speaker, Norman Feske, dove into the technical details, such as resources management and message passing, and how the security promise was achieved. Then he demonstrated booting windows within a regular user process, followed by a demo of OS-level virtualization by running bash on Genode pretending to be a FreeBSD kernel. The main principle of the security architecture is to isolate everything fully, and working with privileges-based systems between the components. After the demo, Feske finished with a summary of future directions, such as having a UI to manage capability and making sure the project can [eat its own dog food](http://en.wikipedia.org/wiki/Eating_your_own_dog_food) more often among others. 
 
The third talk, by Robert Watson, a Cambridge researcher working on FreeBSD, was about security of operating systems. Watson started by saying that have been following the same principle for 40 years, highlighting that we are still afraid of software liabilities, so things are not going well. Then he spoke about operating system security in FreeBSD  [jails](https://www.freebsd.org/doc/handbook/jails.html), [MAC framework](https://www.freebsd.org/doc/handbook/mac.html), and [Capsicum](http://www.cl.cam.ac.uk/research/security/capsicum/freebsd.html), and he talked about the [Orange book, the Trusted Computer System Evaluation Criteria](https://en.wikipedia.org/wiki/Trusted_Computer_System_Evaluation_Criteria). 
 
Watson then explained the MAC framework of FreeBSD, outlining the advantages and how policy composition worked and the architecture in great details. He continued on the Capsicum joint project with Google, and how they integrated it in FreeBSD and ported some base utilities to the framework. The last part was about the [CHERI project](http://www.cl.cam.ac.uk/research/security/ctsrd/cheri/), a specific hardware architecture made for capability handling. This talk inspired a fair share of questions, and the audience was pretty knowledgeable and interested in the topic. 
 
After the break, we went back into a rather high-level talk by [Gareth Rushgrove](https://twitter.com/garethr) from Puppet Labs. He started by giving a historical perspective on configuration management, followed by a more general talk on high-level directions, such as microservices and containers. The topic shifted then to the immutable instance pattern that emerged with cloud and VM, where you just erase the instance to upgrade or change anything, instead of upgrading. Other points he discussed were infrastructure as an API and using http for integration, permitting control of the infra from software; and the rise of specialized systems such as Project Atomic and CoreOS. He also explained why Docker is so popular right now and why it is unavoidable. The talk finished with integration of [Puppet and Etcd](https://forge.puppetlabs.com/garethr/hiera_etcd), the  
[distributed key-value store](https://github.com/coreos/etcd) used by [CoreOS](https://coreos.com/) and [Kubernetes](https://github.com/googlecloudplatform/kubernetes),  
among others. 
 
Then it was time for me to take the stage. My talk, which was about Project Atomic, explained the technology, and I provided a potential use case, with the [Gluster.org](http://www.gluster.org/) web infrastructure. I spoke about OSTree, the need for SELinux, the basics of the system, and the philosophy behind it. Finally I discussed the problems that still need to be resolved and for which we do not yet have best practices. The talk seemed to be well received, even if I didn't got any questions after. 
 
My presentation was followed by two lighting talks before the lunch break. The first one was about an OpenSolaris/IllumOS variant named [Trillix](trillix.org ), which was given by its creator, Peter Tribble. He started with an overview of the current derivatives, and explained why he decided to create a new one (which included his desire to learn more, because others didn't work as he wanted, and as a platform to experiment).  
 
The second lighting talk was a demonstration of [rumprun](https://github.com/rumpkernel/rumprun-posix/), a script to compile a rump kernel for a POSIX system, Xen, or a bare metal system. The demonstration was a success and showed the maturity of the project. 
 
Lunch was followed by a set of three talks on the topic of user networking. The first presenter, Franco Fichtner, from the [DragonFlyBSD](http://www.dragonflybsd.org/) project, explained that lots of people are working on the project, but few are talking about it, so he wanted to fill that gap with his presentation. He explained the motivation of the project's approach, citing speed and how complexity should be pushed to userspace rather than kernel due to ease of debugging and stability concerns. Starting on the principle that modern networking is all about removing bottlenecks, he approached the topic of zero-copy mechanism, and how syscall reduces throughput. The presentation continued on the various frameworks in userspace networking, such as [Netmap](https://code.google.com/p/netmap/), [PF_RING](http://www.ntop.org/products/pf_ring/),  
or [DPDK](http://dpdk.org/), and concluded by discussing the different architectures and the future, such as adaptive network stacks. 
 
Next Alexis Richardson, creator of [Weave](https://github.com/zettio/weave), a framework for Docker networking, presented the project and attempted to dispel various myths around Docker and computing. The talk was followed by a lot questions, mostly focused on Weave, from an interested audience. 
 
The third talk was a presentation of [NUSE](https://github.com/libos-nuse/net-next-nuse) by its creator, Hajime Tazaki. NUSE is like FUSE but for networking, and Tazaki went in great detail about the architecture and why he decided to take his approach. The project does not requires any change to userspace, thanks to the use of LD_PRELOAD, and achieves an equivalent performance to kernel space networking. He also explained how to install and use the project. 
 
After the next break, the day was a bit less focused, starting with a presentation of [MirageOS 2.0](http://www.openmirage.org/), a library used to create specialized unikernel (i.e., non-generic kernel running an application directly on a hypervisor).  
MirageOS currently targets Xen and is written in OCaml. [Anil Madhavapeddy](https://twitter.com/avsm) introduced the project and version 2.0, and talked about new features, such as support for ARM or Irmin, a distributed branchable storage.  
 
Next [Karanbir Singh](https://twitter.com/kbsingh) talked about [CentOS](http://centos.org), the various tests used in the distribution, and the need for automated QA. He also announced the creation of a CI system targeting CentOS, for projects wanting to have it as a reference platform. At the time I am writing this, he is probably in discussions on [centos-devel](http://lists.centos.org/mailman/listinfo/centos-devel), a reminder that CentOS is a project by users and for users, and it takes into account community feedback. 
 
The talk following Singh's presentation, "How to program computers (kos)", was a bit more obscure, and I was in the hallway track so I didn't get notes. Videos from the event should be published online soon.
 
The next technical talk was about a University of Cambridge research project on [DIOS, an operating system](http://www.cl.cam.ac.uk/~ms705/research/dios/) designed to be distributed on the network. With the idea in mind that everything in computing can be solved with another layer of indirection, Malte Schwarzkopf showed how this approach create problems regarding complexity that leads to later problem when trying to debug the code. He then focused on the architecture of DIOS, how they integrate with a thin layer in the Linux kernel, and why they decided to use a simplified list of syscalls. He finished with a demo and the list of work in progress, such as the integration with [Rust](http://www.rust-lang.org/) to provide a libc for the operating system. 
 
Then Bernard Blackham talked about security and the need for isolation between components. He explained why we need a provable software for critical systems used in cars, helicopters, and hospitals. Blackham focused on the L4 kernel, and how formal proof is a cost-effective approach when used on smaller micro-kernels. Thanks to the isolation between components, the system is much easier to certify, allowing development of more complex systems using them as a basis. 
 
In the final talk, [Gerry Carr](https://twitter.com/gerrycarr) talked about how *not* to market a project. Carr explained that he was the first marketing hire at Canonical, and he gave feedback on what went well (and what didn't) with the Ubuntu brand, to help people learn from Canonical errors. This non-technical session was quite refreshing and well presented. 
 
The day ended with a discussion session around a few drinks before attendees headed home. 

Overall the event was interesting, covered a wide range of topics, and highlighted new directions. No doubt some of the approaches explored are going to be important for the future. 
 
A big thanks to the New Directions in Operating Systems organization team for putting on a well-executed event, and kudos to Justin Cormack for having the idea for the event and for getting such high-quality talks.
