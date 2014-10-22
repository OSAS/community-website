---
title: Gluster and oVirt Test Days Coming Up
author: jbrooks
date: 2014-01-16 01:04 UTC
tags: oVirt, Gluster
comments: true
published: true
---

If you’re a fan of scale-out storage, datacenter virtualization, or (like me) a mixture of the two, you’ll want to mark your calendar for this pair of upcoming test days for the [Gluster](http://www.gluster.org) and [oVirt](http://www.ovirt.org) projects.

This weekend, from Friday the 17th at midnight UTC to Monday the 20th at midnight UTC, the Gluster project is having a test weekend (aka Glusterfest) for its 3.5 release. There’s a breakdown of all the features slated for 3.5 on the release’s [planning page](http://www.gluster.org/community/documentation/index.php/Planning35).

For this Glusterfest iteration, the project hopes to smooth the process of multi-node testing with the availability of [James Shubin’s](https://twitter.com/purpleidea) [Puppet-Gluster module](https://forge.gluster.org/puppet-gluster/). James recently wrote the how-to post, [Automatically deploying GlusterFS with Puppet-Gluster + Vagrant](https://ttboj.wordpress.com/2014/01/08/automatically-deploying-glusterfs-with-puppet-gluster-vagrant/), which ought to come in handy this weekend.

After giving James' post a run-through myself, I’m interested in trying it out with this [Vagrant oVirt/RHEV Provider](https://github.com/pradels/vagrant-ovirt) I found on github.

Speaking of oVirt, the project has its own test day coming up on January 23rd, this one for the project’s [3.4 release](http://www.ovirt.org/OVirt_3.4_release_management).

The oVirt 3.4 feature I’m most excited about is the [Self Hosted Engine](http://www.ovirt.org/Features/Self_Hosted_Engine) option, in which one or more oVirt compute nodes can host the oVirt management engine. This feature promises to eliminate the engine as a single point of failure, as well as free up the separate machine that’s typically used to host the engine.

If you’re raring to jump on the 3.4 code right away, alpha packages are now available. Check out these [release notes](http://www.ovirt.org/OVirt_3.4.0_release_notes) for more information about how to get rolling.

For more information on this weekend’s Glusterfest, check out the Gluster [project wiki](http://www.gluster.org/community/documentation/index.php/GlusterFest). To find out more about next week’s oVirt 3.4 Test Day, check out the oVirt [project wiki](http://www.ovirt.org/OVirt_3.4_TestDay).
