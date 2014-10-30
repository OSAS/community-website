---
author: pmcgarry
layout: post
comments: true
title: "Ceph Turns 10: A Look Back"
date: 2014-06-24 20:28 UTC
tags:
- Ceph
- Storage
- OpenStack
- Cloud
categories:
- Blog
---

![](blog/ceph-logo.png)
Although many people at this point have heard Sage’s history of [where Ceph came from](http://ceph.com/community/people-profile/sage-weil/), I am still often asked questions like "what was the original use case for Ceph?" 

So, in honor of the 10th birthday of Ceph, I thought it might be helpful (and hopefully interesting, given how much I love to hear Sage tell the story) to share Ceph’s origin story and the road to where we are today.  

The history of Ceph can be broken down into four distinct segments:

1. Research
2. Incubation (DreamHost)
3. Commercialization (Inktank)
4. Acquisition (Red Hat)

![](blog/authors_over_time.png)

It’s pretty amazing to see where Ceph started, all of the hard work by so many people through each of the first three stages, and the exciting possibilities in the most recent phase that is just beginning under [Red Hat’s stewardship](http://ceph.com/community/red-hat-to-acquire-inktank/).  

READMORE

Research
=======

Ceph started off as a part of a research grant from the Department of Energy in cooperation with [Los Alamos](http://www.lanl.gov/index.php), [Lawrence Livermore](https://www.llnl.gov/), and [National Labs](http://www.sandia.gov/). Although Sage is often given sole credit for the origins of Ceph, the project is the culmination of years of research by several professors and many graduate students in the University of California at Santa Cruz School of Engineering.

The original research goals, interestingly enough, were centered around the file system use case (the only part of Ceph that isn’t considered “production ready” as of the writing of this article) to build a horizontally scalable object-based file system for HPC workloads at datacenter scale. Sage became involved in the project in 2004, initially focused on building a scalable distributed metadata server. The first line of Ceph code hit the CVS repository in early 2004 while he was a summer intern at LLNL. Sage shares an amusing anecdote about his time at LLNL where he was required to work in a secure environment (complete with radiation badge), and from his cube he checked in open source code over ssh back to a CVS repository at the university. An amusing juxtaposition to be sure!

During this early work, several pieces of infrastructure would emerge, including EBOFS (a from-scratch file system targeting object workloads), CRUSH (the placement algorithm), RADOS (the underlying object store that powers Ceph), and the adaptation of Paxos that allowed consensus decision making in the monitors. The main idea to make the system scale was to push as much of the intelligence to the edges as possible. So, instead of having a large array of “dumb” disks, the desire was for a cluster of intelligent storage nodes. This created a different, but very compelling, architecture. And of course, throughout the whole design process the emphasis was always on building consistent, reliable storage with no single point of failure.  

The early stages of the project also resulted in a name---Ceph is short of Cephalopod, a class of mollusks that includes the octopus, squid, and cuttlefish---and a cute logo (that has since been changed):

![](blog/octopus_logo.png)

As Sage neared the end of his research, he started talking to many traditional storage vendors about Ceph and his work surrounding the project. After watching many of his peers get hired into industry and have their interesting and innovative work abandoned or absorbed into the large proprietary systems, he realized that the industry giants wanted “you” and not your project. Coupled with the fact that the open source alternatives either didn’t scale very well, had limited community and/or architecture, or were missing some of the key enterprise features (snapshots, cloning, quotas), Sage decided to take a different path.

The path of Ceph that Sage decided upon was a bold one; he wanted to change the world with open source and do to storage what Linux had done to the likes of Solaris, Ultrix, Irix, and others. To reach this goal, he decided on a license that would prove to be both flexible and empowering for the community. Ceph is licensed under the [LGPL v2](https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html) with an intentionally fragmented copyright. This means that, in addition to the things set forth by the LGPL, any individual contributions are the property of that contributor (no CLAs, hooray!). The project was officially open sourced in 2006 and placed on SourceForge.

Incubation
=======

With his research project “complete,” and now in possession of a shiny new PhD (signed by the Governator, no less), Sage moved back to Los Angeles to continue hacking on the project at [DreamHost](http://www.dreamhost.com/) (another company in which Sage was a co-founder). The beauty of this move is that he was able to hire a few developers to work on the project full time in a pure development environment (no deliverables, we should all be so lucky). This development effort did have quite a few very ambitious development goals, however:

* Native Linux kernel client (2007-)
* Per-directory snapshots (2008)
* Recursive accounting (2008)
* Object classes (2009)
* librados (2009)
* radosgw (2009)
* strong authentication (2009)
* RBD: rados block device (2010)

Somewhat early on in the incubation phase of Ceph, Sage and his team realized that a native Linux kernel client was going to be important. Up until this point, the client has been FUSE-based and wasn’t very fast. So, in order for people to take Ceph seriously, there needed to be a native, high performance Linux client that could talk to the system. At this point Sage started attending file system developer events and hanging out in IRC with some of the Linux filesystem developers. Incidentally, this is also the reason that Ceph’s IRC channels live on OFTC (rather than Freenode); it was simply a function of Sage being on the same system as kernel fs devs.  

Despite early words of encouragement from several ex-Lustre developers, the first couple of attempts at submitting it to the Linux kernel were rejected. Early review from Linus questioned whether there would be any interest in the system and rejected it as immature. Thankfully several community members spoke up in support of the effort and eventually in 2010, after spamming this list four or five times with a giant 20,000 line patch set, Andrew Morton finally signed off and Linus merged it into the mainline 2.6.34 kernel. The RBD client was merged not long after in 2011.

[Acceptance into the kernel](http://arstechnica.com/information-technology/2010/05/linux-kernel-2634-adds-scalable-ceph-filesystem/) was somewhat of a seminal point in Ceph’s history and started to show that it was now a part of a larger ecosystem. This is when Sage realized that Ceph didn’t need to solve all the problems as a monolithic stack, and should rely on other projects to do the things they were good at. The chief example here was [EBOFS was dropped](https://www.mail-archive.com/ceph-devel@lists.sourceforge.net/msg00241.html) in favor of utilizing the existing work from other filesystem developers. Although the first choice was btrfs (copy-on-write, checksumming, other goodness), ultimately it proved too immature for production use cases and was later supplanted by XFS and ext4 as the primary choices for production deployment.

As participation grew, Sage started thinking more about the community and established the IRC and dev mailing list; however, the reality was that Ceph was still too unstable for any real deployments and development was still primarily focused on building the right architecture and creating the right technical solutions.

The move that really started Ceph down the road to commercialization was that DreamHost decided they were going to build an S3-compatible object storage service using Ceph. Now Sage and team were obliged to start really focusing on stability, paying back the technical debt that had accumulated over time, and start thinking about things such as testing automation and code review.  The upside of this, however, was that they were able to expand the engineering team.  

![](blog/dreamobjects.png)

With the growing need for automated testing, the team started evaluating different potential tools that might fit the bill; however, because Ceph is a highly distributed system with active kernel development, the usual suspects that suffice for typical LAMP applications didn’t seem to fit the bill. Thus, [Teuthology](https://github.com/ceph/teuthology) was born.

As the project evolved, other companies started to have an interest, but quickly it became apparent that trying to engage a hosting company for support on an emerging storage platform was very difficult (and confusing). Ceph needed a commercial entity to fund the engineering effort, build and test the product, and support users. The move to spin Ceph out of DreamHost and into the new venture “Inktank” was orchestrated in early 2012.

Commercialization (Inktank)
=======

The beginning of the [Inktank](http://www.inktank.com/) era was an exciting time for those involved because most of the people on the team were big fans of open source. The chief concern at this point was just “how do we do things ‘right’?”, versus “how do we make a lot of money?,” which often leads to bad long-term decisions for short-term gains. This created a strong base for Ceph as things such as community were brought to the forefront instead of taking a back seat to sales and marketing.

Thanks to early funding from DreamHost and Mark Shuttleworth, the founding team at Inktank was able to take their time and carefully consider details such as the business model (Red Hat, SUSE, Cloudera, MySQL, Canonical, etc.) and how best to build an open source company and strong community. As the dust settled, there were several clear goals:

1. A stable release for production deployment (DreamObejcts)
2. Lay the foundation for widespread adoption (platform support, documentation, build/test infrastructure)
3. Build sales and support organization
4. Expand engineering organization

During this process, a professional agency was brought on board to create a clear branding of both the company and the project.  Engineering-minded folks were suddenly introduced to terms like “brand core” and “design system.” At the end of the process, the company and the project would be developed as separate brands (Inktank vs. Ceph) to foster a healthy relationship with the community and pave the way for a healthy (and broad) ecosystem that could live up to the aspirational message of “The Future of Storage.”

During this phase of development, growth started to accelerate and for the first time in Ceph’s history production deployments were cropping up too fast for anyone to keep track of them all. Thanks to a growing list of evangelists, partners, and customers, a lot of buzz helped Ceph to grow.

The next major inflection point in Ceph’s history came with the integration to OpenStack. The rapid growth and adoption by major industry players accelerated people’s awareness of Ceph and the overall adoption rate. Our sales organization was presented with the unique problem of not being able to handle all of the inbound leads. For a while, I don’t think our sales team ever made a cold call...talk about good problems to have.

Of course with all of this interest and adoption, the Ceph community started making demands on Ceph that required a much tighter focus on quality. Features such as multiple platform support, rolling upgrades, and inter-version interoperability forced us to make the decision to devote all of our development resources to the object and block portions of Ceph. This left the file system, where Ceph had originally started, as the portion of the platform that was left as “unsupported.”

Thankfully, with the increased demands, we also saw a great uptick in the number and quality of external contributions. The Ceph team was starting to see first-class contributions and features from the community, and non-Inktank people started participating in the daily standups. External contributions of this magnitude made us work hard to ensure that the development process was as transparent as possible, which led to the birth of the [Ceph Developer Summit (CDS)](https://wiki.ceph.com/Planning/CDS/CDS_Giant_and_Hammer_%28Jun_2014%29).

To facilitate a truly open development model adequately, Ceph developers would begin meeting in an online setting each quarter and discuss upcoming work on Ceph. Community members who wanted to contribute work to Ceph were asked to fill out a brief blueprint.  Each blueprint was given a session at CDS where they could discuss the work with Sage and the community at large. This allowed the team to settle on an owner for the blueprint and a coordinated approach to all work. The first CDS was in the spring of 2013 and one is held each quarter after a major release to prepare for the next.

During all of this development, the Inktank sales team was acquiring customers at a prodigious rate and our management team was seeking another round of funding. Based on feedback from investors, it was clear that a  **Product Company** (rather than a versus a “Support Company") had a better chance of getting funding, which inspired Inktank to create “Inktank Ceph Enterprise.” Inktank Ceph Enterprise, in addition to support, included a proprietary dashboard called **Calamari**, which allowed enterprise users to quickly and easily monitor their Ceph deployment.

Just as funding was getting ready to close, a proposal from Red Hat that offered stability and a culture of open source stewardship hit the table and appealed to many of the people inside Inktank.

Acquisition (Red Hat)
=======

Although this phase in Ceph’s life is just beginning, going from calling yourself *the Red Hat of storage* to being the storage of Red Hat has been an interesting change. The core Ceph team is all excited about what the resources and long-standing open source culture at Red Hat will be able to offer in the way of acceleration and expansion of the Ceph platform. Below you can see the history at a glance, and hopefully the milestones will just keep coming.

![](blog/timeline_cropped.png)

Because Red Hat is a pure open source model, we have already seen great progress for the Ceph community in the release of Calamari as open source. As FOSS developers, we were all a little conflicted about having to build a proprietary piece of software, but the acquisition by Red Hat allowed us to quickly give this tool back to the community for development and consumption. I expect many more advancements to come in the name of open source.

It’s hard to believe that this road has been 10 years in the making, but a lot of people have worked hard to get Ceph where it is and we couldn’t be more grateful. We’d like to individually thank all of the 200+ contributors to Ceph thus far (and we will, stay tuned!) and the many others that have helped with their partnerships, feedback, and evangelism. 

Because this anniversary coincides so nicely with the upcoming [OSCON](http://www.oscon.com/oscon2014) event, we plan on making some noise. So if you are able, please stop by to see us at OSCON and help us wish Ceph a happy double digits. Here’s to another decade &ndash; and more &ndash; of Ceph and open source changing the storage world.
