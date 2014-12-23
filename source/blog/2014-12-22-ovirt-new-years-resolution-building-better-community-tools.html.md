---
title: " oVirt New Year's Resolution: Building Better Community Tools"
author: bkp
date: 2014-12-22 21:23:05 UTC
tags: oVirt, documentation, community, Docker, Project Atomic, CentOS
comments: true
published: true
---

![](blog/oVirt-logo.png) When I was a journalist, one of the things that inevitably happened every year was the year-end crush of stories that highlighted the "best of" the closing year and the predictions for the year ahead.

So who am I to break with tradition?

My work with the oVirt community began exactly 385 days ago, and in that time, there have been two point releases for this virtual datacenter management platform: 3.4 and 3.5. Each release has gone off without a major hitch, although each release was delayed to blocker bugs that affected major new features for that particular release.

Downloads for the software tends to be climbing, with an average of 4,633 downloads of oVirt Engine from the main [resources.ovirt.org](http://resources.ovirt.org) download site per month.

The development community is active as well. Data as of yesterday [indicates](http://www.ovirt.org/stats/scm.html) the number of commits is up eight percent over the past 365 days, though the number of total developers is down three percent in the same period. On the user side, [metrics from our mailing lists](http://www.ovirt.org/stats/mls.html) shows mailing list posters up by 13% in the past 365 days.

That last stat is both good and not-so good, in that it shows there are more people interested in the oVirt project, but they still may be too reliant on the mailing list (and the #ovirt [IRC channel](http://irc.oftc.net), according to [the 10% growth there](http://www.ovirt.org/stats/irc.html)). This reliance is bittersweet: oVirt as a community has historically been very happy with the response rate and interaction between developers and users. But this growth may also mean that other forms of help, such as documentation and forums, are lacking. If documentation is clear and concise, one line of reasoning goes, then there's less of a need to ask a question on a mailing list.

This leads into what will be the first prediction for oVirt's new year: We are going to get our documentation act together. There will be input from anyone in the community who wants to contribute, but right now the basic plan is to shift away from [ovirt.org's](http:/www.ovirt.org) MediaWiki platform into something that's more static-based and version managed. There is more than one idea on how to go about this, but one way is to hold the actual content for the site in a distributed version control system (such as a git repository) in a format that will be easy to edit and consumable for the oVirt downstream commercial products, such as Red Hat Enterprise Virtualization and Wind River Open Virtualization. 

oVirt is fortunate to be able to tap into the resources of Shaun McCance, a documentation expert with Red Hat who is helping us figure out what  exactly will work for oVirt moving forward. For instance, one of the benefits of MediaWiki is that it is easily editable (that's the whole point of a wiki, after all). So how do we get the ease-of-access to content that MediaWiki provides into a system the relies on version-controlled files in a format such as ASCIIdoc or MarkDown (just to name two possibilities)? This is the kind of talk that Shaun will be helping us with, and I personally am excited to have someone of his caliber on board.

Such changes will probably bring changes to the oVirt web site, too. Many users have lamented the reliance on the "old-school" mailing lists, preferring instead the ease and searchability of forums. This could be a good opportunity, then, to add something like an "Ask" forum, such as [the one over at Project Atomic](http://ask.projectatomic.io/en/questions/). There will also be the addition of new oVirt community blog, possibly as a "Planet" format.

In general, the community for oVirt this past year has been all about figuring out where our strengths are and figuring out how to create an infrastructure to play to those strengths. Look for more workshops, more use-case studies, and more specific ways to deploy and manage oVirt, including ways to integrate oVirt with other open source tools, such as [RDO](https://openstack.redhat.com/Main_Page), [ManageIQ](http://manageiq.org/), [Gluster](http://www.gluster.org/), [Ceph](http://ceph.com/), and [Docker](https://www.docker.com/), to name a few.

oVirt is great software, and it will continue to have a great community. Moving into 2015, there will be new and better tools for that community to use.

We look forward to having you continue the journey.




