---
title: Rebooting OpenStack Ceilometer with Gnocci
author: rbowen
date: 2015-02-10 21:12:33 UTC
tags: RDO, OpenStack, Ceilometer, hangout, Gnocci
comments: true
published: true
---

![](blog/rdo-logo.png)Yesterday, Eoghan Glynn led a Hangout to discuss the work around rebooting the OpenStack Ceilometer project, using the new approaches of the Gnocci project.

As you may remember, we talked about some of these ideas back in July in a [podcast with Eoghan](http://community.redhat.com/blog/2014/07/upstream-podcast-episode-10-rich-bowen-with-eoghan-glynn-on-openstack-juno/), and a lot of progress has been made toward those goals since then.

In the hangout, Eoghan talks about the Gnocci work, and how it restructures Ceilometer's internal data store, and provides a more lightweight API for retrieving current and historical data about your OpenStack implementation. Gnocci attempts to correct what is seen as a design misstep in the early days of Ceilometer, in which a great deal of static, or almost-static, data, is included in each data sample, resulting in poor performance and more storage space usage than necessary.

You can watch the hangout [on YouTube](https://www.youtube.com/watch?v=KdphlN9Juk0) and bring your questions to [the rdo-list mailing list](http://www.redhat.com/mailman/listinfo/rdo-list) or to the #rdo channel on the Freenode IRC network.