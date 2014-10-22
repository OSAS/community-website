---
author: rbowen
comments: true
layout: post
title: "Upstream Podcast: Episode 10 - Rich Bowen with Eoghan Glynn on OpenStack Juno"
date: 2014-07-03 19:14 UTC
tags:
- OpenStack
- Juno
- RDO
- Ceilometer
categories:
- Blog
---
![](blog/upstream-mic.jpg)
In this episode of *Upstream*, Rich Bowen shares a recording of Eoghan Glynn discussing the Ceilometer project for the OpenStack Juno release. It's a bit longer than the usual *Upstream* episode, but contains a **lot** of great information on Ceilometer for the Juno release.

<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/157172856&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"></iframe>

You can also [grab the MP3 directly on Jellycast](http://upstream.jellycast.com/files/audio/Ceilometer_Juno.mp3). 

If you’d like to keep up with the Upstream podcast, keep an eye on this [blog](/), our [@redhatopen Twitter feed](https://twitter.com/redhatopen), [Facebook page](https://www.facebook.com/redhatopen), and [RSS Feed](http://upstream.jellycast.com/podcast/feed/2).

Have feedback? Want to guest on the show? Shout out to [@jzb](http://twitter.com/jzb) on Twitter.

##Upstream Archives

* Upstream: Episode 9. [Upstream Podcast Episode 9: Rich Bowen Interviews Contributors at OpenStack Summit](/blog/2014/06/upstream-podcast-episode-9-rich-bowen-interviews-contributors-at-openstack-summit/)([MP3](http://upstream.jellycast.com/files/audio/2014-06-17-Rich-Bowen-OpenStack.mp3))
* Upstream: Episode 8. [Talking with Patrick McGarry from the Ceph Team](/blog/2014/06/upstream-podcast-episode-8-patrick-mcgarry-talks-about-ceph-and-open-sourcing-calamari/)([MP3](http://upstream.jellycast.com/files/audio/2014-06-03-Patrick.mp3))
* Upstream: Episode 7. [Langdon White on SoftwareCollections.org](/blog/2014/05/upstream-podcast-episode-7-langon-white-on-softwarecollections-org/) ([MP3](http://upstream.jellycast.com/files/audio/2014-05-15-Langdon-White-Upstream.mp3))
* Upstream: Episode 6. [Marvin Humphrey of the Apache Software Foundation Talks Apache](/blog/2014/05/upstream-podcast-episode-6/) ([MP3](http://upstream.jellycast.com/files/audio/2014-05-08-Marvin_Humphrey-Upstream.mp3))
* Upstream: Episode 5. [Colin Walters on Project Atomic and rpm-ostree](/blog/2014/04/upstream-podcast-episode-5-colin-walters-on-project-atomic-and-rpm-ostree/) ([MP3](http://upstream.jellycast.com/files/audio/2014-04-15-Colin.mp3))
* Upstream: Episode 4. [Shane Curcuru on Brand Management and Trademarks ](/blog/2014/04/upstream-podcast-4/) ([MP3](http://upstream.jellycast.com/files/audio/2014-04-08-Shane.mp3))
* Upstream: Episode 3. [Ohad Levy Discusses Foreman and OpenStack ](/blog/2014/04/upstream-podcast-episode-3-ohad-levy-discusses-foreman-and-openstack/) ([MP3](http://upstream.jellycast.com/files/audio/Ohad_Levy_Podcast.mp3))
* Upstream: Episode 2. [Bradley Kuhn on the Software Freedom Conservancy](/blog/2014/03/upstream-episode-2-interview-with-bradley-kuhn/) ([MP3](http://upstream.jellycast.com/files/audio/2014-03-24-Bradley-Kuhn.mp3))
* Upstream: Episode 1. [Leslie Hawthorn on Why Checking Your Privilege is Good For You](/blog/2014/03/new-podcast-and-interview-with-leslie-hawthorn/) ([MP3](http://upstream.jellycast.com/files/audio/2014-03-06-Leslie-Hawthorn.mp3))

Find a full transcript of the episode below.

READMORE

## Ceilometer Juno Roadmap 

*I'm Rich Bowen, and I work on the [RDO](http://openstack.redhat.com/) community distribution of OpenStack at Red Hat.*

*At the OpenStack developer summit, each project discusses their plans for the coming release cycle. In Atlanta, Ceilometer met to decide what they'd be working on, and, in this recording, Eoghan Glynn gives us the highlights of that and discusses the progress so far toward the Juno release.*

I'm going to do the [Ceilometer](http://docs.openstack.org/developer/ceilometer/) recap - what we agreed at [Summit](https://www.openstack.org/summit/), and what our plans are for the [Juno](https://wiki.openstack.org/wiki/Juno_Release_Schedule) cycle.

First of all we want to talk about the top-level themes on the Juno cycle that have been agreed to on the Ceilometer project. Some changes in how we do things upstream, feeding from some new team culture. And also I'm going to go through a number of detailed work items at the level of granularity of individual blueprints, or groups of tightly related blueprints.

## The top level themes for Juno

This is basically what we're moving towards.

Our highest priority, and the thing that we have to show front-loaded progress towards for the Juno 1 milestone is to address the requirements that were mandated by the technical committee as a result of the recent gap analysis. Each of the already integrated projects is being brought through a retroactive gap analysis because the bar for becoming an integrated project has been raised, and it's only fair that the projects that are already integrated and have already passed the graduation test against the lower bar should have the same standard applied. So the outcome of that exercise is a number of requirements that each project has to address and Ceilometer has got a number of things on our plate resulting from that, which I'll talk about.

Then, we have some known architectural issues in Ceilometer that have been hampering the project from close to the outset. What we're planning to do on this cycle is make a concerted effort towards paying down that debt. I'm going to speak about that in detail.
  
I also want to seed some new culture in how the upstream team goes about its work, and how that team dynamic plays out. I'll speak to that briefly.

Lastly, I've got a stretch goal in mind, which is to figure out a relationship with the [StackTach](https://github.com/rackerlabs/stacktach) project, which is plowing a similar furrow. It's largely populated by people from Rackspace including Sandy Walsh and Monsyne Dragon, but also includes some new recruits from the IBM and HP communities.

In an ideal world, Ceilometer and StackTach would be ... our divergence would be stopped, and we'd figure out how to coexist peaceibly, and my ultimate goal for that would be to take as much of the useful StackTach functionality and to bring it in under the elementary umbrella within OpenStack.

## Technical committee mandated requirements

There's about five of them in total. Some of them are administrative, and some of them are more gnarly technical challenges.

The project mission statement, and the notion of whether Ceilometer's mission should be purely limited to metering, or should extend to a more generic measurement role within the OpenStack ecosystem has been a subject of repeated discussion. One thing we need to do is get agreement from the technical committee on a mission statement. So I've been doing a fair amount of work submitting on that. The review is almost about to land, thankfully, after many trips to and fro. The goal there was to keep it pretty high level and pretty open ended so that we're not fencing ourselves into a corner, such that we don't have the ability to expand the mandate over time. 

Moving on to more gnarly technical challenges: The original canonical storage driver in Ceilometer was based on MongoDB. There are potential issues around licensing there, that MongoDB is AGPL licensed. The MongoDB client, pymongo, is Apache licensed, but some people are fairly conservative about these things, and imagine that there may be some viral infection of pymongo by the licensing of the server side. One of the requirements on Ceilometer from the get-go was to have a viable SQLAlchemy based driver, and also some distro issue around Ubuntu Precise, have kind of required us to default to SQLAlchemy in the gate.  And that causes a lot of issues, because the SQLAlchemy driver we've had up to now has not been performant, and has not been viable, even running within the gate, at that level of scale. So we need to fix that. We've made progress toward that, and I'll talk about that in bit more detail in a second.

As a result of that prior item, and the SQLAlchemy driver having degraded performance, our Tempest coverage has been largely stalled.  We've had a bunch of patches outstanding for Tempest that couldn't land because the performance issues in the gate meant that they couldn't be approved. We need to land those. Now that we're in a position that many of our performance issues have been solved over the last week or two, or at least greatly improved, they've been complicated by the notion of branchless Tempest, where the same version of Tempest is running against stable Icehouse and master Juno, and we've been working with the QA team on figuring out a way to make it discoverable, which of those two variants Tempest is running against, and whether certain tests should be skipped in the stable Icehouse case, because of the performance issues in the SQLAlchemy driver, and certain other tests can be enabled in the Juno case, because of the progress that we've made towards addressing those performance issues, in a way that isn't really backportable to stable Icehouse. We're making good progress on that already.

On the documentation side, we have developer oriented documentation which is in relatively good shape, but a gap was identified around user and operator oriented documentation, so we're working on addressing that, partially by repurposing the RDO getting started guide that I wrote a while back, recasting that in distro-agnostic form, and taking the guts of that and putting it into the administrator manual.

And lastly, we've got a new requirement for integrated projects that is being pushed by Sean Dague, and this is the idea that projects will be required to participate in the Grenade test harness, which is all around making assertions around the upgradeability of individual projects. Clearly we need to participate in that as it currently stands, but we also have a stretch goal that we've set ourselves to extend the capabilities of the Javeline portion of Grenade, which is the piece of Grenade that makes assertions around the survivability of individual resources. So it spins up things like a number of instances, and does the upgrade, shuts down all the services, starts them all up again, and makes assertions around the survivability of those resources across the upgrade. We want to have the capability of allowing fine-grained project-specific assertions to be made around those surviving resources.  In the case of Ceilometer, it would be making statistics queries where the time duration for the query spans the time period of the old, through the upgrade, and into the new.

## Architectural debt - Resource metadata storage

Ceilometer had a architechtural debt, in terms of some missteps that were made, architecturally, at the design level, quite early in the project's history, and that has hampered our performance and our scaling capability ever since. At this point, it's universally recognized that the approach that was originally taken towards snapshotting resource metadata for each data point was a major mistake.

Basically what occurs there is that a subset of the resource metadata - so this might be metadata relating to an instance, for example, if the data point relates to a measurement taken on an instance, and would involve things like the UUID for the image that the instance was spun up from, the flavor of the instance, some selection of the user metadata set on the instance, the current state of the instance, that kind of stuff. It turns out that most of this resource metadata is highly static, very rarely changes, and when it does change, for example when an instance is resized, or suspended and resumed - something of that ilk, it does so in very well defined ways that can actually be determined, and simply by persisting those few and far between events that signal a state change, as opposed to constantly recording this fairly heavy weight and highly repititious resource metadata for each individual data point. What we want to move towards is reimagining Ceilometer as more like a time-series data-as-a-service service, and that's what most of the technical discussion at Atlanta was focused on.

This new approach is prototyped in a project that Julien Danjou has spun up on StackForge called [Gnocchi](https://wiki.openstack.org/wiki/Gnocchi).  A bit of an Italian food theme going on there. And the idea there is to store the actual sample data - the individual data points - in a form that's shorn of the resource metadata, and instead splits off the resource metadata into a completely separate store. That means that these data can be stored in a much more lightweight form, and it's much more reasonable to do either preaggregation and rollup of the incoming data in the injection pipeline.

The reason why the resource metadata was previously kept around for each and every data point was so that the resource state timeline could be reconstructed. The idea here is that we'll do that in a much more efficient way by persisting the individual events, and allowing the state timeline to be reconstructed from the fossil record that's effectively encapsulated in a very small number of events, as opposed to a large number of copies of the resource metadata associated with each fine-grained data point.

That will put us in a much better position for scaling, and for our write and query performance going forward. There are some gnarly migration issues that we still need to figure out, and we have a mid-cycle meetup that's slated for early July in Paris, and that's going to be one of the major topics on the agenda. At that point, significant progress will have been made on the time-series data-as-a-service implementation, and we can push our minds forward towards migrating existing stores and so on so we've got that issue addressed as well.  

That's the ping-down of our known architectural debt which we're eager to address.

## Changes in the upstream team dynamic

One thing I've changed is to move to a much more collaborative model of decision making in the core team. Rather than things being presented by the PTL as a fait accompli. For example, the scheduling for the Juno design summit was all done in a collaborative way across all of the Ceilometer core. Similiarly, the process of blueprint approval and targeting is all being done collaboratively, particularly in terms of blueprint review. The process that we've adopted there is very similar to one that's been adopted across a large number of projects following Nova's lead. This is the idea of having a separate specs repository for detailed specs that are then linked to boilerplate blueprints in Launchpad, and that those spec proposals then go through a detailed review cycle, and that they also force people to consider a priori various aspects of a blueprint that have traditionally been put on the back burner and left to the last moment to consider. Things like how is this thing going to be tested in Tempest, and how is this going to impact the documentation. How is this going to impact on downstream distro oriented packagers, or operators. Are there any knock-on impacts on the CLI, or on the client library. This spec process has been used successfully on the Nova project for a while, and is being adopted kind of widely at this stage by a good number of other projects. I think it both forces deeper thought to be put to those issues that were often brushed over when blueprints were filed, and it also makes the process of approving blueprints a much more collaborative enterprise, rather than the PTLs doing the button-pressing in Launchpad.  

The feature proposal freeze was another good practice that was adopted in previous cycles by other projects, and this is the idea that two weeks, approximately, in advance of the third milestone in the development cycle, a deadline is imposed such that any feature that is expected to land by the end of that cycle much have had an initial patch set proposed. And if you don't make that feature proposal freeze - it doesn't have to land, it just has to be proposed - you're out of the game as far as getting it into this cycle. The idea here is to be realistic about the amount of time it takes to shepherd featureful patches, large complex patches that either introduce new features or might make non-trivial changes to the existing logic - the amount of time, realistically speaking, that it takes to shepherd these through the review process, given that a lot of the other cores are heads-down getting their own features completed, basically means that this window is required, rather than going down to the wire, which is what we've ended up doing in some previous release cycles, and then ended up going cap in hand to the release manager begging a feature freeze exception.  This approach is a better one, and we're hoping to see that within the contributor community within Ceilometer for Juno.

Another thing I wanted to avoid this time around was this thing where we have a summit, and we talk about a lot of things, and then some of those things reach the light of day and actual code appears, and others of those things do not result in actual work being done. I want to keep the momentum up, and ensure that the issues that we didn't have time to address, or issues that have been pushed out of the discussions that we had at our main summit can be reassessed, and towards that we're having a mid-cycle meetup from the 2nd to the 4th of July, and we're going to attack those issues. That's a practice that's been widely used on other projects. Nova had one on the last cycle. TripleO and Tuskar had a joint one. It's quite widely used and it's universally acknowledged as being a positive thing. It allows reassessment and retargeting.

We had some really good discussions with the QA team in Atlanta, and certain aspects of their unhappiness with Ceilometer were aired, which is good and healthy, and we figured out some better models going forward. Much more direct engagement with the QA team. And this is important given that one of our major goals is to land a bunch of Tempest and Grenade test coverage.

And lastly I want to have a much more proactive blueprint to resource matchmaking process going on in the background, rather than just letting some kind of emergent order emerge from the chaos. Clearly people have different requirements on their time, and the amount of bandwidth they have available waxes and wanes over a release cycle. I want to be much more proactive in rebalancing when required to ensure that stuff doesn't fall through the cracks.

## Detailed work items

These are of the order of granularity of individual blueprints, or a group of related blueprints. 

First off, the time series data as a service work. This is the stuff that's being prototyped in the Gnocchi project, currently on Stackforge, but it's there to enable rapid iteration, and innovation to occur in the initial phases, but the intention is to take that in under the Ceilometer repo during this cycle. The initial canonical implementation ... a lot of progress has been made on this, and it's based on the Pandas analytics library. This is a python library for doing analytics which is very widely used and widely proven, and it uses Swift as the object storage backend. Just like Ceilometer, the idea is that the storage logic is pluggable, and the notion is that there will be additional drivers targeted at metric-oriented databases. The candidates that got on our radar are InfluxDB, which is a new Open Source metrics-oriented database which is a fork of Errplane, and it's implemented in the Go programming language.  It provides a lot of useful notions including a simple SQL syntax for expressing queries. It's got a lot expressive power in things like analytics that are non-trivial aggregation functions such as percentiles, and quartiles, and so on. That's quite useful in terms of some good discussions with the main committers behind InfluxDB. Another possibility we're looking at called OpenTSDB, which is another Open Source metric oriented database which is quite interesting. The idea is that this time series data service as a service element of Ceilometer will be layered over a canonical driver plus possibly some well-proven metrics-oriented databases.
  
Another work item is the integration of these new ... this time series data as a service will eventually form the core of the Ceilometer v3 API, and we will need to integrate this with our current metrics pipeline and alarm evaluation logic, such that those element of the Ceilometer core are now dependent on the new V3 API. And also the work of the OPW - that's the Outreach Program for Women - intern that I'm mentoring will be rebased on this. The original idea I pitched for that was based on extending the V2 API to allow for period-spanning statistics, such as moving averages and exponential smoothing, and more involved forecasting algorithems to be implemented within the scope of the V2 API, but it makes a lot more sense, in a forward-looking aspect, for that work to be rebased on the V3 work instead. So that's what we're working towards.

Second big work item is around SQLAlchemy viability. I explained earlier the historical aspect of this, that it was a mandated requirement that we have a viable SQLAlchemy driver. In production we'd invisage MongoDB as the one that's actually used, and that's all that's supported for RHELOSP, and [RDO](http://openstack.redhat.com), and lots of other OpenStack distros like the Mirantis distribution supports Mongo. But SQLAlchemy is required, and we need it to be something that's viable, and at least runnable in the gate, and runnable in small deployments and proof of concept style scale. We've made a lot of concrete progress on this already. Removing the long-deprecated V1 API allowed us to greatly simplify the schema and remove a bunch of code paths that were no longer required. We've rationalized the schema even further, and worked on simplifying the "upsert" logic. This is the "either update it if it's already there, or insert it if it's not" logic, which was poorly implemented the first time around, and let to a storm of retries when rollback occurred.  That's been greatly improved, and it's got to the stage where the logic that's there is at a level of viability that will allow us to run in the gate, and we're in discussions with the QA folks on making that happen.

We also have the original author of SQLAlchemy has just joined Red Hat this week - Mike Bayer - I've involved him in that as well, and we'll be having a call with him tomorrow, and he's already given a fair bit of advice on Ceilometer and SQLAlchemy, so good progress there.

SNMP improvements. This is quite important for TripleO and Tuskar. What we want to do is move to a declarative model such that you don't have to write new pollsters, which are the elements of Python in Ceilometer which are responsible for acquiring data in a polling fashion. We don't want to have to write those for every single new SNMP metric that is required. We want to do that in a more declarative config-driven way. We want to reduce the level of chattiness with the SNMP daemon, such that we use the bulk command rather than the individual command for each metric that we require.

And a new idea that's just being kicked around - I'm not sure whether we're going to do this, but we've had some discussion about it. The idea was to use LM sensors to acquire sensor data about hardware oriented things like temperature and fan speed and so on. To do that via SNMP as opposed to grabbing it through Ironic, which owns the polling cycle for IPMI. So that's an idea we need to dig into.

## Agent single point of failure

This is an element of Ceilometer that had a scalability issue so that there was no way of doing distributed work partitioning - you could only run one central agent without duplication. We've got a plan in place to leverage the work that's been done around task flow, and also [Tooz](https://github.com/stackforge/tooz). Tooz is a toolkit that provides for distributed coordination protocol. That would be things like Zookeeper. The idea is to leverage that to partition the work that we need the central agent to do over multiple horizontally scaled instances of the agent. This is particularly important going forward because the sensor agent has now taken on responsibility for SNMP polling, and we don't just want a single process taking care of that.

We're going to do something similar to partition the alarm evaluator.  That already has its own mechanism for doing work partitioning, around dividing up the sets of alarms that need to be evaluated, but we want to extent that so that it uses the same mechanism as is used for the sensor agent.

The events completion. We want to be able to use the persisted events as a way of reconstructing the state timeline of individual resources, as opposed to the much more heavy weight approach of snapshotting resource metadata for each data point. We've got event persistence that was contributed by StackTach folks over the last cycle, but we've only got it for SQLAlchemy, and we need to be able to that for the other storage drivers, and there's work in motion for Mongo and HBase.
  
## QA

We want to beef up our Tempest and Grenade coverage. I also want to backport our Icehouse Tempest coverage to Havana. The reason for that is that the DefCore capabilities are being defined on the basis of the Tempest coverage that's available for Havana, of which there is none for Ceilometer as yet.

IPMI sensor data - we want to be able to grab that somehow. One thing that was agreed and discussed at Summit with the Ironic folks was that they would own the polling cycle for the IPMI sensors, and that they would emit notifications over AMQP that Ceilometer would then consume.
  
And then a bunch of miscellaneous requirements such as metering and networking services, complex queries for statistics. Per-tenant pipeline configs - this is the ability to decide what metrics are being gathered on a per-tenant basis, as opposed to globally. 

And lastly, some ideas around optimized alarm evaluation to take advantage of the nature of statistics queries that are emitted by the alarm evaluator, which take the form of advancing overlapping time periods. Because the same time period is being queried for repeatedly, with just a small length of time falling off the end of duration and a small amount of time being acquired at the start of the duration, as the time window slides through time, it's possible to optimize that query in certain circumstances, and lessen the amount of load on the underlying database.
