---
title: "Growing a Contributor Base: Speed Matters"
author: jberkus
date: 2017-04-19 10:00:00 UTC
tags: community, contributions, documentation
comments: true
published: true
---

![racing bicyclist](/images/blog/biker_racing.png) Others have written good general information about [how to attract and retain](https://opensource.com/article/17/4/encourage-new-contributors) contributors for your open source project. Here, I'm going to focus rather narrowly on one critical factor in growing your contributor base: speed. Since it's what I'm familiar with, I'm going to write with the maintainer in mind.

The moment a new contributor posts a PR or a draft patch, a timer starts. The longer maintainers take to respond to their submission, the lower the chance that person will ever contribute to the project again. While no one has done a specific study on this that I know of, my experience is that it drops by half in a couple of days and it gets very close to zero in only a few weeks. If you're running a young project and looking to attract lots of new contributors, there may be no higher priority than dealing with first-time contributions quickly. Minutes to hours is the target here.

READMORE

You can understand this if you put yourself in the shoes of the person offering their first patch. If that person is an open source novice in general, submitting for the first time is a frightening experience, easily on a par with asking someone out on a first date. For as long as the response to their submission is undetermined, they are going to be in an anxious state. After a couple days, the new contributor will start to imagine that the radio silence is a message of rejection, and given long enough they will read rejection into any response you eventually post, or not read it at all.

The experienced open source hacker who sends something into your project for the first time has a different sort of timer. Often, this veteran is going to be interested in your project for only a short time, so it's critical to respond to their contribution before they move on to another project. If you can catch them during the week or so their attention is on you, you can get them in the habit of contributing to your project along with the others they support. If you wait until later, it may be very hard to re-engage with them.

## Two Deadlines for Contributions

This race against time and impatience has two finish lines: the time to the project's first response to the contributor, and the time until their contribution gets accepted and merged. While the first is measured in hours, and the second in days to weeks, the time to acceptance still matters if you want that contributor to keep contributing. If nothing else, few people will submit a second contribution while the first one is still pending.

Giving an initial serious response quickly is your first goal. Ideally, this response should include some general thoughts about the submission, and what your likely timeline for reviewing it is going to be. If it's a bad time&mdash;such as a submission when you're in the middle of a major release&mdash;tell them that so that they know what's going on. They'll be vastly more patient if they know why they need to be. If you're the sole maintainer on the project, this may mean that you also want to post vacation notices to your main developer list.

After that, your next goal is to get that first PR or patch merged as soon as possible. This is no small thing; chances are, a first submission will need extensive work before it's acceptable. It's good to ask the submitter to do work and revise, but you don't want them to spend too long waiting for your responses to their questions and revisions. Which means that speeding up the acceptance process is critical to growing your contributor base. Fortunately, there's tools for that.

## CI/CD and Speed

The primary methods that software projects, both community and corporate, have been using to speed up integration of patches is Continuous Integration and Continuous Delivery, abbreviated as CI/CD. The idea behind it is to automate, as much as possible, the acceptance and integration of patches and new features. Continuous Integration is about accepting PRs and patches as soon as they pass automated tests and a simple evaluation threshold. Continuous Delivery involves deploying new versions of the software whenever a new, tested, build is ready.

A lot of the focus on CI/CD has been in speeding up delivery of software to its users, but it's also very helpful in providing contributors with "immediate gratification" by seeing their patches get merged and go out quickly. This is perhaps its most valuable aspect, as the pace of contributions is often determined by the pace of acceptance. If you accept faster, you usually get new code faster.

However, CI/CD can be very hard for project leaders to implement, because their automated testing isn't comprehensive, their builds aren't fully automated, and the consequences of letting a major bug get merged into the code can be very severe. Despite a lot of lip service to the values and desirability of having a continuous code pipeline, irregular batch committer review is generally the reality, especially for smaller projects. There's also the issue that CI/CD software like Gerrit, Jenkins, and Travis can be difficult to set up in a way which supports the project's real releases.

There is, however, one area where CI/CD is easier to implement, and most projects should be doing it right now.

## Automating Documentation Contributions

There's one area where most open source projects need a lot more contributions and where acceptance of imperfect submissions carries relatively low risk: documentation. If your project is like most, you have a long list of things which have obsolete or no documentation, few documentation contributors, and not enough time for documentation review. And, unless you have a large, mature, and heavily cross-referenced documentation set, the problems caused by accepting documentation errors are smaller than those caused by not having documentation on certain features at all.

This means that, for most projects, self-serve CI/CD for documentation would be a real benefit. This is the reason why many projects adopt wikis for their documentation, since those allow for immediate editing and display. However, wikis make it difficult to structure documentation, render it in formats other than screen, or tie it to specific release versions. For these reasons and others, some projects have transitioned to building docs using CI/CD in DocBook, Sphinx, or AsciiDoc. The [OpenStack project](https://www.openstack.org/) has [led the way here](https://opensource.com/business/15/7/continuous-integration-and-continuous-delivery-documentation), and their list of requirements is valid for any project wanting to do the same. [ReadTheDocs.org](https://readthedocs.org/) enables a similar approach for many projects.

For [Atomic Host](http://www.projectatomic.io/), we have whole chapters of documentation to fill in our [new documentation project](https://github.com/projectatomic/atomic-host-docs). Given this, we're building a CI/CD pipeline for documentation which will be an experiment in acceptance. Once you have one or two documentation pull requests accepted, you will be able to approve your own doc submissions after automated testing. We want to make it as easy as possible to add text, since there's so much to fill.

We're not quite ready yet to start publishing, since we need to set up the CI/CD pipeline. Among other things, that means creating a way to do automated testing on AsciiBinder documentation (tools welcome). Our intent is to build a relatively simple AsciiBinder-and-container CI/CD pipeline for publishing our documentation to our new doc site. Look for announcements soon.

_Racing cyclist photo by Thomas Borges. [Licensed CC0](https://creativecommons.org/publicdomain/zero/1.0/)_
