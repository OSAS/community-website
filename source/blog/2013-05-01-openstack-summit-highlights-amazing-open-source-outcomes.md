---
author: jbrooks
comments: true
date: 2013-05-01 18:54:02+00:00
layout: post
slug: openstack-summit-highlights-amazing-open-source-outcomes
title: OpenStack Summit highlights amazing open source outcomes
wordpress_id: 244
categories:
- Blog
tags:
- OpenStack
---

Last month, I attended my first [OpenStack Summit](https://www.openstack.org/summit/portland-2013/) as part of a team from Red Hat helping to launch a [new community distribution](http://openstack.redhat.com/) of the popular open source infrastructure as a service (IaaS) project.

I came away from the Summit impressed with the size and velocity of OpenStack. The conference drew some 3000 users, developers, and members of the vendor community, roughly twice the draw from the previous Summit. What's more, several of OpenStack's component sub-projects reported a doubling in the number of active developers in their ranks over the past six months.

What impressed me more than the growth of the project, however, was the way that OpenStack embodies one of things I love most about open source, namely, its knack for helping people to peel back or eliminate barriers to innovation. The more freedom we afford ourselves to experiment with and improve the systems we care about, the more amazing results we can achieve.

For instance, the last sentiment I expected to leave the Summit with was a newfound excitement about my cable company, but after hearing what Comcast has been able to do with OpenStack, that's just how I'm feeling. In a [keynote presentation](http://www.openstack.org/summit/portland-2013/session-videos/presentation/keynote-comcast-user-spotlight) on Tuesday, Comcast SVP of Product Engineering Mark Muehl explained that the set top boxes that deliver television services to most of his company's subscribers are comprised of closed hardware and software, produced by a separate vendor through a vertically-integrated process into which Comcast has limited visibility.

http://www.youtube.com/watch?v=8qzAMcN8uic

Given the fact that most of the intelligence that shapes one's cable TV experience has been locked up in these rigid, limited devices, it's no surprise that these services have seemed frozen in time.

Muehl reported that for its new platform, called X1, Comcast shifted most of the intelligence for its service from the set top box to an open source-based server and software infrastructure running on an OpenStack cloud. This shift is allowing Comcast to provide features that we take for granted on the Internet, like search suggestions that auto-complete as you key letters into your remote, alongside new applications that combine TV services with data from the Web. Muehl talked about the three-week development effort required to display Rotten Tomatoes movie ratings alongside program data, something that previously would not have been possible at all.

Another [keynote presentation](http://www.openstack.org/summit/portland-2013/session-videos/presentation/keynote-openstack-at-the-national-security-agency-nsa) on Wednesday picked up on a similar theme, but from a very different domain. In the talk, NSA computer scientist [Nathanael Burton](https://twitter.com/mathrock) told his own story about how rigid processes were holding back innovation at the NSA, where technologists across a wide range of disciplines work to analyze vast amounts of data.

http://www.youtube.com/watch?v=NgahKksMZis

Burton described the series of siloed computing teams and lengthy approval processes that stood between NSA technologists and the resources they required to pursue new ideas as their "carbon-based IaaS," and noted that this highly-manual system could take weeks or months to navigate.

After learning about OpenStack around the time of its ["Cactus" release](https://wiki.openstack.org/wiki/ReleaseNotes/Cactus), Burton brought up a below-the-radar pilot installation of OpenStack running on repurposed hardware in an NSA lab. Within two weeks, they were up and running with an initial group of users who, despite the limited capabilities of the pilot cloud, were amazed at how much simpler setting up application hosting could be.

The initial pilot cloud grew to occupy more hardware and gained access to data resources outside of the isolated lab network before eventually expanding to a hardened, production-ready deployment. Burton explained how his team further lowered the barriers to accessing the system by implementing automatic account creation, with access to a limited resource quota, based on the PKI certificates already issued to each of its users.

When their production OpenStack deployment was ready to go live, Burton's team opted to launch quietly, without any broad announcement, but picked up hundreds of users within the first few weeks through word of mouth. Now, after a year of running their cloud in production, what started as a dramatically simpler way to allocate resources has led to more collaborative development patterns, and a model for transforming IT operations that Burton indicated the NSA's sister agencies are preparing to adopt in the coming months.

Of course, success with OpenStack, or any other open source project or practice, can't boil down just to smashing barriers and getting rid of pesky processes. For Comcast, Muehl acknowledged that the company's embrace of OpenStack for deployment has come with a learning curve for developer teams unaccustomed to building for cloud environments. For the NSA, Burton explained how their introvert-friendly auto-account creating OpenStack deployment relied heavily on existing systems and had to comply with agency requirements.

The early success that can come with quick deployment and faster development cycles often leads to growing user communities that depend on these clouds to scale and to stay up and running. Nathanael Burton described the burst of popularity their cloud received at the NSA as a unicorn outbreak. Fortunately, with a healthy open source project like OpenStack, there's no shortage of community members available to help.
