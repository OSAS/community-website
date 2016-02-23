---
title: Gluster Takes Its Show on the Road
date: 2016-02-22 20:05 UTC
author: ndevos
tags: events, Gluster
published: true
comments: true
---
![Gluster logo](blog/gluster-ant.png) The last week of January and the first week of February were packed with events and meetings.

This blog contains my observations, opinions, and ideas in the hope that they will be useful or at least interesting for some.

READMORE

## CentOS Dojo in Brussels

The day before FOSDEM starts, the CentOS project organizes a [community
meetup in the form of their Dojos at an IBM office in Brussels](  https://wiki.centos.org/Events/Dojo/Brussels2016). Because
Gluster is participating in the [CentOS Storage SIG](https://wiki.centos.org/SpecialInterestGroup/Storage) (special interest group), I was asked to [present something](https://lists.centos.org/pipermail/centos-promo/2015-December/001581.html). My talk had a good
participation, asking about different aspects of the goals that the
Storage SIG has.

Many people are interested in the Storage SIG, mainly other SIGs that
would like to consume the packages getting produced. There is
also increasing interest from upcoming architectures to get Gluster
running on their new hardware (Aarch64 and ppc64le). The CentOS team is
working on getting the hardware in the build infrastructure and testing
environment, the Gluster packages will be one of the first SIG projects
going to use that.

The CentOS team maintains a Gluster environment for virtual machines. It
is possible for CentOS projects to request a VM, and this VM will be
located on their OpenNebula "cloud" backed by Gluster. This is a small
environment with four servers, connected over Infiniband. Gluster is setup
to use IPoIB, not using its native RDMA support. Currently, this is
running glusterfs-3.6 with a two-way replica, OpenNebula runs the VMs over
QEMU+libgfapi. In the future, this will most likely be replaced by a similar setup
based on [oVirt](http://www.ovirt.org).

## FOSDEM 2016  

At [FOSDEM](https://fosdem.org/2016/), we had a very minimal booth/table. The 500 stickers that
Amye Scavarda brought and a bunch of ball pens imported by Humble and Kaushal
were handed out around noon on the second day. Lots of people were aware of
Gluster and many were not. We definitely need a better presence next
year, visitors should easily see that Gluster is about storage and not
only the good-looking ant. [Kaushal](https://kshlm.in/fosdem16/) and [Humble](http://website-humblec.rhcloud.com/me-fosdem-2016/) wrote detailed
blog posts about FOSDEM already.

Some users that knew about Gluster also had some questions about Ceph. I
unfortunately could not point them to a booth where experts were hanging
around. It would really be nice to have some Ceph people manning a
(maybe even shared) table. Interested users should get good advice on
picking the best storage solution for their needs, and of course we
would like then to try Gluster or Ceph in the first place. A good
suggestion for users is important to prevent disappointment and possibly
negative promotion.

The [talk I gave at FOSDEM](https://fosdem.org/2016/schedule/event/gluster_roadmap/) attracted (a guestimated) 400-500 people.
The auditorium was huge, but "only" filled somewhere between 25-50% with
a lot of people arriving late, and some leaving a few minutes early.
After the talk, there were a lot of questions and we asked to move
the group of people to a little more remote location so that the next
presentation could start without the background noise. Kaleb helped in
answering some of the visitors questions, and we directed a few to the
guys at the Gluster booth as well. The talk seemed to have gone well, and I
got a request to present something at the [next NLUUG conference](https://www.nluug.nl/index-en.html).

## Gluster Developer Gatherings, Red Hat, Brno

This was mainly informal chats about different topics. We encouraged each topic to add a link to an etherpad where notes
are kept. The presenters of the sessions are expected to send a summary
based on the notes to the (community) mailing lists, which I won't cover here.

Some notes that I made during conversations that were not really
planned:

 - Richacl needed for multiprotocol support, Rajesh will post his
   work-in-progress patches to Gerrit so that others can continue with
   his start and get it in for glusterfs-3.8. (Michael Adam)

 - QE will push downstream helper libraries for testing with distaf to
   the upstream distaf framework repo or upstream tests repo. MS and
   Jonathan are the main contacts for defining and enforcing an
   "upstream first" process. "Secret sauce" tests will not become part
   of upstream (like some performance things), but all basic
   functionality should. At the moment we only catch basic functionality
   problems downstream, when we test upstream we should find them
   earlier and have more time to fix them, less chance in slipping
   release dates.

   Downstream QA will ultimately consist out of running the upstream
   distaf framework, upstream tests repo and downstream tests repo.

 - Paolo Bonzini (KVM maintainer) and Kevin Wolf (QEMU/block maintainer)
   are interested in improved Gluster support in QEMU. Not only
   SEEK_DATA/SEEK_HOLE would be nice, but also something that makes it
   possible to detect "allocated but zero-filled." lseek() can not
   detect this yet, it might be a suitable topic for discussion during
   LSF/MM in April.

   One of the things that the libvirt team (requested by oVirt/RHEV)
   asked about was support for "backup-volfile-server" support. This was
   a question from Doron Fediuck at FOSDEM as well. It was the first time
   I heard about it. Adding this seemed simple, and a train ride
   from Brussels to Amsterdam was enough to get something working. I was
   informed that someone already attempted this approach earlier... This
   work was not shared with other Gluster developers, so the progress on
   it was also not clear :-/ After searching for proposed patches, we
   found that Prasanna did quite some work (patch v13) for this. He was
   expected to arrive after the meetup with the virtualization team was planned.

   Kevin did send me a detailed follow-up (in Dutch!) after he reviewed
   the current status of QEMU/gluster. There are five suggestions on his
   list, I will follow-up on that later (plus Prasanna and gluster-devel@).

   Snapshots of VM images can be done already, but they would benefit
   from reflink support. This most likely will require a REFLINK FOP in
   Gluster, and the appropriate extensions to FUSE and libgfapi.
   Something we might want to think about for after Gluster 4.0.

 - Finally, I met Csaba Henk in real life. He will be picking up adding
   support for Kerberos in the [multitude of Gluster protocols](https://github.com/gluster/glusterfs-specs/blob/master/under_review/Kerberos.md). More
   on that will follow at some point.

## DevConf.cz

Unfortunately, there was no Gluster swag or stickers at [DevConf.cz](http://devconf.cz/), but this time there
were Ceph items! It feels like the Ceph and Gluster community managers
should work a little closer together so that we're evenly recognized at
events. The impressions that I have heard, was like "Gluster is a
project for community users, Ceph is what Red Hat promotes for storage
solutions." I'm pretty sure that it is not the message we want to relay
to others. The talks on Ceph and Gluster at the event(s) were more
equally distributed, so maybe visitors did not notice it like I did.

During the [Gluster Workshop](https://devconfcz2016.sched.org/event/5m1X/build-your-own-scale-out-storage-with-gluster) (and most of the conference), there was
very bad Internet connectivity. This made it very difficult for the
participants to download the Gluster packages for their distribution. So
instead of a very "do-it-yourself" workshop, it became more of a
presentation and demonstration. From the few people that had taken the
courage to open their laptops, only a handful of attendees managed to
create a Gluster volume and try it out. The attendees of the workshop
were quite knowledgeable, and did not hesitate to ask good questions.

After the workshop, there were more detailed questions from users and
developers. Some about split-brain resolution and prevention, others
about (again) the "backup-volfile-server" 'mount' option for QEMU. We
definitely need to promote features like "policy based split-brain
resolution," "arbiter volumes," and "sharded volumes" much more. Many
users store VM images on Gluster and anything that helps improving the
performance and stability gets a lot of interest.

Nir Soffer (working on oVirt/RHEV) wanted to discuss some more about
improving their support for Gluster. They currently use FUSE mounts and
should move to QEMU+libgfapi to improve performance and work around
difficulties with their usage of FUSE filesystems. At least two things
could use assistance from the Gluster team:

  * glusterfs-cli to be available for RHGS client systems
  * Sanlock improvements to use libgfapi instead of a filesystem

Speaking to Heinz Mauelshagen (LVM/dm developer) about different aspects
of Gluster triggered a memory of something a FOSDEM visitor asked: Would
it be possible to have a tiered Gluster volume with a RAM-disk as "hot"
tier? This is not something we can do in Gluster now, but it seems
that dm-cache can be configured like this. dm-cache just needs a
block-device, and that can be created at boot. With some config-options
it is possible to setup dm-cache as a write-through cache. This is
definitely something I need to check out and relay back to the guy
asking this question (he's in the interesting situation where they can
fill up all the RAM slots in their server if they want).

Upstream testing the CentOS CI is available for many open source
projects. Gluster will be using this soon for regular distaf test runs,
and integration tests with other projects. NFS-Ganesha and Samba are
natural candidates for that, so I encouraged Michael and Guenter to
attend the [CentOS CI talk by Brian Stinson](https://devconfcz2016.sched.org/event/5m1Z/centos-infrastructure-a-bit-of-progress-in-work).

Because the (partial) sysadmins for the Gluster infrastructure (Jenkins,
Gerrit, others servers and services) have too little time to maintain
everything, OSAS suggested to use the expertise of the CentOS team.
Many of the CentOS core members are very experienced in maintaining many
servers and services, the Gluster community could probably move much of
the infrastructure to the CentOS project and benefit from their
expertise. KB Singh [sent an email](http://thread.gmane.org/gmane.comp.file-systems.gluster.infra/933) with notes from a meeting about this topic to the gluster-infra list. It is up to the Gluster community
to accept their assistance and enjoy a more stable infrastructure.


Wow, did you really read this up to here?! Thanks :)
