---
title: Guidelines For Announcing Software Releases
date: 2015-12-14 15:44 UTC
author: bkp
tags: community, open source, software release
comments: true
published: true
---
One of the major functions of any open source project is releasing software, with the goal of reaching as many users as possible. To help our projects succeed, we need to ensure that we get the message out in a timely fashion, to the widest relevant audience, and with the right information.

With that in mind, we've crafted a set of guidelines for coordinating release announcements to ensure that your excellent work doesn't get lost in the shuffle. Remember that these are only guides; your own community practices can be different.

READMORE

## General Guidelines

* Do not set any release date for a Friday or significant holiday. The ideal release date for maximum coverage is Tuesday.
* If at all possible, coordinate major releases with relevant conferences and events.
* Tailor release announcements and blogs to encourage use of software as well as contributions to project.
* Talk about how a project benefits the user, explain the benefits rather than focusing on technical details.

## Track: RC and Final Release for Major Point Release *X*.0

*No less than three weeks from release date:*

  * Create a collaborative document (Etherpad, Google Doc) to include highlighted features for the release announcement, press release, and blog.

*Two weeks from release date:*

  * Generate a changelog that includes notable changes to the release that will need to be documented and included within the main changelog file.
  * Merge any relevant content from the updated changelog into the release announcement, press release, and blog.
  * Create press release and send to PR for vesting

*One week from release date:*

  * Have social media content in place for scheduled/live distribution before, during, and after release date.

*Three days from release date:*

  * Release manager, engineering lead sign off on release announcement and blog.
  * PR signs off on press release.

*Two days from release date:*

  * All final QA/smoke tests should be completed.
  * Build should be placed on appropriate servers.

*One day before release date:*

  * Relevant media outlets should be sent copy of press release.

*Day of release:*

  * Code should be made visible to outside world.
  * Release announcement, social media, and blog should be published as scheduled.
  * Press release should be posted on newswires via PR.

## Track: RC and Final Release for Point Release *X.Y*

*No less than 2 weeks from release date:*

  * Create a collaborative document (Etherpad, Google Doc) to include highlighted features for the release announcement and blog.

*One week from release date:*

  * Have social media content in place for scheduled/live distribution before, during, and after release date.
  * Generate a changelog that includes notable changes to the release that will need to be documented and included within the main changelog file.
  * Merge any relevant content from the updated changelog into the release announcement and blog.

*Two days from release date:*

  * Release manager, engineering lead sign off on release announcement and blog.
  * All final QA/smoke tests should be completed.
  * Build should be placed on appropriate servers.

*Day of release:*

  * Code should be made visible to outside world.
  * Release announcement, social media, and blog should be published.
  * Relevant media outlets should be sent copy of release announcement.

## Track: Final Release for Minor Point Release *X.Y.Z*

*No less than one week from release date:*

  * Have social media content in place for scheduled/live distribution before, during, and after release date.
  * Generate a changelog that includes notable changes to the release that will need to be documented and included within the main changelog file.
  * Merge any relevant content from the updated changelog into a release announcement.

*Two days from release date:*

  * Release manager, engineering lead sign off on release announcement.
  * All final QA/smoke tests should be completed.
  * Build should be placed on appropriate servers.

*Day of release:*

  * Release artifacts should be made visible to outside world, if they are not already. (It's okay if a release is synced to mirrors ahead of the actual release announcement.)
  * Release announcement and social media should be published.

## After All Major Releases and Significant Point Releases

  * Post-mortem follow up should be done to see what, if anything, could be done to improve the next release cycle.

## Sample Press Release/Release Announcement

Pushing out a release announcement would seem to be relatively straightforward, but in order to get the most impact from your announcement, it should be written in a way that's going to be most likely to be picked up by the media.

Here, then, is a template for a release announcement, with some guidelines. Please note, this is a guide only, and boilerplating exactly what we have here may not be effective for your project.

Be matter-of-factual about information shared in public statements. Avoid hyperbole ("the bestest project ever made!!!" and speculation ("the only project that can do this"). As tempting as it is, release announcements should not opportunities to hype your project. You *can* take the opportunity to thank your hard-working community, however; this not only gives credit where credit is due, but also emphasizes the free and open source nature of the project. Media outlets will rapidly disregard such hyperbole and possible avoid spreading the word about your release altogether.

Be clear, concise, and use facts and supportable information. This will help get your announcement more broadly disseminated.

--

Project X, the *[main purpose of project: goals, functions, governance]* project, today announced the general availability of Project X *x.y*, a community-driven *[description of project]*. This latest community release includes several new features, including *[list of newest features]*.

Developed by a global community, Project X *[a detailed paragraph of what the project is, what it does, and any other pertinent information should be included here.]*

Notable enhancements to Project X *x.y* include:

  * *[Detailed paragraph describing a first major feature]*
  * *[Detailed paragraph describing a second major feature]*
  * *[Detailed paragraph describing a third major feature]*

A complete list of Project X *x.y* features is available on the Project X community release announcement page *[URL]*. Project X *x.y [detailed description of a two or three additional features]*.

*[If possible, add a quote from a prominent community member or technical lead about the new release here.]*

### Additional Resources
  * Read more about the Project X *x.y* release highlights *[URL]*
  * Get more Project X updates on Twitter *[URL]*
  * Read more about Project X community events *[URL]*

### About Project X

Project X is *[a very detailed description of what the project is and what it can do]*.
