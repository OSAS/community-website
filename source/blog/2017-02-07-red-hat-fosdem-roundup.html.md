---
title: Red Hat FOSDEM Roundup
author: bkp
date: 2017-02-07 21:05:54 UTC
tags: community, open source, events
comments: true
published: true
---

![FOSDEM logo](blog/fosdem2015.png) This year's FOSDEM has come and gone, with the event organizers having put on another excellent example of a free and open source software event that embraces a vast collection of communities from all over the world.

Two days of six main tracks and an additional 41 developer rooms made for a lot of amazing content, and those of you who weren't able to attend should visit the [FOSDEM site](https://fosdem.org) to view the video content of the sessions. This article highlights the sessions presented by members of our Open Source and Standards team, as well as the sessions put on by our global Red Hat colleagues. Each entry has a link to the presentation's page, where you can find links to the session's video files or watch it directly online.

READMORE

## OSAS

### Kubernetes 101: Orchestration Doesn't Have to be Difficult

**Presenter:** Josh Berkus<br>
**Track:** Linux Containers and Microservices (Devroom) <br>
[**Page**](https://fosdem.org/2017/schedule/event/kubernetes101/)

So you’ve containerized your application, and now you want to deploy it scalably across a cluster. Maybe you’ve looked at Kubernetes but you can’t figure out how to use it. In one short session, we’ll teach you enough to get started.

### Write a Better FM: Read the F* Manual? Maybe You Need to Write a Better F* Manual

**Presenter:** Rich Bowen<br>
**Track:** Documentation (Main)<br>
[**Page**](https://fosdem.org/2017/schedule/event/better_manual/)

Project documentation is so much more than just the formal manual. It's how you present yourself in all the forums where users may ask for help - IRC, mailing lists, StackOverflow, and in-person events. If you want people to use your project, and if you want people to join your project, you must be willing to listen to their needs, and be welcoming of their contributions.

### A Discussion of Fedora's Legal State: This is Why I Drink

**Presenter:** Tom Callaway<br>
**Track:** Legal and Policy issues (Devroom)<br>
[**Page**](https://fosdem.org/2017/schedule/event/fedoras_legal_state/)

Tom Callaway, the Fedora Legal chair, talked about the past, present, and future of licensing and legal issues in the Fedora community. Tom is not a lawyer, nor does he play one on TV, but he does consult with lawyers, and occasionally, go drinking with them. He is not a lawyer, so nothing in my presentation should be (or could be) construed as legal advice.

#### Overcoming Culture Clash

**Presenter:** Dave Neary<br>
**Track:** Community (Devroom)<br>
[**Page**](https://fosdem.org/2017/schedule/event/community_overcoming_culture_clash/)

We are all a product of our experiences. Different communities around the world have different core assumptions about behaviour, how decisions are made, the role of the individual in a group, and more. What makes up culture, and can we have better community experiences by understanding it?

#### Mentoring 101: How to be a Great Community Mentor

**Presenter:** Brian Proffitt<br>
**Track:** Community (Devroom)<br>
[**Page**](https://fosdem.org/2017/schedule/event/community_mentoring_101/)

This presentation will explain best practices for being a good community mentor, setting up scope-appropriate projects, and troubleshooting when things start going off the plan.

## Red Hat

### Main Track: Documentation

#### Bridging the Gap Between Legacy Docs and Modular Content

**Presenter:** Robert Kratky<br>
[**Page**](https://fosdem.org/2017/schedule/event/legacy_docs/)

How to turn legacy docs into user-story-based, modular content to better serve users while reducing maintenance load and overall amount of docs.

### Main Track: Miscellaneous

#### User Session Recording for the Enterprise: An Open-Source Effort by Red Hat

**Presenter:** Nikolai Kondrashov<br>
[**Page**](https://fosdem.org/2017/schedule/event/session_recording/)

In this presentation Nikolai Kondrashov will review available solutions for user session recording, open-source and otherwise, their benefits and shortcomings, and will present a new effort to create an integrated Open-Source solution.
While there are many capable solutions for session recording, which can centrally collect, search and playback sessions, there is no such open-source code. The best we have is jump servers with script(1), or sudo I/O logging, all manually set up. This presentation will show an approach that would meet the needs of the modern enterprise.

### Main Track: Security and Encryption

#### Securing Automated Decryption: New Cryptography and Techniques

**Presenter:** Nathaniel McCallum<br>
[**Page**](https://fosdem.org/2017/schedule/event/securing_automated_decryption/)

This talk covers an alternative to key escrows using new cryptographic techniques implemented by the Clevis (client) and Tang (server) projects.

### Devroom Track: Community

#### Getting Your Issues Fixed

**Presenter:** Tomer Brisker<br>
[**Page**](https://fosdem.org/2017/schedule/event/community_getting_your_issues_fixed/)

You think you hit a bug in open source project. Now what? In this talk we will go over everything from where to get support when you hit an issue, through submitting a useful bug report, to how to contribute a fix that will get accepted quickly. I will also talk a bit about my work as a maintainer.

### Devroom Track: Config Management

#### Next Generation Config Management: Autonomous Systems

**Presenter:** James Shubin<br>
[**Page**](https://fosdem.org/2017/schedule/event/mgmt/)

A presentation about a next gen config management tool, and the specific problems this project solves.
Three of the main design features of the tool include:

* Parallel execution
* Event driven mechanism
* Distributed architecture

#### Puppet Catalog Diffs in TheForeman

**Presenter:** Greg Sutcliffe<br>
[**Page**](https://fosdem.org/2017/schedule/event/puppet_catalog_diffs/)

Viewing the potential changes when changing the environment on a Puppet agent is challenging - much can be altered, and often the only way to know what will change is to actually run it. Using octocatalog-diff (from GitHub) and TheForeman (using a new plugin) we can now view these changes up front, in the UI, before switching the agent to the new env.

### Devroom Track: Distributions

#### RDO's Continuous Packaging Platform: How to Continuously Package OpenStack (or other things) for CentOS

**Presenter:** Matthieu Huin<br>
[**Page**](https://fosdem.org/2017/schedule/event/rdo_continuous_packaging_platform/)

This presentation shows the workflow currently followed by RDO to ensure the quality of OpenStack packaging, and the specificities of the tools implementing this workflow.

#### Modularity & Generational Core: The Future of Fedora?

**Presenters:** Petr Šabata, Adam Samalik<br>
[**Page**](https://fosdem.org/2017/schedule/event/modularity_and_generational_core/)

Following the progress of the Modularity initiative and Factory 2.0 developments in Fedora, it's about time we define what the next, modular operating system should look like, focusing on the developer’s point of view.

#### Using a Generic Distro to Redefine IoT

**Presenter:** Peter Robinson<br>
[**Page**](https://fosdem.org/2017/schedule/event/generic_distro_iot/)

Generic distributions such as Fedora, CentOS, RHEL and others have well defined update and security mechanisms as well as other processes that have been established and proven to work over a multiple decades. How can we make use of these positives of distributions along with modern tools and technologies to produce a secure, stable, scaleable OS for IoT products?

### Devroom Track: Free Java

#### Helping Linux and Java Play Well Together

**Presenter:** Christine H Flood<br>
[**Page**](https://fosdem.org/2017/schedule/event/java_linux/)

#### Shenandoah: Why Do We Need Yet Another Garbage Collector

**Presenters:** Christine H Flood, Roman Kennke<br>
[**Page**](https://fosdem.org/2017/schedule/event/shenandoah/)

Garbage Collection (GC) liberates the programmer from having to call malloc and free. More importantly GC saves the programmer from having to debug their mistakes when using malloc and free. Unfortunately the details of how GC works are often a black box. This talk will start with a tour of all of the GC algorithms currently available in OpenJDK. We'll discuss how they work, their strengths and weaknesses, and which class of applications they were developed for. We'll work our way through serial gc, parallel gc, concurrent mark and sweep, and g1. We'll make the case for why we need all of them and just one more GC algorithm, Shenandoah.

#### Diagnosing Issues in Java Apps using Thermostat and Byteman

**Presenter:** Severin Gehwolf<br>
[**Page**](https://fosdem.org/2017/schedule/event/thermostat/)

Thermostat is a monitoring and management tool for Java deployments, allowing users to measure and monitor a host of different performance aspects of their Java applications. Available metrics range from raw CPU and memory usage to operation of the Garbage Collector and JIT compiler through to thread activity and method call/heap profiles. Thermostat provides a GUI view of activity of local and distributed JVMs in a live-view or, alternatively, offline for after-the-fact analysis.

#### Ruby's Strings and What Java can Learn From Them

**Presenter:** Charles Nutter<br>
[**Page**](https://fosdem.org/2017/schedule/event/jruby/)

Ruby's Strings aggregate a collection of bytes and an encoding, allowing for IO to avoid transcoding, regular expressions to execute against raw bytes, and 7-bit strings to be compactly represented. Only the last item has been adopted by Java. To make matters worse, most Java APIs depend on Java's string representation, making them incompatible with alternative languages like Ruby. We'll explore the advantages of Ruby's string compared to Java's and discuss options for improving Java's string support in the future.

#### OpenJDK Governing Board Q&A

**Presenters:** Mark Reinhold, Mario Torre, Andrew Haley, Georges Saab, Doug Lea<br>
[**Page**](https://fosdem.org/2017/schedule/event/gb/)

An open Q&A session with members of the OpenJDK Governing Board

### Devroom Track: Geospatial

#### Open Source Map Rendering with Mapbox GL Native

**Presenter:** Thiago Santos<br>
[**Page**](https://fosdem.org/2017/schedule/event/geo_mapboxgl/)

This talk will explore how Mapbox GL Native, a hardware-accelerated map rendering engine, can bring beautiful maps made with open data to the open source community. We'll also cover the possibility of bringing Mapbox GL Native to other open source platforms, such as GTK. Lastly, we'll dive into our recently collaboration with the Qt Company to bring the power and flexibility of Qt to Mapbox GL Native.

### Devroom Track: Internet of Things

#### Does Your Coffee Machine Speak Bocce: Teach Your IoT Thing to Speak Modbus and It Will Not Stop Talking

**Presenter:** Yaacov Zamir<br>
[**Page**](https://fosdem.org/2017/schedule/event/iot_bocce/)

There are many IoT dashboards out on the web, most will require network connection to a server far far away, and use non standard protocols. We will show how to combine free software tools and protocols from the worlds of IT monitoring, industrial control, and IoT to create simple yet robust dashboards.

### Devroom Track: Legal and Policy issues

#### Principled Free Software License Enforcement

**Presenter:** Richard Fontana<br>
[**Page**](https://fosdem.org/2017/schedule/event/principled_enforcement/)

During the last few years there has been significant debate over approaches to GPL enforcement in technical and legal communities. This talk presents a new and unique vendor perspective on free software license enforcement that emphasizes the goal of fostering greater collaboration and participation in community development and highlights the importance of transparency regarding funding relationships and conflicts of interest arising out of enforcement activities.

### Devroom Track: Linux Containers and Microservices

#### Taking Containers from Development to Production

**Presenter:** Ratnadeep Debnath<br>
[**Page**](https://fosdem.org/2017/schedule/event/containerdevops/)

Containers are great in terms of application packaging and delivery, but there’s a lot of noise in the space. But when it comes to multi-container applications, most production setups use advanced container orchestration technologies like Kubernetes, Openshift, Mesos/Marathon, which are not that developer friendly.

#### Cloud Native Java Development: Patterns and Principles for Designing Kubernetes Applications

**Presenter:** Bilgin Ibryam<br>
[**Page**](https://fosdem.org/2017/schedule/event/cnjavadev/)

Kubernetes is awesome! But what does it takes for a Java developer to design, implement and run Cloud Native applications? In this session, we will look at Kubernetes from a user point of view and demonstrate how to consume it effectively. We will discover which concerns Kubernetes addresses and how it helps to develop highly scalable and resilient Java applications.

#### Kubernetes+GlusterFS (Lightning Version)

**Presenter:** Jose Rivera,  Mohamed Ashiq<br>
[**Page**](https://fosdem.org/2017/schedule/event/kubegluster/)

You can now deploy GlusterFS on Kubernetes, and have your Kubernetes applications access hyper-converged persistent storage. Ashiq and Jose will explain how.

### Devroom Track: LLVM Toolchain

#### LLVM at Red Hat: How and Where is LLVM Used in the Red Hat Ecosystem

**Presenter:** Dodji Seketeli<br>
[**Page**](https://fosdem.org/2017/schedule/event/llvm_at_red_hat/)

### Devroom Track: Open Document Editors

#### Extensions: Ugly Toupee or Hipster Hairdo?

**Presenter:** Stephan Bergmann<br>
[**Page**](https://fosdem.org/2017/schedule/event/hairdo/)

"But what about the extensions?" can be the death knell for whatever cool new feature somebody tries to implement in LibreOffice, as extensions naturally ask for interface stability. But what about them, anyway? Are they the saviour that brings diversity to our desktops, or are they just a ghostly phantom that stifles innovation? Lets take a look at the extension landscape out there.

#### LibreOffice on Wayland via GTK3

**Presenter:** Caolán McNamara<br>
[**Page**](https://fosdem.org/2017/schedule/event/libreoffice_on_wayland/)

#### What the Cell?!

**Presenter:** Eike Rathke<br>
[**Page**](https://fosdem.org/2017/schedule/event/cell/)

Some examples of weird behavior encountered while developing / bug fixing the LibreOffice Calc spreadsheet application.

### Devroom Track: Open Source Design

#### Interviews as User Research: How I Built a Public Transportation UI Using Interviews

**Presenter:** Andreas Nilsson<br>
[**Page**](https://fosdem.org/2017/schedule/track/open_source_design/)

An important aspect of humane interfaces is meeting the needs of a variety of people. They all have different skills, restrictions and whims. How do you figure out what exactly those are?

### Devroom Track: Python

#### Debugging Hung Python Processes with GDB

**Presenter:** Brian Bouterse<br>
[**Page**](https://fosdem.org/2017/schedule/event/python_gdb/)

When things go wrong in production, it can be necessary to troubleshoot problems where they occur, instead of in a development environment. In those situations having a working knowledge of GDB, GDB Python Extensions, and strace is very helpful. You will see some simple techniques to get insight into those situations. This talk outlines several techniques for connecting to an already running, "stuck", or deadlocked Python process using GDB for debugging.

#### Storing Metrics at Scale with Gnocchi: The Python Based Time Series Database

**Presenter:** Julien Danjou<br>
[**Page**](https://fosdem.org/2017/schedule/event/storing_metrics_gnocchi/)

Gnocchi is a time series database written in Python, that has been created in the context of the OpenStack cloud computing project. It offers highly-scalable data storage for measurements and provides access to its data via a REST API. In this lecture, we'll discuss the features the project is offering to its users, and how they can easily be leveraged in any application. In a second part, we'll see how the project has been built to scale, how Python was leveraged and made scalable.

#### How to Run a Stable Benchmark

**Presenter:** Victor Stinner<br>
[**Page**](https://fosdem.org/2017/schedule/event/python_stable_benchmark/)

Working on optimizations is a task more complex than expected on the first look. Any optimization must be measured to make sure that, in practice, it speeds up the application task. Problem: it is very hard to obtain stable benchmark results.

### Devroom Track: Real Time Communications

#### RTC Analytics with HOMER 6 + Big Data: Export, Analyze, and Alert RTC Using HOMER and your Favorite Big Data Solution

**Presenter:** Lorenzo Mangani<br>
[**Page**](https://fosdem.org/2017/schedule/event/homer/)

HOMER 6 allows users to Export, Analyze and Alert RTC and VoIP sessions in real time using popular Big-Data backends such as InfluxDB and Elasticsearch providing unprecedented flexibility and opening the way for new uses of the platform in larger ecosystems with business intelligence feeds.

### Devroom Track: Ruby

#### JRuby in 2017: Rails 5, Ruby 2.4, Performance

**Presenters:** Charles Nutter, Thomas Enebo<br>
[**Page**](https://fosdem.org/2017/schedule/track/ruby/)

JRuby has been compatible with various Ruby versions during its lifespan, ranging from the 1.6 series through today's 2.4. JRuby has supported Rails in some capacity since the 1.0 days. And at the same time, we've continued to improve performance. In this talk we'll explore JRuby's level of compatibility today and discuss the challenges of keeping up with an actively-developed language and ecosystem.

### Devroom Track: Security

#### TLS Test Framework

**Presenter:** Hubert Kario<br>
[**Page**](https://fosdem.org/2017/schedule/event/tls_test_framework/)

The Transport Layer Protocol is becoming more and more complex. With more than 4 versions deployed side-by-side, the complexity of servers is increasing even faster.

#### Usable Cryptography with José: C and Command-line JSON Object Signing and Encryption

**Presenter:** Nathaniel McCallum<br>
[**Page**](https://fosdem.org/2017/schedule/event/jose_cryptography/)

Increased uses of cryptography in web environments, particularly authentication, have driven a set of new RFCs: JSON Object Signing and Encryption. While these standard data formats have dominated web-based applications, they also have further applicability in a wide variety of non-web contexts. This talk will introduce you to José, a plug-able, open source C implementation of these RFCs which provides both an API for direct integration and a usable command-line interface.

#### Smart Card Forwarding

**Presenter:** Daiki Ueno<br>
[**Page**](https://fosdem.org/2017/schedule/event/smartcard_forwarding/)

On a cloud computing environment it is often required to use a user's smart card on a remote server. That is, insert a smart card locally (windows or linux client), ssh to a server, and then utilize the smart card to 'sudo' application or to a TLS application, or to 'kinit' to obtain a kerberos ticket. Other operating systems such as windows provide this functionality via USB-pass-through. The purpose of this talk, is to describe where we are, and what we provide for that problem.

### Devroom Track: Software Defined Storage

#### Hyper-converged, Persistent Storage for Containers with GlusterFS

**Presenters:** Jose Rivera, Mohamed Ashiq<br>
[**Page**](https://fosdem.org/2017/schedule/event/glustercontainer/)

While containers themselves are stateless many applications still have requirements on storage that should persist across containers and instances of containers. Many such storage solutions require an administrator to set up a storage solution on hardware outside their existing container platforms. GlusterFS changes all that.

#### Ceph Weather Report

**Presenter:** Orit Wasserman<br>
[**Page**](https://fosdem.org/2017/schedule/event/cephoverview/)

Ceph is a highly available distributed software defined storage, providing object, key/value and file-system interfaces. Ceph Rados Gateway (Radosgw) provides HTTP REST API that is S3 and openstack swift compatible. This talk will give a brief Radosgw architecture overview, present the newest features and our plans for the future.

#### Introduction to Ceph Cloud Object Storage

**Presenter:** Orit Wasserman<br>
[**Page**](https://fosdem.org/2017/schedule/event/cephintro/)

Ceph is a highly available distributed software defined storage, providing object, key/value and file-system interfaces. Ceph Rados Gateway (Radosgw) provides HTTP REST API that is S3 and openstack swift compatible. This talk will cover cloud object storage concepts and how Ceph implementation of cloud object storage (Radosgw). This talk will also present the newest features and our plans for the future.

### Devroom Track: Testing and Automation

#### Do You Want to Retry? (Handling and Testing Network Failures)

**Presenter:** Anton Marchukov<br>
[**Page**](https://fosdem.org/2017/schedule/event/want_to_retry/)

This talk will follow a real story of an attempt to implement network errors handling by retries functionality that is inside urllib3 and requests Python libraries. More importantly we will simulate poor network conditions on a local machine using Linux Network Emulator and then will reason on how effective the attempt was and what can be further improved.

### Devroom Track: Valgrind

#### Fortification vs Memcheck: Making GCc/glibc Fortification and Valgrind Memcheck Work Better Together

**Presenter:** Mark Wielaard<br>
[**Page**](https://fosdem.org/2017/schedule/event/valgrind_fortification/)

gcc/glibc support fortification of some functions by defining FORTIFY_SOURCE. This inserts some compile and runtime buffer overflow checks for selected glibc functions. These checks have no or very little runtime overhead and work on the object level (the compiler provides/proofs the size of the object buffer size). valgrind memcheck provides similar memory buffer overflow checks. These checks don't need any compiler help (you won't have to rebuild your code). But they have a much higher runtime overhead. They also work on a different level. valgrind memcheck doesn't know anything about the objects the user is manipulation but has knowledge of all memory blocks allocated. Let's explore how these different mechanisms work and how we can make them work better together.

#### Valgrind BoF and Hackaton: Open Discussion of Ideas for Valgrind - And Then We Hack!

**Presenter:** Mark Wielaard<br>
[**Page**](https://fosdem.org/2017/schedule/event/valgrind_hackaton/)

Come and hack on Valgrind together. Open discussion about small (or big) ideas to improve or change Valgrind.

### Devroom Track: Virtualization and IaaS

#### 20 Years of Linux Virtual Memory: From Simple Server Workloads to Cloud Virtualization

**Presenter:** Andrea Arcangeli<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_20yealin/)

Andrea will provide a high level perspective of the most notable milestones in the long term evolution of the Linux Virtual Memory and Virtualization subsystems. In addition, Andrea will explore recent advances in Memory Management related to the KVM Virtualization Hypervisor, such as NUMA balancing, THP, KSM and userfaultfd/postcopy live migration.

#### QEMU: internal APIs and conflicting world views (how abstractions inside QEMU (don't) work together)

**Presenter:** Eduardo Habkost<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_impyouvir/)

QEMU is an open source machine emulator and virtualizer written in C. Over time it has evolved multiple interfaces to interact with the outside world, and multiple internal APIs and abstractions to model and keep track of data. The talk will be a review of some of the challenges and trade-offs involved in making those abstractions work together.

#### Using NVDIMM Under KVM: Applications of Persistent Memory in Virtualization

**Presenter:** Stefan Hajnoczi<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_usinvdund/)

The introduction of non-volatile memory changes how applications, databases, and virtual machines will work in the future. NVDIMM is not simply a faster block device. Programs can avoid block I/O entirely and use byte-addressable NVDIMM to benefit from the performance characteristics of RAM. This requires new storage APIs that applications must use instead of traditional block I/O.

#### Managing Container Infrastructure

**Presenter:** Piotr Kliczewski<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_manconinfra/)

During this presentation we will see how to manage infrastructure which is used to run containers. We will see how to use reliable vms provisioned by ovirt and run openshift containers on them by using single management UI (manageiq) with ansible modules.

#### The Next Generation: Certainty in Shared Storage Environments

**Presenter:** Adam Litke<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_nexgencer/)

In oVirt datacenter virtualization environments, a manager directs hosts to initiate operations to shared storage. These operations create or remove volumes, copy data between volumes, create or merge snapshots, and various other actions related to virtual machine storage. For efficiency and balance these operations should be distributed across multiple hosts and run in parallel when possible. Maintaining reliability under real world conditions requires careful management and resilient algorithms.

#### Improving your Virtualization Development Workflow with Lago

**Presenter:** Rafael Martins<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_impyouvir/)

Lago is an ad-hoc virtual framework which helps you build virtualized environments on your server or laptop for various use cases. It creates and orchestrates virtual machines that can be used to run test suites and allow a developer to quickly test his code change on non-trivial flows such as live migration even before starting the CI process. In this session, we will walk through the usage of Lago in the oVirt project and how it can be extended to assist virtualization developers.

#### Pet-VMs and Containers United?

**Presenter:** Roman Mohr<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_petconuni/)

How do you integrate containers in your IaaS? In a VM-based IaaS environment, introducing containers can be a painful experience. Most likely you end up running containers inside VMs to reuse existing infrastructure, or you start dividing your data-center into a container- and a VM-world. Either way, you have two management solutions and non optimal resource management. But what if we put VMs inside containers?

#### VM: Hey VM, Can I Share a Host with You? (Affinity Rules in a Virtual Cluster)

**Presenter:** Martin Sivák<br>
[**Page**](https://fosdem.org/2017/schedule/event/iaas_vmheyvm/)

The workloads and scenarios for virtual machines grow more complex every year. So do the interactions, availability, and performance requirements. All that requires the administrators to carefully plan where to start the VMs that depend on each other and/or specific hosts. This talk will present the concepts that allow the administrator to express the rules for affinity between virtual machines and between virtual machines and hosts to form complex relationships.

### Track: Lightning Talks

#### Mailing list, Meet CI: Combining Patchwork and Jenkins for Fun and Profit

**Presenter:** Stephen Finucane<br>
[**Page**](https://fosdem.org/2017/schedule/event/patchwork_jenkins/)

What does it take to implement continuous integration-style automated testing into a mailing list-driven software project? Not a lot, actually. In this talk, we demonstrate how a simple but easily scaled testing system can be implemented for a such a project through the combination of Patchwork, the web-based patch tracking system, and open source CI tools such as Jenkins.

#### Yet Another repoman: How We Do CI at oVirt

**Presenter:** Anton Marchukov<br>
[**Page**](https://fosdem.org/2017/schedule/event/repoman/)

Repoman is a tool developed in-house and used as a core tool in oVirt CI and release processes. It aids the process of integrating RPM packages from multiple sources into the single repo. Made to be self-contained, so it is easy to use from CI. Come and see what our use cases at oVirt are and how we use repoman to solve them. Being developed with an abstraction in mind it might be helpful to you too.
