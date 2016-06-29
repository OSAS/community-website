---
title: Red Hat Summit Community Track Day One
date: 2016-06-29 00:24 UTC
author: jzb
tags: community, open source, Summit
published: true
comments: true
---
![Summit logo](blog/bkp/Redhat-Summit.png) You might have heard that several thousand people have converged on San Francisco for [Red Hat Summit](https://www.redhat.com/en/summit) at Moscone this week. One of the highlights for Summit this year (at least for me!) is the Community Track, part of the main Summit schedule for the first time this year. Missed it? Don't worry, there's more tomorrow!

READMORE

## Ansible and OpenStack

Major Hayden of Rackspace and Robyn Bergeron from Ansible discussed how OpenStack and Ansible can be used together to simplify setting up and managing OpenStack clouds using Ansible. The best part of the presentation was a live demo to set up a demo project of a marketing project, including a Web server, users, and all the other goodies needed to provision a starter projet.

But, we can go bigger! Hayden and Bergeron also talked about [OpenStack's Zuul project](http://amo-probos.org/post/18), which helps deploy and test patches coming into OpenStack. Previously the project used Jenkins, but the sheer volume of commits overwhelmed Jenkins. There's also projects to deploy OpenStack in containers (Kolla) that use Ansible, and many others.

## oVirt Uninterrupted and Integrated Virtualization

Sandro Bonazzola, the release manager for [oVirt](http://www.ovirt.org/), gave an excellent overview of oVirt and its capabilities for a lunchtime crowd at 12:30. Despite a sparse audience at the start, quite a few folks turned up to hear about oVirt and got a glimpse of its integration with OpenStack, using Docker with oVirt, and much more.

Sandro also discussed [oVirt Live](http://www.ovirt.org/download/ovirt-live/) that lets you run the oVirt Engine directly on a laptop or another system for testing purposes. If that's not enough, there's [LAGO](http://lago.readthedocs.io/en/stable/README.html) for more complex environments.

## Fedora

Matthew Miller kicked off the program after lunch with a session on Fedora and, because it's Summit, how it relates to Red Hat Enterprise Linux. Matthew spent a good chunk of the session talking about when and why you'd want to use Fedora even if your company is standardized on RHEL.

What really made the session was the question and answers after the presentation was finished. Attendees had a lot of questions about Fedora's release cycle, its support for new hardware, and more. It was a good introduction to the Fedora Project and how it makes decisions.

## Building Student Pipelines

Heidi Ellis and Greg Hislop closed out the first day with a discussion on "building the student pipeline" to open source communities.

According to Greg, the overlap between companies and use of FOSS is very high. Wherever you go, there's a "significant amount of open source" but it "ain't extending as much as you might think" for education. While students are using open source, Greg says they're not well-educated about open source and employers are "surprised" how little students know about FOSS.

What do they know about open source? "It's stuff we can use for free." They might know that Python is open source, they might know their browser is, but they don't know about open source development or the open source development approach. "Not much beyond that," Greg says.

Greg referenced a survey he performed of students, and found that fewer than 10% of the students had heard of "Cathedral and the Bazaar," or that you could get paid to work on FOSS.

How do we change this? There are some obstacles to teaching FOSS in university. It starts with faculty, but Heidi noted that academia moves slowly. Few faculty, even those in computer science, have experience working with real-world software development. There's no open source development publication to publish research in as well!

Innovation for curricula is slow. It can take a year to develop a new course, and up to four years for an entirely new curriculum. For example, Fedora has a six-month release cycle, academia has one to four years. Planning for Fedora? About a year. Academia? Up to five years. Execution time in Fedora? About six to 12 months, but it can take four years to move on a new program in a standard academic environment.

How do we solve this? One early effort Greg outlined is the Professors Open Source Summer Experience (POSSE), which provides immersive introductions to FOSS. Greg noted two problems with the initial version. First, while Red Hat provided the instruction, faculity didn't have travel funding for it. Second, Red Hat instructors lacked academic experience to translate to the educators' situation.

The second version of [POSSE](http://foss2serve.org/index.php/POSSE_Overview) (Professors Open Source Software Experience) worked on collaboration with Red Hat and instructors, plus NSF funding to allow travel. It also provides coverage of instructional issues along with the HFoss introduction. It has a three stage model: online, face-to-face for a few days, and then small groups that can support one another once they're in their own institution.

Greg says they're running a few per year, and have funding to do so for a few more years. Heidi mentioned another would be offered in November.

With that, the first day of the community track wrapped. But wait, there's more to come!

## See us Tomorrow!

Attending Red Hat Summit? If so, don't miss the sessions for Wednesday and Thursday at Summit, in room 3001 (all times PDT):

### Wednesday Schedule

 * 10:15 - 11:15 **Become an OpenStack TripleO ATC, easy as ABC** with K. Rain Leander
 * 11:30 - 12:30 **How Cockpit implemented distributed scalable continuous integration** with Stef Walter
 * 12:35 - 1:35 **Management, legal, and developers: One big happy open source family** with Deb Nicholson and Richard Fontana
 * 3:30 - 4:30 **Why companies should have open source strategy office** with Nithya ruff
 * 4:45 - 5:45 **Use Linux on your whole rack with RDO and open networking** with Scott Suehle

### Thursday Schedule

 * 10:15 - 11:15 **Aplo – Gluster in containers** with Luis Pabon
 * 11:30 - 12:30 **From open source toward open innovation: Fostering corporate innovation with open source communities** with Sabine Brunswicker
 * 12:35 - 1:35 **A new model for system containers** with Colin Walters
 * 3:30 - 4:30 **Continuous integration and delivery** with CentOS with Karanbir Singh
 * 4:45 - 5:45 **OpenShift Commons: New rules for community, contribution, and collaboration** with Diane Mueller (moderator), Ken Owens, Judd Matlin, Cristian Roldan, Prashant Mishra, and Stephen Braswell
