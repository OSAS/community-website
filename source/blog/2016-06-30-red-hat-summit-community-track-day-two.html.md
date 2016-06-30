---
title: Red Hat Summit Community Track Day Two
date: 2016-06-30 00:24 UTC
author: jzb
tags: community, open source, Summit
published: true
comments: true
---
![Summit logo](blog/bkp/Redhat-Summit.png) Wednesday was another fine day at Red Hat Summit 2016 in San Francisco at the Moscone Center. After a really fun keynote that included deploying a mobile game that something like 800 attendees played live, it was time for breakout sessions.

What follows is a nearly stream-of-consciousness grab of the highlights of the sessions from day two.

READMORE

## Becoming a Contributor to Openstack on OpenStack (TripleO)

"My name is Rain, and I'm talking to you about cloud... let's consider that for a moment." You have to love a presenter who seems born to the destiny of talking about their topic.

What's [TripleO](https://wiki.openstack.org/wiki/TripleO), and why would you want it, or to contribute to it? Rain described the use case as companies that want to offer OpenStack instances to other organizations, by using OpenStack to deploy the new OpenStack instances. You could, says Rain, even deploy OpenStack on OpenStack on OpenStack, but that would be "really slow."

This might seem like an academic exercise, but Rain says it's meant for production. Organiations use an "undercloud" to deploy "overclouds" for their customers, and manage those clouds once they're deployed. So if your business is standing up OpenStack instances for other groups, organizations, or customers&mdash;you should take a look at (and then contribute to!) TripleO.

Should you switch to TripleO? Only if you want to administer **multiple OpenStacks**. And, Rain pointed out, if what you're doing now isn't working for you. If what you have right now is working? Stick with it.  

