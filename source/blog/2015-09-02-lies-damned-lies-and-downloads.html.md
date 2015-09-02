---
title: Lies, Damned Lies, And Downloads
author: misc
date: 2015-09-02 13:42 UTC
tags: community, metrics
comments: true
published: true
---

![Download Icon](blog/download-icon.png) Most people who went to school learned to count, a skill basic enough to be mastered by everyone. Yet, we often forget to use the necessary amount of critical thinking with counting, which leads to some problems--especially in free software.

Working for a company that started as a Linux distribution provider, it will surprise no one by saying that my team is often asked to acquire some statistics about the downloads of packages in order to estimate community engagement and the number of users of the project.

Though my job is not a community liaison, I work with enough of them to understand they need a way to measure the growth of their respective communities and the impact of their work. The professionalization of the community metrics field has even spawned its own [mini-conference](http://flosscommunitymetrics.org/). Similarly, my colleagues working on the commercial side of the company have long since embraced the use of metrics and KPI offered by numerous CRM software platforms that provide reports to the upper management and enabling them to have a synthetic view and much-needed feedback on their initiatives.

But when people ask me for such statistics, I often explain why this is not the best idea. While download statistics are good for trends in community growth, they are not the sole sign of community health. This is due to three points I will now explain in detail.

READMORE

## Mirror, Mirror

The first one should be quite obvious to anyone who worked on the infrastructure side of a Linux distribution. If a project is working well, it get more users and more deliverables, which translates into an exponential growth of the network bandwidth used on the infrastructure side, which in turn causes some scaling challenges.

While academics have proposed for years to distribute packages using peer-to-peer (P2P) methods in various [research](www.camrdale.org/apt-p2p/presentation.pdf) [papers](www.prism.uvsq.fr/~preda/papers/edos-demo.pdf), most projects I am aware of haven't adopted that mode of distribution and still rely on volunteers providing mirrors to the public--either with FTP or HTTP as the transfer protocol.

There are various reasons for this mirroring practice, from corporate acceptance (no firewall fiddling, easy to mirror in the LAN), to ease-of-deployment from a community point of view, since this is a battle-tested and well-understood method.

Yet that doesn't mean that the P2P idea is useless, since it has been used by game publishers such as Blizzard for years. Even the newly released Windows 10 is rumored to offer this feature. But if the communities around free software are not implementing P2P, it might just be because P2P is not solving their problems.

Therefore, any kind of accurate statistics would require getting the logs of the mirrors' servers, a operation problematic both from the privacy and execution angles. Most sysadmins I know prefer to set up a periodic task and be done with it, not doing the maintenance of yet another system more complicated than a single rsync command line. Given that mirror admins are doing this on their own free time, no one really wants to add more burden on their shoulders.

Since there is likely a huge variation of use between mirrors due to being located in different countries and offering between 10 Mb to 10 Gb of bandwidth, you can hardly extrapolate from the logs of one single mirror and just multiply by the number of mirrors to get a estimation. Most distributions and big projects also have a adaptive method of directing a user to a download mirror, so a drop or a peak around one mirror could just be the effect of an outage or the creation of another mirror in a nearby network location.

And this does not even take into account the people using download accelerators or similar software promising to accelerate downloads, but mostly just results into more load on the mirror network by opening more network connections, consuming more memory and resources, and skewing download counts in the process.

There is also the issue of not knowing what we want to actually count. An rpm updated every day would have many more downloads than one updated every month, so we would see a difference from 1 to 30, depending on the policy of the project and the downstream users and how we count and present the data. Or, for software projects with a more regular cadence, what about downstream distributions who offer their own packages? Who would then not be counted by your set of mirrors? What about language-specific archives such as CPAN, PyPI, or maven, which would further isolate you from your users?

In theory, this issue could be solved by using something like [Swift](http://docs.openstack.org/developer/swift/) or Amazon S3 to distribute the content, provided someone is willing to deal with the infrastructure and the cost. There are even various start-ups offering this as a service, so it's not impossible this issue could be solved in the future, at least for a small project with proper funding.

## Figuring Out Equivalency

Let's assume for a moment there is a way to get access to all download logs across all content mirrors, and we are able to count who downloaded a specific package, correlating and correcting errors such as download accelerators or bias due to release policies. This bring me to my second point, which is a quite common error: believing that one hit in the log means something that can be converted to a number of users.

While this seems rather intuitive, in practice some people (or even some countries) have caching proxies, local mirrors, shared Internet connections or just dynamic IP addresses. In the absence of a unique identifier for each system, we cannot really estimate precisely the number of systems associated with each hit. And, since a lot of free software projects actually care about their users' privacy, they aren't likely add any sort of tracking technology within their software.

So, even if one download could be counted as one installed system, not every software installation maps cleanly to one user. For example, for a highly distributed system such as [Ceph](http://www.ceph.com/), one organization will likely have more than one computer within its Ceph cluster, and perhaps more than one Ceph cluster will be present as well.

With this in mind, we cannot guess the number of users based on the download logs only, nor even based on the IPs in the log since this can be a public IP for each server. Quite the contrary, several groups in an organization with a shared Internet access can be hidden. While not all projects suffer from such issues, enough of the ones I help do, so this a problem we can't ignore. We can reduce the impact by applying enough correlation and corrections, but then the numbers stop to be easy to understand, which defeats the original purpose of the operation.

## The Delivery Method

If someone did have a way to identify a system for anonymous statistics-gathering purpose (a guarantee you can't really make, but I will skip the ethics discussion around such an approach), we are in a era of continuous integration, continuous delivery, and containers. This brings me to my third point. Like the others caveats I have mentioned, this will be highly dependent on your project and for some of the communities I work with, this will not be a problem. For example, I cannot imagine people endlessly downloading the virtual machine images from [ManageIQ](http://www.manageiq.org) to re-upload them in their cloud for CI/CD purposes.

But it would be also likely to have someone somewhere using the project deliverables to build [server immutable images](http://martinfowler.com/bliki/ImmutableServer.html) with [packer](https://www.packer.io/) or [rpm-ostree](http://patrick.uiterwijk.org/2014/01/21/rpm-ostree/), or just building containers using [Docker](https://www.docker.com/), [Rocket](http://rocket.readthedocs.org/en/latest/), or [Openshift Origin](https://www.openshift.org/), and thus constantly installing the same [Gluster](http://www.gluster.org) rpms or [Wildfly](http://www.jboss.org/) archives in their images, thus making the download count skyrocket, and dominate the more "regular" usage of someone deploying upon installing a server. Given the reliance by part of the industry on public cloud infrastructure--where Internet addresses are reused and recycled--we wouldn't even be able to deduce any kind of clustering to group them by user to correct the data.

In some cases, it might even be others' community sub-projects who skew the numbers, especially for something like Java middleware, where the culture of code reuse is quite high. Pushing that idea further, a simple architectural change on someone else's continuous delivery pipeline could change from 10 download hits per hour to 50 or 100, because someone suddenly decided to start their build in a fresh cloud instance and therefore no longer caches the artifacts needed for any kind of build, thus creating the need to download artifacts each time.

If people's choices in terms of infrastructure can make a difference in the download numbers by one or two orders of magnitude, this means that you can't really compare numbers between projects, and you can't even know if an increase of downloads is a increase of users, or just a increase of builds by a downstream user.

In the end, we can try to compile numbers we cannot truly get for some projects; numbers that would in all cases require some filtering and domain-specific modifications to be meaningful and sometimes not even reflect anything regarding the realties of community and adoption. In the worst case, it's not even numbers we can compare from one year to another.

This is why we need to have events such as the [Floss Community Metrics Meeting](http://flosscommunitymetrics.org/) and why we should stop trying to focus on the download numbers and start to look at what really matters. Discuss what it means to be successful in the community. Should we examine the people in the community and their diversity, or should we look at the events around the community and their frequency Or find out how people speak of the project, perhaps with more formal users' surveys as done on a regular basis by the OpenStack Foundation?

There are a lot of good ways to have insights into a free software project, but most of the time download numbers aren't one of them.
