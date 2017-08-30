---
title: Stop Working So Hard--Scaling Open Source Community Practices
date: 2017-08-30 15:17 UTC
author: dhellman
tags: community, documentation, releases
published: true
comments: true
---

![scaling tracks](blog/scalemodel.jpg) Lately, I have been revising some of the OpenStack community’s processes to make them more sustainable. As we grew over the last 7 years to have [more than 2,000 individual contributors to the current release](http://stackalytics.com/?metric=commits), some practices that worked when they were implemented have begun causing trouble for us now that our community is changing in different ways. My goal in reviewing those practices is to find ways to eliminate the challenges.

OpenStack is developed by a collection of project teams, most of which focus on a feature-related area, such as block storage or networking. The areas where we have most needed to change intersect with all of those teams, such as release management and documentation. Although the teams responsible for those tasks have tended to be small, their members have been active and dedicated. At times that dedication has masked the near-heroic level of effort they were making to keep up with the work load.

READMORE

When someone is overloaded in a corporate environment, where tasks are assigned and the performance and workload of team members are reviewed regularly, the employee can appeal to management for help. The solution may be to hire or assign new contributors, change the project schedule, or to make a short term trade-off that incurs technical debt. However, open source projects are largely driven by volunteers, so assigning people to work on a task isn’t an option. Even in a sponsor-driven community such as OpenStack, where many contributors are being paid to work on the project overall, sponsors typically give a relatively narrow mandate for the way their contributors can spend their time. Changing the project schedule is always an option, but if there are no volunteers for a task today, there is no guarantee volunteers will appear tomorrow, so it may not help.

We must use a different approach to eliminate the need for heroic effort.

## Review Process

We have solved some of the scaling problems with the release management and documentation teams, and are planning a solution for an issue now facing the dependency management team. In the course of working with those teams, I have developed a six-step process that I use to find more sustainable approaches to scaling open source community practices.

**1. Understand History** — *Why are things they way they are today? What requirements were we trying to meet?*

Before making a major change to a process, we need to establish the original requirements and identify their sources. We also need to understand any constraints that influenced early decisions, and how long-standing processes have evolved since being created. This stage involves asking questions, examining mailing list archives, and studying existing tools.

**2. (Re)define the Problem Clearly** — *What requirements and constraints do we have now? Has the original situation changed?*

After mapping how we arrived at the current state, the next step is to re-evaluate all of those requirements and the decisions that have been made. By combining understanding of how the situation has changed with new requirements and changes to priorities, we can establish a clearer picture for how the future should look.

**3. Simplify** — *How can we streamline the process?*

With a full understanding of the problem, the next step is to simplify the approach to solving it, making processes easier for existing contributors and lowering the barrier to entry for new contributors. Simplification also means standardizing practices and eliminating special cases wherever possible.

**4. Automate** — *What work are people doing that can be done by computers?*

Naturally, automation is a key pillar for any sustainable software process. Automation is easier to achieve when there is a structure of clear, simple, and repeatable processes in place.

**5. Distribute the Load** — *Can the work be divided among more people, or spread out over time? Can it be given to someone with more of an incentive to finish it?*

Not all tasks can be fully automated. In cases where computers are inadequate, breaking work down makes it easier to recruit help because small, simple tasks can be given people who are motivated to assist because they use the output, but cannot commit to a complex or time-consuming task.

**6. Eliminate Tasks** — *Can we stop doing the work entirely now that our needs or resources have changed?*

When a task cannot be simplified, automated, or shifted to a new owner, the final option is to stop doing it. As much as we strive for perfection, [open source communities have limited resources](https://www.fordfoundation.org/library/reports-and-studies/roads-and-bridges-the-unseen-labor-behind-our-digital-infrastructure/). It is important to accept that sometimes there are things the community cannot do in a sustainable way.

## Understand History

When we needed to improve our ability to manage a large number of release artifacts due to the growth of the community, I spent two release cycles (a year) shadowing Thierry Carrez, our release manager at the time, and asking him to explain every decision he made and action he took. This sometimes made it take longer for him to do the work, but it allowed us to document the process to more easily train new members of the release team. Thierry had established a successful system; it was just difficult to scale it up as we rapidly added new projects. Without understanding the existing process fully, we might have made changes that introduced more risk or left out important steps.

## (Re)define the Problem Clearly

In early 2017, many of the technical writers who had been contributing to the documentation for installing and running OpenStack were either reassigned to other projects or laid off. While the community tried to find new employment for them so they could continue to contribute, we weren’t able to do so for everyone. This was a big blow to a small team that had been doing stellar work, tracking changes and documenting a rapidly evolving and exceptionally complex system. To address the situation, we reviewed the processes and practices of the team, but just as importantly we also rethought its underlying mission statement. We realized that there were no longer enough writers on the team for them to own all of the documentation for OpenStack, and that we would have to reverse the relationship between the documentation team and the other project teams. The new mission for the documentation team replaces the focus on writing with an emphasis on supporting other teams as they create and maintain the documentation. This support approach includes building tools and defining processes that enable other contributors to write documentation more easily.

## Simplify

The release team simplified its processes by establishing several standard [release models](https://releases.openstack.org/reference/release_models.html) for teams to follow. The models describe aspects of the release such as how version numbers are selected and the timing for producing artifacts during our regular cycle. We use the models to guide the development teams throughout the release cycle by sending reminders of the steps to complete as the final release synchronization date approaches. Having a limited number of models makes it easier for us work with more teams, since there are fewer variations in the processes they follow.

As part of its mission change, the documentation team worked with project teams to move the content from the central manuals repository into the repositories containing the application code. A key aspect of that [migration initiative](http://specs.openstack.org/openstack/docs-specs/specs/pike/os-manuals-migration.html) was to define, in advance, an organizational structure for the documentation being moved. By establishing the standard layout first, we were able to have each project team import their own content, while we worked in parallel to build a new data-driven template system for [docs.openstack.org](https://docs.openstack.org/). Rather than relying on the documentation team to add links to the site by hand for the installation, configuration, and administration guides of each component of OpenStack, anyone can now add metadata about the component to have the templates produce the appropriate links.

## Automate

OpenStack’s culture of code review is strong enough that nearly every aspect of our community intersects with the review tool. In addition to code and documentation changes, our infrastructure configuration, governance documents, and elections all rely on reviewed patches. When the release team started scaling up, we built new automation around the review system. The initial version came together quickly, but reviewing the release requests will always require some human judgement, and initially that part of the process was cumbersome.

Each of the release models we defined represents a set of rules about how and when releases would be produced and announced. At the beginning, a member of the release team checked those rules by hand. In the time since the initial automation was introduced, we have extended it to enforce strict rules and to produce a report for checking the looser guidelines. The single automated report serves the human reviewer by providing all the details necessary to apply their judgement about whether to approve the release. Having the report also makes it easier to train new team members to do those reviews because they don’t need to understand how to find the relevant information.

The documentation team embraced automation for building reference guides for OpenStack configuration options. Before the migration initiative, we had a single configuration reference guide that covered all of the services. Updating it required someone to run a tool by hand to collect a list of all of the options used by each application, then add the resulting data files to the documentation repository. As part of the recent migration project, the process was automated so that every time the documentation is built, the reference information is inserted automatically as part of the output, eliminating the separate manual steps.

## Distribute the Load

Before we instituted the release review process, the release team tagged by hand every release for every component, then created maintenance branches. We coordinated with each team to find out when they were ready for each step, making us a bottleneck in the process, as well as extremely busy around every milestone deadline. After implementing reviewable release requests, we were able to distribute the work of specifying what, and when, to release back to the project teams. This change allows them to manage their releases as needed. While many teams do still synchronize their work around the milestone dates, others choose to release as soon as features are complete or bugs are fixed. Because the developers know their software will not be used if it is not released, they have the incentive necessary to follow the new process. The release work is now spread out over time as well as being distributed between more people, making those deadlines less stressful for everyone.

Another way we reduced load on the release team was to move some of its responsibilities to another team. The Pike release of OpenStack will include over 220 separate release artifacts. Most of those represent services or libraries that must be co-installable for all-in-one deployments on a single server. Ensuring that all of those artifacts can be installed together requires us to have strict coordination of their dependency lists to avoid conflicts between versions of libraries and support services. To lighten the release team’s work load, we created a separate team focused only on the dependency list. The two teams coordinate closely, but each group is able to concentrate on a smaller set of tasks, making their jobs easier.

The documentation team went even further when distributing work they could no longer reasonably handle. After they lost several team members, they decided that it was no longer tenable for them to manage the guides for all of the OpenStack projects. Moving the content for the manuals into the git repositories with the software will allow the documentation team to concentrate on assisting teams with structure and organization, while the project teams produce and verify most of the content. Many teams are now adopting internal policies that require documentation changes to be included in patches with code changes. Over time, we expect these changes to eliminate the last minute scramble at the end of each release to test and update the guides.

While it’s appealing in many ways, shifting the responsibility for work from one team to another involves a trade-off because the new owners may have different ideas about the best way to accomplish the task or the standards that must be met. It’s necessary to balance giving advice to help the new owners understand the current process with giving up control and allowing them to change the process. A successful compromise allows the new team to have a sense of ownership of output of their work. We will have to wait to learn the full effect of this change on the OpenStack documentation, but so far the teams are finding constructive ways to collaborate.

## Eliminate Tasks

Early in OpenStack’s life, the release management team tracked the features and bugs for every team. This turned out to be some of the most time-intensive and error-prone parts of our work. When we compared the amount of work we were doing to the results and user feedback, we realized that our users did not need the level of detail we were tracking, and they could find the information they did need in other sources. There was no reason for the release team to be working so hard to predict the future, when no one was using the predictions. So, we stopped. Another group within the community, made up of product and project managers from contributing companies, started looking at broader themes and tracking what was going into the final release, not each milestone. This simpler approach met the needs of some users and contributors, and it was being done by people motivated to do the work, instead of a team with little enthusiasm for it.

The documentation team reached a similar conclusion about the architecture guide. OpenStack is a flexible system that scales from a single server to multiple data centers with thousands of servers. Deployments are complex, and choosing the best approach depends on your needs, your environment, and your equipment. While it is possible to produce basic guidelines at the community level, the economic incentives for ensuring any guidelines are up to date are stronger for a vendor or consultant who will use them in their work. Therefore, when contributions to the [Architecture Design Guide](https://docs.openstack.org/arch-design/index.html) fell off, instead of spending energy recruiting new help, the documentation team decided to deprecate the guide and stop updating it after the current release. This decision allows them to focus on aspects of the documentation that require less specialized knowledge, that are more stable over several releases, or that provide more value to more users.

## Applying These Guidelines to Dependency Management

One of the next areas where we will be applying these guidelines is by refining the way the dependency list is managed. The team that owns that list is still relatively small, and we need to reduce their burden. We started by requiring all components to use the same versions of common dependencies. However, this created a new problem.

Forcing the dependency lists in each component to be identical does not produce an accurate set of values for an individual component. Some older versions of dependencies work fine, and some of the bugs in suspect versions are not triggered in all applications. A few teams that produce components that can be run on their own, outside of a full OpenStack deployment raised this discrepancy as a special concern. Components like Swift and Cinder may not need the same version of a library that Nova or Neutron might need to operate properly, and forcing them to specify a newer version limits the configurations in which they can be deployed. To solve this problem, we decided to stop synchronizing the dependency lists.

Fortunately, in addition to the version ranges in the global dependency list, we also have a list of exact versions that our CI system uses when running test jobs. That list of constrained versions gives us a set of dependencies that can be installed together in a working configuration for all-in-one installations, without keeping the dependency lists exactly in sync.

## Conclusion

This review process gives me a framework for systematically evaluating existing practices and planned changes in order to design them to be as sustainable as possible. By replacing complex manual processes with simpler processes relying on automation, I hope to make it easier to bring new contributors into the project, and to retain the contributors we already have. Making the OpenStack community healthier over the long term will ensure we can continue building and maintaining tools for our users well into the future.

*Image courtesy of J. Rygh, under the [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/deed.en) license.*