How can you contribute? First, start with the [quickstart](https://www.rdoproject.org/tripleo/). Test it out and kick the tires. It's **not** just code! Give talks, submit documentation, give shoutouts to TripleO on social media, answer questions on IRC, present at meetups, etc. See Rain's [post about her talk](http://groningenrain.nl/become-an-openstack-tripleo-atc-easy-as-abc/#more-1229) for even more details and links.

## Continuous Integration and Cockpit

Stef Walter and Peter Volpe presented "a story" about Cockpit, its continuous integration, and the "supporting cast" that work with Cockpit (like Docker, Atomic, dbus, and many many more).

Stef likened putting together Cockpit with a story like the "Count of Monte Cristo" where you have a large cast of characters that have a "massive amount of characters interacting in various ways." Cockpit, says Stef, "lives and dies" by its testing. Very dramatic! But also true, given the rate of development and the breadth of other projects that Cockpit touches.

GitHub stores tasks, status, and shows feedback. The Runner chooses what tests to run, and builds an Artifact, then runs a Suite of tests. Finally, results are posted to the Sink. (So-called because it feels like a lot of things are being dumped to it.)

The feedback loop, says Stef, is King. Getting results back to the contributor as quickly as possible is the highest priority goal in all of this. We all have to pay the price of creating tests in any community, but what's not a given is the benefit of the tests. You get massive benefits if you do the testing **before you merge**.

Why do we need to do all this testing, why is speed essential? If contributors have to wait months to see fixes integrated, or shipped, the friction to contribution is too high.

Cockpit releases **around 50 releases a year**, and depends on "robots" to do most of the release work once a release is tagged in git. Every few months a release is chosen to promote to Red Hat Enteprise Linux (RHEL), Fedora, etc. But if you're looking directly upstream, you get 50 releases per year. This includes a tarball, RPM for Fedora, containers, Debian packages, and much more.

To demonstrate the process, Stef pushed the tag for Cockpit 0.112 and showed "the robots spring into action." It takes an hour or two, but from there the release should go out without further human intervention.

In conclusion, Stef says "open source is distributed, and there's a penalty for distributed, but it **scales**." Likewise, says Stef, the integration testing should be distributed as well. The packaging and delivery should be distributed. Everything should happen upstream, and if it's not upstream it's a recurring cost that you will pay for over time.

## Management, Legal, and Developers

Red Hat's Richard Fontana and Deb Nicholson (from Open Invention Network), came in to talk about how to handle open source legal issues and communication within companies.

Richard says that people don't understand the perspectives of other folks in other departments. What legal wants (minimize risk) may not be understood by engineers, what engineers want may not be understood by legal, etc. It's important to open lines of communication ahead of time, not just when issues arise.

Talk at key points during projects, talk when things change, make sure people understand when things change. If there's a change in legal strategy, communicate that to developers, and so on.

Easy to say, how do you do it? Deb says that you should share goals, but leave implementation to departments. Share timelines so that other departments have an idea what timelines your department operates on, and you don't get surprises.

They also discussed external communication and project governance. Richard says that a project may seem well-governed on the surface, but there may be issues lurking under the surface. "Take some time to get to know how the community members interact" but don't wait too long to communicate or collaborate, if you're developing a dependency on project software.

Doing a lot of patching? Deb says that you aren't getting the best out of that project if you're not contributing that code upstream. If you're re-writing code every month or two, you're missing out on a well-maintained project and a seat at the table for the project. "A seat at the table is **one** seat, not all the seats." And don't assume tossing some beer money over the wall at a project means you can assign projects to volunteers!

Deb and Richard also stressed the importance of being transparent about what you're doing in a community. Are you pushing a technology because it's best for your company, not the upstream project? That's bad community hygiene.

Open source resources aren't just for developers. Richard pointed out that there are many open source tracks at major FOSS events like FOSDEM, SCALE, and LinuxCon. For extra credit, they would like to see others organize tracks or "continuing legal education" about FOSS licenses, trademark issues, and software patents.

## Why Every Company Needs an Open Source Office

After lunch, and a surprise [wedding](https://twitter.com/kirbomatik/status/748277899594084352) during the general session, Nithya Ruff from SanDisk gave a presentation on why companies need an open source office. (Not a thesis about which I'd need a lot of convincing...)

Whether your company's business is *directly* related to open source, only 3% of companies are not using open source in any way. And according to Nithya, about 64% of companies are *participating* in open source.

Unfortunately, many companies approach working with projects or using open source without coordination or strategy. They are "chaotic and unplanned," and exposed to risk according to Ruff. To be clear, the risk doesn't come from *using* open source, but becomes a concern when companies distribute open source projects if they're not complying with the project license.  

What companies need, is a strategy for working with open source. Nithya explained her six C's of open source strategy: "communicate, consume, contribute, collaborate, create competency, and comply." These are the areas where an organization needs to have a coherent strategy. She also encouraged metrics around contributions, the organization's communication around its open source efforts, and so forth. In part, this helps measure success, but also helps justify and identify areas for for future funding and contribution.

Companies, says Nithya, can also help open source in many ways including diversity/inclusion, align projects with corporate goals, and invest in underfunded projects.

There is, currently, a lot of chaos out there. During the Q&A Nithya asked if any of the attendees worked for a company that has an open source office, and none of the attendees raised a hand. However, the presentation seemed to generate some interest in exploring open source strategy within organizations.

## RDO and Open Networking

The final track of the day was more technical in nature. Scott Suehle, community manager for Cumulus Networks, talked about networking for OpenStack/RDO.

Scott provided a great look at some case studies for setting up OpenStack systems, and discussed the Ansible playbooks and other tools used to stand up OpenStack. The talk was fairly short, Scott powered through the meat of the talk quickly and left plenty of room for discussion and invited folks to come to the Cumulus booth with additional questions.

With that, we wrapped up the sessions for the day and prepped for the booth crawl and reception. We're not done yet, though! Join us Thursday for more great sessions!

## Thursday Schedule

 * 10:15 - 11:15 **Aplo – Gluster in containers** with Luis Pabon
 * 11:30 - 12:30 **From open source toward open innovation: Fostering corporate innovation with open source communities** with Sabine Brunswicker
 * 12:35 - 1:35 **A new model for system containers** with Colin Walters
 * 3:30 - 4:30 **Continuous integration and delivery** with CentOS with Karanbir Singh
 * 4:45 - 5:45 **OpenShift Commons: New rules for community, contribution, and collaboration** with Diane Mueller (moderator), Ken Owens, Judd Matlin, Cristian Roldan, Prashant Mishra, and Stephen Braswell
