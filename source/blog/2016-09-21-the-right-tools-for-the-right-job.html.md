---
title: The Right Tools for the Right Job
date: 2016-09-21 11:01 UTC
author: bkp
tags: open source, development, education
published: true
comments: true
---
![git Logo](blog/git_logo.png) Much of what we do on the Open Source and Standards team is focused on community growth, on the premise that a growing community, by and large, is a healthy one.

Growing a community is never as simple as throwing out your code for the world to see and letting your code's awesomeness speak for itself. You can build the coolest application on the planet and still have problems getting people to help you with it, even if you have a sparkling personality.

We've talked about this before, when [discussing onboarding](http://community.redhat.com/blog/2016/05/open-check-but-is-your-community-growing/). Onboarding is what we call the process used to get people into a community. That process can take many forms, and there can be more than one path into your community, but the key thing is having a process. Otherwise, you can have a project where you build it and no one comes.

READMORE

The biggest enemy to onboarding is not a lack of advocacy or marketing. Getting the word out certainly helps, but the biggest obstacle to community growth is friction. Friction can take many forms, but there are some predictable ways it shows up:

* A lack of description of the project and its goals
* No easy way to access the project's output
* No clear path to contributing to the project

In other words, you have to make the project easy to understand, easy to use, and easy to change.

This is a core set of principles that can be applied to many aspects of an open source software project. One easy way to apply these principles is on a project's web site.

* Is it clear what the project and its software does?
* How easy is it for people to get their hands on the software to start using it?
* Is it simple for interested parties to contribute to your project?

On the surface, these requirements seem straightforward enough... "Project X enables you to balance your checking account and order pizza at the same time," here is the download link to Project X, and here is the link to the code repositories. Add some cool logos, and voil&agrave;! Done!

Well, not exactly. Setting up a web presence in this manner does meet the core onboarding principles&mdash;but an assumption is being made that highlights another potential obstacle, one that might be even larger than just getting through this initial introduction step. When you give them a link to your source code, you cannot assume they will have the tools and the knowledge to access and properly contribute to that source code.

It is a common mistake that a lot of people can make: if a developer is smart enough to code, then surely that developer is capable of using distributed version control tools like git or Mercurial, or continuous integration tools like Jenkins or Travis. The reality is, that's not always the case.

A recent conversation I had with Gina Likins from out University Outreach team highlighted this fallacy. In her many conversations with students and up-and-coming developers, she has learned that coding was not the biggest obstacle to working with open source projects. Figuring out tools like git and working with repository sites like GitHib or GitLab is sometimes a bigger problem. This make sense if you step back and think about it: if a student is working in a classroom environment as a solitary coder being evaluated on their own code, then opportunities to work with version control and continuous integration tools simply won't come up that often.

This is not a universal problem, of course. Some developers do learn how to use the toolchains common in open source development. It's not like there isn't a plethora of howtos out there on the internet detailing how these tools work. Between reading articles and asking my peers, that's pretty much how *I* learned to use git, and I am not even a developer.

Even if a coder rolls in with full toolchain knowledge, though, that's not the end of the story. How do you use the toolchain? Does your project use pull requests? Who are the maintainers who approve code? What resources (human and archival) can developers turn to when they get stuck? Your project may have a lot of institutional knowledge that you and existing project members may take for granted. Such knowledge can be a definite barrier to entry to any project.

Every project should be able to presume a general level of knowledge when inviting contributors on board. You should not have to teach anyone how to write code. Try not to assume that the toolchains your project uses are universally understood. Add links to good tutorials on basic toolchain use. And *never* assume that the Way You've Always Done Things is common knowledge. Spell out your procedures and make sure your project's best resources are well documented.

Onboarding will not only make it easier for new contributors to join your community, but it may also help you see gaps in your existing processes and make your project even better.
