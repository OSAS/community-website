---
title: Python Has Big Impact at Red Hat
date: 2016-12-06 15:30 UTC
author: kdas
tags: Python, development, Fedora
published: true
comments: true
---
![Python logo](blog/python.jpg) This past September, I gave a talk in PyCon India 2016 titled “[Python in Red Hat World](http://redhat.slides.com/kdas/python-in-red-hat-world#/)”. The talk described the use cases of Python programming language inside of Red Hat.

I started the talk with an introduction to Red Hat--what we do and our main products are. Because the room had many students, this was new information for many of them. But almost all knew Red Hat for our flagship operating system, Red Hat Enterprise Linux (RHEL). When installing RHEL or Fedora (the upstream Linux distribution of RHEL), we use the project known as Anaconda to do so. [Anaconda](https://github.com/rhinstaller/anaconda) is written in Python. If you are trying to learn how to use Python Mock module and write better unittest cases, you should go through the source code of the Anaconda project.

READMORE

After the installation of a new operating system, our next step is changing the state of the operating system through configuration. The tools under *system-config-* help us here. Most of these tools are, again, written in Python. Among them, a few are GUI tools, so we can use them to learn about simple GUI application development.

Firewall is one major component used for configuration in nearly every Linux system. [Firewalld](http://www.firewalld.org/) is a new tool that provides support for network/firewall zones, and also enables dynamic management of the firewall. Fedora Project has a [wiki page](https://fedoraproject.org/wiki/Firewalld?rd=FirewallD) with many examples for users. This tool is also written in Python.

Installation of new software is another big step while configuring a new computer. One can use the yum or dnf tool to install any packaged application from preferred repositories. Both of the tools are written using Python.

In the modern software world we all use various forms of cloud services. OpenStack is a well-known project in this sector. [RDO](https://www.rdoproject.org/) technology provides the open source foundation for your organization to build a
private or public Infrastructure-as-a-Service (IaaS) cloud. RDO also enables you to leverage OpenStack, the fastest-growing open cloud infrastructure project, technology, and community while maintaining the security, stability, and cloud-readiness of platforms like CentOS and RHEL.

When we work in a datacenter or big cloud environment, we generally do not manually configure thousands of servers, we use some sort configuration management system to get it done. [Ansible](https://www.ansible.com/) is one such tool that can help anyone with different use cases, like provisioning, configuration management, app deployment, and continuous delivery.

The aforementioned Fedora Project is a free and open source software community project that produces a complete Linux-based operating system ready for cloud instances, server platforms, or workstation environments. This distribution incorporates leading-edge technologies built by free software developers and serves as the basis for RHEL and CentOS. With a few exceptions, most of the Fedora Infrastructure applications are written in Python.

The Fedora community chose to use the language not just because someone said to. It was more because Python is easy to learn, and provides a much lower barrier into contribution with code patches. All of the Fedora Project infrastructure is also managed using Ansible. We have a [public Ansible repository](https://infrastructure.fedoraproject.org/cgit/ansible.git) that contains all playbooks/roles from the production servers. Any new contributor to the Fedora Infrastructure team generally starts with reading these. We also have weekly IRC meeting on every Thursday at 18:00 UTC in the #fedora-meeting channel on Freenode.

The list of projects goes on. To name a few:

* [Beaker](https://beaker-project.org)
* [Release-monitoring](https://release-monitoring.org)
* [Pulp Project](http://pulpproject.org/)
* [389 Directory Server](http://directory.fedoraproject.org/)
* [OpenDayLight](https://www.opendaylight.org/)
* [OPNFV](https://www.opnfv.org/)

The [Software page on this very site](http://community.redhat.com/software/) contains details of many other projects to which Red Hat contributes.

[Pagure](https://pagure.io) is a new project from Fedora Infrastructure, a lightweight, git-centered forge that you can install in your server if you want. Many upstream projects already hosting their code in this project. It is written in Flask web framework. It had a special presence in my talk, as two student GSoC contributors to Pagure were also present in the conference. Now it is a starting point for many newcomers in Fedora Infrastructure application development.

I also introduced [OpenShift](https://www.openshift.com/), Red Hat's Platform-as-a-Service (PaaS) that enables developers to quickly develop, host, and scale applications in a cloud environment. With OpenShift you have a choice of offerings, including online, on-premise, and open source project options. One can deploy their Python applications in OpenShift using the latest container technologies.

For any company or project, people are much more valuable than code. In Red Hat no one can count how many people actually use Python (because way too many people use it). The number of internal projects using Python, or scripts which people use to generate different kinds of reports, is something we cannot count. But if we still want to talk about some numbers, we have two current Python Software Foundation directors in the company. We also have five core developers of CPython, the Python programming language.

At the end of my talk I stressed upon two points that help us to form our core values:

* Contributing to Open Source projects does not constitute a conflict of interest
* Choosing what is best for the project is good

There are not many companies out there who empowers their employees with such values. People choose to work for Red Hat for many different reasons, but the above mentioned statements are of course among the best reasons for any open source contributor.
