---
title: Encouraging New Contributors
author: amye
date: 2017-04-13 16:25:54 UTC
tags: community, gluster, onboarding
comments: true
published: true
---

![gluster](blog/gluster-ant.png) Open source projects survive off new contributions and new contributors, bringing new ideas and new focus to their work. A new project starts with one person or a few people putting code out for other people to use and contribute to, a successful project creates a pathway for contribution.

In Gluster, we've focused the past two years on making our infrastructure effective for contributing, and inviting more contributors into our infrastructure. Open source isn't just about opening up your code&mdash;it's about building a supporting infrastructure that invites people to contribute. For projects to be successful, the community needs to be able to participate in the governance, the documentation, the code, and even the hosting. Said another way, a healthy project can attract more diverse skillsets with more transparency.

READMORE

This is a really hard thing to do. A project can have a goal for "an open everything," but infrastructure is one of the last things that can be opened up. Usually, only a few people run the infrastructure. A certain level of trust is needed before granting a contributor access to project infrastructure&mdash;because that's where everyone consumes your project from.

However, infrastructure tools like Ansible, Chef, and Puppet have become widely adopted and changed this. It's now possible to open source project infrastructure as code, with the same levels of access as any other contributor. This makes the process visible to contributors, allowing a pathway for contribution that might not be strict project code. You're no longer tied to the problem of only a limited amount of high-level contributors who have access.

In keeping with this, here are a few things that we've learned while working on Gluster:

  * Make decisions in the open: Use public mailing lists for infrastructure-related discussion and planning. Involve the community in every part of the decision-making process. Specifically, avoid announcing decisions made in private.
  * Define infrastructure as code: Use Ansible, Puppet, or any other configuration management tool that enables contributors to drive infrastructure development. Use Jenkins Job Builder to define Jenkins jobs. Developers and the wider community can define new jobs with little overhead.
  * Define ownership of infrastructure: Define clear ownership of infrastructure with public post-mortems for failures. This transparency will help your community trust you to do your jobs.
  * Clear a path to contribution: Define a clear path for infrastructure contributions.

For now, we're working on improving our test infrastructure, but the best part about this&mdash;we're never going to be "done" with our infrastructure work, we treat it like part of the project and it's always welcome to new input as well.
