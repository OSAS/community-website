---
title: RDO at the CentOS Dojo
author: rbowen
date: 2015-01-30 14:37:08 UTC
tags: CentOS, Dojo, RDO, OpenStack, FOSDEM
comments: true
published: true
---

![](blog/centosdojo_fosdem.jpg) On the Friday before FOSDEM, we gathered at the IBM offices in
Brussels for the [CentOS Dojo](http://wiki.centos.org/Events/Dojo/Brussels2015). 

This morning, Haikel Guemar led a hands-on
RDO tutorial, in which he presented some basic information about RDO,
and then provided instructions to install RDO, and several of us walked
around ensuring that it was all going well.

Due to time, as well as VM limitations, we installed a subset of the
entire OpenStack packages - just Nova, Glance, Keystone, Neutron, and
Horizon. (Optionally, Swift.)

Also, rather than using the repo referenced in the [RDO
QuickStart](http://openstack.redhat.com/Quickstart), we used the newly
available repo on the CentOS build system: [http://buildlogs.centos.org/centos/7/cloud/openstack-rdo/centos-cloud-rdo.repo](http://buildlogs.centos.org/centos/7/cloud/openstack-rdo/centos-cloud-rdo.repo).
This was done to demonstrate our ongoing move to packaging RDO via the
[CentOS Cloud SIG](http://wiki.centos.org/SpecialInterestGroup/Cloud).

Following Haikel's presentation, Jakub Ruzicka talked about ways to
participate in the RDO project. Jakub talked about the 
[RDO Packaging Guide](https://openstack.redhat.com/packaging/), and
mentioned several places that people could get involved, including the
effort to package OpenStack for CentOS 6.

We had perhaps 30 people in attendance, and it looked like at least a
dozen people made it successfully through deploying RDO, which was
encouraging; however, Haikel and I talked afterwards about what we might
do to make events like this more successful in the future. If you were
in attendance and have any suggestions, please send your comments to the
[rdo-list](https://www.redhat.com/mailman/listinfo/rdo-list) mailing
list, so that we can help more people have a successful experience.

RDO:
*Follow the RDO community on Twitter at [@RDOCommunity](https://twitter.com/rdocommunity), and on  [Facebook](https://www.facebook.com/rdocommunity) and [G+](https://plus.google.com/communities/110409030763231732154). Subscribe to the [rdo-list mailing list](http://www.redhat.com/mailman/listinfo/rdo-list) for technical questions, or to the [newsletter mailing list](http://www.redhat.com/mailman/listinfo/rdo-newsletter) for monthly community updates.*

CentOS:
*Follow CentOS on Twitter at [@CentOS](https://twitter.com/centos) and learn more about the dojos by following [@CentOSEvents](https://twitter.com/centosevents). You can also keep up with the CentOS community on [G+](https://plus.google.com/u/0/b/113258037797946990391/+CentOS/posts) and [Facebook](https://www.facebook.com/groups/centosproject/), and in [IRC](http://wiki.centos.org/irc).*

