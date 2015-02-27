---
title: The Quid Pro Quo of Open Infrastructure
author: ncoghlan
date: 2015-02-26 15:42:04 UTC
tags: Red Hat, Linux, open source, open infrastructure, Docker, OpenStack, innovation,
  development
comments: true
published: true
---

The best deals are those in which both parties come out of the arrangement
substantially better off than they would have been otherwise. One of the most
significant aspects of Red Hat's business model is that it represents a
mutually beneficial deal between two overlapping groups of people: one that
sees the Red Hat model as a powerful way to turn freely available open source
software into a compelling subscriber experience, and one
that sees it as a way to turn the subscription revenue received from satisfied
customers into freely available open source software.

Neither of those groups is more important to Red Hat than the other. The
interaction and collaboration between them helped build the company into an
organization able to go head to head with much larger
competitors. I think the most interesting aspect of this business model is that
it is not inherently limited to the organizations we traditionally think of as
*software companies*, or even those we consider to be *technology companies*.
Rather, the model potentially applies to any organization that invests in
software development or customization for their own use or on behalf of
their clients.

READMORE

Generalizing the Red Hat model to other organizations in this way creates what
I call the *[quid pro quo](https://www.google.com/search?q=define:+quid+pro+quo)
of open infrastructure*. The organization commits to making its custom
infrastructure software freely available through open source licensing by
default, with secrecy requiring a clear and compelling business case. In
return, the organization's infrastructure development
employees gain experience and influence from participating in the open source
community, which can help them deliver high quality solutions tailored
specifically to their organization's needs. This is what we see with
initiatives such as the [18F Digital Services Delivery](https://18f.gsa.gov/)
group in the US, the [Government Digital Service](https://gds.blog.gov.uk/) in
the UK, and the recently announced
[Digital Transformation Office](http://www.pm.gov.au/media/2015-01-23/establishment-digital-transformation-office)
here in Australia. This quid pro quo of open infrastructure is also what we
see when large organizations, including Red Hat, are actively involved in
developing and supporting open source projects, such as the Linux kernel,
OpenStack, Docker, Python, the OpenJDK, gcc, and many, many more.


What's In It for the Organization?
----------------------------------

For organizations, adopting the
[open infrastructure model](https://enterprisersproject.com/article/2015/1/top-advantages-open-source-offers-over-proprietary-solutions)
can provide more capable and flexible internal infrastructure than may
otherwise be feasible within the organization's budget.

Granting your staff the authority to collaborate with
relevant open source communities provides your organization with a powerful
new information flow, giving you:

* a greater awareness of the infrastructure tooling landscape, including both
  commercially and community-supported open source options, along with their
  proprietary competitors;
* advice on how best to deploy particular open source infrastructure services,
  directly from the folks that created them;
* and a reality check on the sales pitches from vendors, some of whose
  interests may be more aligned with a successful sale than with building
  sustainable internal infrastructure for your organization.

Adopting the open infrastructure model also provides organizations with links
into an extensive network of industry professionals who are building
state-of-the-art infrastructure management software, and encouraging its broad
adoption. Being known as an organization that understands and
respects this model can help attract motivated talent, and collaborating on
community projects can create a valuable stream of qualified applicants.

Although the flow of expertise into an organization is one benefit of adopting
an open infrastructure, effectively communicating the organization's use cases
to the open source community can also provide significant value. Ideally, this
engagement helps ensure that the future direction of key projects remains
aligned with the organization's interests, and at a minimum, it allows the
organization to notice when their interests start to diverge from the
community's, providing time to evaluate other options.

For a software company, making this deal with staff can be a little tricky.
Although Red Hat's example shows that it can be a success,
explaining the cost of doing your own integration work instead of subscribing
to a regularly updated pre-integrated solution from a vendor takes time. For
hardware companies, service companies, non-profit organizations, educational
institutions, and governments, the deal is simpler. They want to avoid getting
into the business of selling or licensing software, so why hoard it when
committing to making software readily available under an open source license
can encourage significant operational improvements and creates a potentially
powerful recruiting tool?

What's In It for Infrastructure Development Staff?
------------------------------------------------------

This brings us to the other side of this mutually beneficial deal: what the
open infrastructure model gives software developers, system administrators,
business analysts, and other staff tasked with providing the best
organizational infrastructure under constrained budgets. This perspective
also represents my own personal point of view, as I work on one of the teams
responsible for continuously improving Red Hat's own internal infrastructure.

Understanding this
side of the deal requires appreciating the key point of Dan Pink's [insightful
presentation on motivation](https://www.youtube.com/watch?v=u6XAPnuFjJc): for
many people, there's such a thing as *having enough money*. If we're
comfortably paying rent or a mortgage, buying food and other essentials, have
money to spend on a few luxuries and to save for the future, and aren't being
grossly underpaid relative to our peers, then *more money* likely isn't the
best way to motivate us. Instead, three other motivators might work better:

* increased autonomy (acquiring more influence over how we do our work);
* increased mastery (having opportunities to get better at what we do, and
  apply that knowledge to our own benefit and that of our organization);
* and a sense of purpose (caring about the overall mission of our organization,
  and playing our part in achieving those goals).

Taking those in reverse order, mission-driven organizations can provide
employees with a clear sense of purpose. In those cases, deliberately *not*
offering top-of-market salaries may be a good filter to help attract applicants
that already believe in the organization's mission; however, even companies
that primarily rely on generous compensation packages to attract and retain
employees can still provide their infrastructure development staff with the
additional incentive of *creating better technology, the open source way*.

On the second point, organizations adopting the open infrastructure model can
give employees professional development opportunities because we get to
collaborate with leaders in infrastructure software development; we get
another path for building our careers through increased responsibility and
recognition in the community; and our employers don't have to take our work
on faith because there's public evidence of our efforts that we can collect
into a
[curated portfolio](http://www.curiousefficiency.org/pages/about.html).

The open infrastructure model also provides practical benefits that can make it
easier for us to do our jobs effectively. Because we can share our code, we can
ask better, specific questions on community mailing lists and sites such as
[Stack Overflow](http://stackoverflow.com/), submit detailed bug reports and
RFEs, and, although it's the exception rather than the rule, having our work
available publicly means that we may receive documentation improvements, bug
fixes, and even entirely new features, courtesy of other users adapting our
published software to their own needs. If we solve a
common pain point exceptionally well, we may even see our solutions become de
facto standards. Reducing barriers to entry for contributors also helps improve
the long term maintainability of that sponsored open source project.

Finally, those of us who already work in the open infrastructure model
experience the personal autonomy this model offers. When working with a
management chain that recognizes the power of this approach, we
often have more freedom to define our design and development processes than
infrastructure developers in traditional closed command-and-control
environments do. Also, our projects can't be "canceled by reorg" easily. If a
project we value personally ceases to be of interest to our current employer, we can continue maintaining it on the
side, try to commercialize it, or (if the project already has other
organizational users), find a different employer who will pay us to support the
project. Open source collaborative communities also serve as powerful
professional networks, providing insights into organizational politics and
career development opportunities, whether within particular organizations, when
moving between them, or when deciding to launch new ventures.

Creating Room to Innovate
-------------------------

Ultimately what makes the open infrastructure model work is that those of us
working in organizational infrastructure are problem solvers, and similar
problems tend to recur repeatedly in different organizations around the world.
The Internet enables us to collaborate on creating shared solutions, with
commercial open source vendors in the mix to make those solutions easy to adopt
and manage for a much wider pool of users.

The sharing model means we spend less time solving problems other people
already tackled, and affords more time for us to focus on addressing
[problems](https://beaker-project.org/) unique to our
[organizations](http://www.redhat.com/en/technologies/linux-platforms). Solving
such problems, and sharing the results, is how new waves of infrastructure
innovation begin.