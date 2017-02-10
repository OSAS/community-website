---
title: Fedora Goes to FOSDEM
author: bex
date: 2017-02-10 15:07:54 UTC
tags: community, open source, events
comments: true
published: true
---

![Fedora logo](blog/fedora-logo.png) I had the pleasure of going to FOSDEM this year and the annual spectacular didn't cease to deliver. During this year's conference, my second FOSDEM, I worked with [Brian Stinson](https://www.twitter.com/bstinsonmhk) of CentOS fame to produce the [Distributions Devroom](https://fosdem.org/2017/schedule/track/distributions/).

FOSDEM gets busier every year and the Distributions Devroom was no different. For almost the entire day, the room was filled and we were routinely turning people away for lack of seats. The few times there was a dip in attendance seemed tied to the topic and not the time. This leads us to believe that the program was well balanced and represented the current thoughts and interests around distributions.

READMORE

The [schedule](https://fosdem.org/2017/schedule/track/distributions/) contained:

* A talk about rolling releases replacing timed releases
* A rapid-fire list of the goals that were accomplished to bring Homebrew to 1.0.0
* The folks from Mageia helping us understand what it takes to fork a major distribution and (re)build the community around it
* The process by which SUSE documents the distribution
* How OSBS and OpenQA power distribution building and release preparation
* A talk on the continuous build process used by RDO, an OpenStack distribution
* How Fedora is redefining the distribution with a core + modules concept called modularity
* Using btrfs, an overlay file system, for transactional updates of rolling releases
* Uow using musl libc has improved Alpine and code in general
* Thinking about the installation of language specific packages, in this case npm, using the functional model from the Nix package manager
* A brief history of the packaging challenges of MySQL and MariaDB
* Expanding the definition of source code include more than just what may come initially to mind, including an interesting discussion around the data sets used to pre-train neural networks
* Using traditional Linux distributions, in this case Fedora, to power Internet of Things (IoT) devices and gateways

I won't write about all of the talks and instead encourage you to check out the recordings of each talk.
Our speakers were wearing a microphone so I believe you will find the audio quite good when accompanied by the video.

Because of my affiliation with Fedora, I strongly encourage you to [watch](https://fosdem.org/2017/schedule/event/modularity_and_generational_core/) [Adam Šamalík](https://twitter.com/adsamalik) and Petr Šabata talking about [Fedora Modularity](https://fedoraproject.org/wiki/Modularity).

As I understand it, Modularity creates a structure to sensibly change the speed at which the distribution rolls.
Parts of the operating system which need to stay stable will behave as though they were in a traditional timed release or Long Term Support (LTS) style distribution.

Conversely, parts of the operating system that need to move faster, perhaps a language stack, can move like they are part of a rolling release distribution.

I am excited that we will be able to play with this concept in the upcoming release of Fedora, Fedora 26.

I also hope you'll take the time to watch [Peter Robinson's](https://twitter.com/nullr0ute) presentation on [using Fedora for IoT](https://fosdem.org/2017/schedule/event/generic_distro_iot/). Beyond my desire to see you use Fedora, Peter makes some great points about how the challenges that the IoT space is trying to solve have often already been solved in traditional Linux distributions. Using these solutions becomes much easier now that options like [Fedora Atomic](https://getfedora.org/en/atomic/) have become available.

Fedora Atomic's OSTree-based atomic updates provide a method of the safe upgrade of IoT devices which can easily rollback to a previous state if they fail a health check. This should prevent most causes of "bricked" devices.
Additionally the work being done for containers and Atomic have already resulted in reduced install sizes that are only getting smaller. This makes these use of a robust mainline platform that will ease development more tenable on the deployment and operations sides.

Day two of my FOSDEM adventure was shorter, but just as exciting. I woke up with, as a friend would put it, "the tireds."
This caused me to sleep in and try to recover my strength. In the afternoon I hung out at the [Fedora booth](https://twitter.com/fedora/status/827829638588153857) with some of our fantastic ambassadors.
It was great to hear what people were asking about.

I also took the opportunity to do what my colleague [Rich Bowen](https://twitter.com/rbowen) would call "ambush interviews." I used an audio recorder to record some brief interviews with people about Fedora and FOSDEM.
Assuming I didn't make any horrible mistakes and can figure out how to use Audacity, I hope to post them soon.

Overall, FOSDEM remains an important place to network with the Open Source community. To paraphrase one of my interviewees, at FOSDEM you don't just discuss Open Source, you discuss it with the actual upstream developers.
A colleague added to this with an interesting observation, the "hallway track" at FOSDEM makes it compelling enough to come to on its own.

It seems that those of us who are more experienced in Open Source come for that and the newer members of our growing community find the tracks live (as opposed to recorded the way I will enjoy most of them) to be a huge value because they can identify the folks they want to network with in the future.

While it is crowded, chaotic and a masterful bit of magical orchestration to pull off, I strongly encourage you to consider adding FOSDEM to your travel schedule next year. And since you're already going to Brussels, plan to drop in on [DevConf.cz](https://www.devconf.cz) the fantastic developer conference in my hometown of Brno, Czech Republic.
Let me know you're coming and we can grab a beverage of your choice together!
