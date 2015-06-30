---
title: Moving Focus to the Upstream
author: bkp
date: 2015-06-30 07:00 UTC
tags: oVirt, Bugzilla, RHEV
comments: true
published: true
---
![oVirt logo](blog/oVirt-logo.png) When code with the complexity of [oVirt](http://www.ovirt.org) gets developed, one of the more critical pieces of tooling to have is an issue tracker. Issue trackers--which work for any size coding project, really--enable developers and quality engineers to make note of features to add and the progress in which they are getting added. They also help project participants identify faulty behaviors and prioritize them for repair. This latter use is why issue trackers are also known as bug trackers. 

One of the best open source bug trackers for development today is Bugzilla, and it's the system oVirt uses for issue tracking, along with many other projects in which Red Hat is involved. It is also the same tracker used for one of oVirt's downstream commercial products, [Red Hat Enterprise Virtualization](http://www.redhat.com/en/technologies/virtualization) (RHEV). And therein lies a little bit of a problem--a problem we are happy to say is getting solved with an even more open policy on issue and bug tracking. 

READMORE

Currently, oVirt is a set of synced sub-projects within the broader RHEV project. At first this might seem that Red Hat is just being maniacal in its control of oVirt, but it really isn't the case. This set up goes back to the origins of oVirt has a proprietary commercial product first, which then later became an open source project. In this circumstance, it made sense to have bug tracking focus on downstream RHEV and not upstream oVirt. 

But, over time, it became clear that this situation was no longer viable. Logistically, all of the oVirt sub projects were getting more and more complex, and tracking them as separate upstream issues in an issue tracker focused on the downstream was getting too unwieldy. From a governance standpoint it was weird too--development has always been focused on oVirt first, ever since oVirt was converted to open source code. But the system used for issue tracking was more complete and useful for downstream development and QE. We had, in effect, walled off a part of our development process, because it was hard to file more complete issues in Bugzilla for oVirt proper. 

That, we are happy to say, is all about to change. This week, the oVirt team is working to move oVirt to its own classification within our Bugzilla system. No longer limited as a set of sub-projects, each building block (sub-project) of oVirt, not RHEV, will be a Bugzilla product. This will allow tracking of package versions and target releases based on their own versioning schema and shift the focus of QE's tracking system to the upstream where it belongs. Each maintainer, for example, will have administrative rights on his or her Bugzilla sub-project and will be able to change flags, versions, targets, and components. 

This is a big step for oVirt, because the more focus we get on the upstream, the better the health of our project will become. After this change, will will soon be focusing our attention on the documentation for oVirt, which right now gets a lot of focus in RHEV, and not so much focus in oVirt. By making some changes to the format of our website and our processes, we hope to have the focus on upstream documentation first, which is the way it should be. 

oVirt is seeing a lot of success of late: it is the basis of three separate commercial product offering from three different companies. Developers are starting to fork our code for use in their projects. And our user base is constantly growing. Making us a healthier open source project has never been a higher priority, and these new changes to Bugzilla will ensure our health will be improved.
