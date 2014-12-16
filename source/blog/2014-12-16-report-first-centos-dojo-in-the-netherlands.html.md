---
title: 'Report: First CentOS Dojo in the Netherlands '
author: plaimbock
date: 2014-12-16 17:31:05 UTC
tags: CentOS, OpenStack, Dojo, Docker
comments: true
published: true
---

![](blog/CentOS_200x.png)Hosted by Schuberg Philis at their facilities near Amsterdam, the first [CentOS Dojo](http://wiki.centos.org/Events/Dojo/Amsterdam2014) in the Netherlands took place on December 2nd. Virtually all those who had RSVPed were already present from the start. The crowd consisted of an interesting, diverse mix of people with various backgrounds from across the Netherlands. Clearly CentOS caters to a wide audience. Fueled by fresh coffee, orange juice, and cookies, everybody eased into socializing in a relaxed atmosphere. 

When it was time to start, [Karanbir Singh](http://twitter.com/kbsingh) did the honors of kicking off the first Dutch Dojo. He told a captivated audience about how he got involved in the CentOS project in the early days, how he became the Project Leader, how the project evolved over the years, and then finished with how the project [joined forces](http://www.redhat.com/en/about/press-releases/red-hat-and-centos-join-forces) with Red Hat. 

After Karanbir's opening, [Chmouel Boudjnah](https://twitter.com/chmouel) talked about Docker integration with OpenStack. Chmouel started with explaining how Docker integrates with OpenStack on an architectural level and how it all fits together. Next he showed a live demo, installing DevStack with Docker integration and deploying a container. Although the Docker Hypervisor project currently still lives out-of-tree, from what Chmouel's demo showed, the project holds a lot of promise.

Next up was [Vincent Batts](https://twitter.com/vbatts), who gave us an excellent introduction to Docker. Although everybody in the audience had heard of Docker, the folks with hands-on Docker experience was quite a different story, so Vincent's presentation was spot-on. He explained the technical details of Docker and then showed what a Dockerfile looks like, how to build a Docker image, and how to launch a Docker container, then he finished with showing how information is exchanged between Docker containers and the host. After Vincent's presentation, attendees broke for an excellent lunch and more socializing.

After lunch,  I gave my talk about the history, present status, and future of high availability in OpenStack, and  I focused on the networking part of OpenStack, which has a major impact on HA. I explained how the networking part evolved, got replaced, and evolved some more; its HA capabilities; and what to expect in the near future. Given the progress that has been made in Juno and the upcoming [Kilo release](https://wiki.openstack.org/wiki/Kilo_Release_Schedule), deploying the OpenStack Juno release is advisable if you want to benefit from networking high-availability features. 

Next, Karanbir talked about the new CentOS community infrastructure. He told us about the build systems currently in place, the amazing amount of builds and tests that are performed, the expansion of the infrastructure with public git repositories and the community continuous integration environment, and how the community is most welcome to contribute. The expanded [CentOS Community Infrastructure](http://community.redhat.com/blog/2014/10/CentOS-SIGs-update/) will definitely help the [Special Interest Groups (SIGs)](http://community.redhat.com/blog/2014/10/CentOS-SIGs-update/) with making their deliverables available to the community at large.
 
[Andreas Thienemann](https://twitter.com/i_x_s) did the last presentation of the day. He offered interesting arguments that Docker containers are a step backwards, and he invited everybody to share their thoughts. A lively discussion about the (non-)merits of Docker ensued, with people on both sides of the fence. Although there was agreement that Docker is a great tool for development, the same could not be said about using Docker at scale for critical workloads in production. The CoreOS Rocket announcement meant a wait-and-see approach for most attendees.

Overall it was a great day, with interesting people in a nice location. A big thanks to both [Schuberg Philis](https://www.schubergphilis.com/) and Red Hat for sponsoring the first Dutch Dojo, to the speakers for presenting, and to the Dutch CentOS community members for participating.

*Follow [@CentOS](https://twitter.com/centos) on Twitter for the latest project news and [@CentOSEvents](https://twitter.com/centosevents) to stay updated on Dojos.*