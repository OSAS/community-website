---
title: Let the River Flow?
author: bkp
date: 2017-05-16 17:50:54 UTC
tags: community, upstream, downstream
comments: true
published: true
---

![river](blog/River.jpg) Inside the world of Red Hat, and other open source-oriented companies, there is a recurring metaphor to try to help explain the relationship between the projects where our source software is created and the commercially available software we ship with support, training, and other value-adds.

The metaphor used is "upstream" and "downstream," where upstream code is the "source" project code and "downstream" is the refined product code. Thus, [Fedora](https://getfedora.org/) is the upstream to [Red Hat Enterprise Linux's](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) downstream, to ocik one example.

But increasingly we have been noticing a certain problem with this metaphor: very few people outside Red Hat and companies in this sector of IT really understood what the whole "stream" metaphor meant. Worse, when we really looked at the upstream/downstream metaphor ourselves, we realized that it has a fairly big flaw on its own.

READMORE

## Riding the Rapids

Explaining what we do at Red Hat is not particularly easy. Even when we manage to articulate what our workflow models are, you'd be amazed at how many people look at us askance and reply with something like "yeah, but how does it *really* work?" You say you're open, and people think you're hiding something, because that's just too easy.

Even at the technological level, where the code lives, you can't just say that the project set of software is open source and the commercial software isn't, because at Red Hat, it's *all* open source. This is how projects like [CentOS](https://www.centos.org/) exist: the project members take Red Hat Enterprise Linux's source code, rebrand it, and distribute it as CentOS. In that situation, RHEL is the upstream, and CentOS is the downstream.

The CentOS example, though, begins to pull the thread (if you'll forgive the *Inception*-like mixing of metaphors) on the stream metaphor. Even in Red Hat, we came to lean pretty heavily on upstream code being "non-commercial" and downstream code being "commercial." That doesn't really work with the RHEL/CentOS relationship.

Nor does it perfectly work for a project like [RDO](https://www.rdoproject.org/), which is part of the much larger [OpenStack](https://www.openstack.org/) community (RDO's upstream). In turn, RDO is the upstream for [Red Hat OpenStack Platform](https://www.redhat.com/en/technologies/linux-platforms/openstack-platform).

Even putting aside these exceptions to the metaphor's rule, there is also a glaring flaw that was staring us right in the face the whole time. The flaw? Simply put, upstream and downstream does not truly convey *value*.

The stream metaphor does a pretty good job of illustrating process flow for the software code in all of these projects and products, but it does not reflect any sort of difference between the code that is upstream and the code that is downstream. It negates the fact that while projects like [Gluster](https://www.gluster.org/) and [Ceph](http://ceph.com/) are great on their own, the value-add of the work the Red hat teams do to generate [Red Hat Gluster Storage and Red Hat Ceph Storage](https://www.redhat.com/en/technologies/storage) is ignored.

Water upstream is (ideally) the same as the water downstream. But the code isn't exactly the same between Fedora and RHEL: the cutting-edge features of Fedora are removed or tightened down to make the RHEL operating system more enterprise-friendly. Nor does the support, training, documentation, etc. available with a RHEL subscription fit within the model, either.

Faced with this, our team is starting to explore different ways of to paint a picture of our software relationships for everyone to understand. It's an interesting challenge, to be sure, as we have some really creative people within Open Source and Standards and some of the metaphors have reflected that creativity. But we are exploring the options and building new stories that we hope to share soon.

*Image courtesy of [Pete Forsyth, Wiki Strategies](https://wikistrategies.net/pete-forsyth) under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.en) license.*
