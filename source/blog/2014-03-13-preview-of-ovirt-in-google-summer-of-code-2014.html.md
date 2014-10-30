---
author: bkp
comments: true
layout: post
title: Preview of oVirt in Google Summer of Code 2014
date: 2014-03-13 19:19 UTC
categories:
- Blog
tags:
- oVirt
- Google Summer of Code
- GSoC
- Gerrit
---
Summer, for the most part, is a good time for change. 

We take holidays, start new projects, get married, look for new things... the weather is warm and it drives us to explore the world around us just a little bit more.

Students are already in exploration mode, learning all they can to prepare for a world that seems to need new skills each passing day. Increasingly, I see my students taking advantage of their summers not only to catch their breath and relax a little, but also to seek out new challenges and opportunities that will get them ahead of the curve.

READMORE

One such opportunity is Google's annual [Summer of Code](http://www.google-melange.com/gsoc/homepage/google/gsoc2014) (GSoC) program, which works to the advantage of students (giving them opportunities to demonstrate their coding skills to potential employers while receiving a nice little stipend) and program participants (who get the benefit of someone working on focused projects that might have otherwise gone undone). GSoC is pretty much a win-win for everyone involved.

## oVirt and Summer of Code

The team at [oVirt](http://www.ovirt.org) is excited to be involved for the first time in GSoC this year. Our lead mentors Federico Simoncelli and Doron Fediuck put in a great effort to propose oVirt as a GSoC-worthy project, and to get ideas together for students to implement.

Right now, oVirt has four ideas for students to join, though that is by no means the limit; applying students can propose any idea that would fit within our mandate of creating a world-class datacenter virtualization environment or better the open source ecosystem as a whole.

For instance, one of the projects we'd love for someone to take on is integrating oVirt virtual disks with libvirt. oVirt supports many advanced features and is looking to enhance these by fine-grained control of virtual disk capabilities such as 'discard', 'eio' behavior, 'cache' type, and more. When completed, this project, mentored by Simoncelli, would enable users to configure the mentioned advanced disk capabilities per storage, virtual machine, and disk.

Not all of our ideas are focused only on oVirt. Mentor Maor Lipchuk has put forth an idea that will provide a huge benefit to a lot of open source and free software projects. 

Currently, when a contributor wants to contribute a code to a FLOSS project, she must get the acknowledgment of the project maintainers for her code. When the review process is done by [Gerrit] (https://code.google.com/p/gerrit/), a web-based code review and project management for Git-based projects, the contributor will submit the patch in Gerrit. The contributor needs to add reviewers so the proper review process will take place, but sometimes she can't be sure which reviewers will be best to add for the patch.

The contributor can use the blame function within Gerrit to determine which contributor changed most of the module recently, or any other method she thinks is best. The GSoC project Lipchuck is mentoring will add an option to git-review for adding a potential reviewer to the contributor's patch. After the contributor submits her patch, she would be able to use git-review to add a potential reviewer to her contributed code, discovered by a specific method (blame on changed code, blame on module, etc.).

## More on Getting Involved

These are a couple of ideas floated out for this year's GSoC from oVirt. Other ideas, as well as the guidelines for applicants, can be found on [oVirt's Summer of Code page](http://www.ovirt.org/Summer_of_Code). Visit that site and the main [GSoC page](http://www.google-melange.com/gsoc/homepage/google/gsoc2014) for more information and to sign up. Don't procrastinate: the student application deadline is March 21 at 19:00 UTC.
