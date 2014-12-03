---
title: Foreman 1.7 Rolls Out
author: dcleal
date: 2014-12-03 18:24:06 UTC
tags: Foreman, systems management, Puppet, configuration, sys admin, networking
comments: true
published: true
---

![](blog/foreman.png) December brings a new major release of Foreman, the systems management
tool incorporating provisioning and config management support, with a
range of new features and fixes.

Smart class matchers are used to supply data dynamically to Puppet
depending on attributes of a host or facts, and these now have better
control over default values and the ability to merge hashes and arrays
across matchers.  

<iframe width="560" height="315" src="//www.youtube.com/embed/Z75Z670WqZs" frameborder="0" allowfullscreen></iframe>

READMORE

Advanced networking support is being introduced with support for
specifying bonds, VLANs, and aliased interfaces on a host; importing the
data from facts; and using that information in provisioning templates and
in Puppet.  

<iframe width="560" height="315" src="//www.youtube.com/embed/xmYmMQONq_0" frameborder="0" allowfullscreen></iframe>

Our plugin community continues to grow, with exciting new features being
introduced outside of the Foreman release cycle:

* Salt configuration management integration: The popular SaltStack tools
are integrated via a pair of new plugins, providing an alternative to
Puppet. Learn more by watching the [Foreman deep dive video](https://www.youtube.com/watch?v=b3DMmFymGz0) or by visiting the [project website](https://github.com/theforeman/foreman_salt/wiki).

* DigitalOcean compute resources: The foreman_digitalocean plugin lets you create and manage droplets on the DigitalOcean cloud from Foreman.

* Docker container support: The foreman_docker plugin allows provisioning and management of containers and images, including support to view logs and processes in running containers.

Learn more about Foreman 1.7:

* [Official Foreman 1.7 announcement](https://groups.google.com/forum/#!topic/foreman-announce/xQfYwuExJUc)
* [Foreman 1.7 release notes](http://theforeman.org/manuals/1.7/index.html#Releasenotesfor1.7)
* [Quickstart installation](http://theforeman.org/manuals/1.7/quickstart_guide.html)
* Visit [theforeman.org](http://theforeman.org)
* Join the [Foreman Google+ Community](https://plus.google.com/u/0/communities/106976851375995577697)
* Participate in our [IRC channels and mailing lists](http://theforeman.org/support.html#Mailinglists)