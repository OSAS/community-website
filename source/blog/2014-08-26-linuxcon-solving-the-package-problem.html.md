---
author: jzb
comments: true
layout: post
title: "LinuxCon: Solving the Package Problem"
date: 2014-08-26 15:35 UTC
tags:
- LinuxCon
- RPM
- SoftwareCollections.org
- Docker
- rpm-ostree
- OStree
- Atomic
categories:
- Blog
---

![](blog/lfsquare.jpg)
In the beginning, there were source tarballs and `make` and `make install`, and they were good. And then the distribution developers said "let there be package managers" and it was good. Lo, the users fought with dependencies, and the developers said "let there be Yum, and APT" and it was good. And then users said "but I want newer software, and multiple versions of Python, and what happens if an update breaks?" and there was a great befuddlement. 

Last week at LinuxCon, I had the opportunity to give a talk on "Solving the Package Problem." For those who attended the talk, or the generally curious, there's an embedded copy of the slides below. But I'll also try to make a quick summary of the talk here for those who weren't around or would like a version they can read.

For folks who've been working with Linux a long time, you may remember the primitive "Wild West" days of distributing software. You may recall having to build software from source because package managers didn't exist, or because the software you wanted to use simply wasn't packaged for your distribution of choice yet.

READMORE

For a long time, it was a golden age of Linux distributions: if you worked on an open source project, it was imperitive to see to it that your project was packaged for the Linux distributions. As the "center of the universe" for many users, if you weren't in Debian or Red Hat Linux (or Fedora, Ubuntu, SUSE, etc.) then it was a serious problem. For a long time, this worked pretty well, but it started to show some problems:

* Not every project has the resources to participate in every distribution to package their software.
* Packaging guidelines and certain projects/languages do not necessarily play well together. (*cough* Java *cough*)
* Some projects move much more quickly than the distributions. 
* Delivering bits is easy with RPM and Debian packages. Setting up a complex service? Not so much. 
* Legacy applications require older versions of software. Newer apps may require newer versions of libraries/languages/frameworks than are available on production systems.

Here I want to talk a bit about some of the efforts that are trying to solve some of the packaging issues, without throwing the baby out with the bathwater and still retaining the value of packaging where it is still a huge win.

## Software Collections

[Software Collections](http://softwarecollections.org) (SCLs) allow you to build, install, and use multiple versions of software on the same system &ndash; without affecting the installed system or package manager. Aimed at RPM, Software Collections let you install a newer (or older) version of software without conflicting with the installed packages. 

For example: A lot of people might like to use a different version of Perl or Python on a system, but don't want to disrupt other system tools that may be written in those languages. With Software Collections, they don't have to &ndash; you can install a different version of Perl or Python (or MySQL, or PostgreSQL, or Node.js, etc.) and simply use the Software Collections utilities (`scl enable`) to direct just one application to use those newer versions. 

Software Collections require no change to RPM, and don't touch the installed packages. Instead, alternate versions live in `/opt` and you use something like `scl enable python33 "bash"` to enable the newer version of Python *just for that application*. 

Also worth noting that SCL packages are just as easy to create as regular RPMs, and if you already have packaged your application (or whatever) as an RPM, it'll probably be fairly easy to convert those packages to SCLs. (See: [Converting a Conventional Spec File](https://access.redhat.com/documentation/en-US/Red_Hat_Developer_Toolset/1/html/Software_Collections_Guide/sect-Converting_a_Conventional_Spec_File.html).) 

Finally, I want to point out that SCLs are re-usable, in the sense that other SCLs can depend on them. So if you've packaged, say, Perl 5.12 as an SCL, someone else can create an SCL with yours as a dependency and *not* need to re-package it. 

## rpm-ostree

Another nifty tool that's been in the works for some time is `rpm-ostree`, an application that was developed by Colin Walters to help install multiple UNIX-like OSes (*e.g.* Fedora Rawhide and Fedora 20) on a system. Or "git for operating system binaries" is another way to describe it.

Basically, one of the huge problems with RPM and Debian packages is they're meant to go **one way** and backing out an update is, er, challenging at best. 

This is solved by rpm-ostree allowing "atomic" updates that are reversable. That is, an update to the system is shipped as a "tree" and an update either completes or doesn't. And if an update breaks something, you can use `rpm-ostree rollback` to move your system back to a prior, known-good, state.

As the name implies, rpm-ostree makes use of RPMs to build the system &ndash; so the same RPMs that are used for a traditional compose to create an ISO image or whatever can be used to create an rpm-ostree "tree." 

This is being used by [Project Atomic](http://projectatomic.io), for instance, to help deliver an immutable system with atomic updates to host Docker containers.

## Docker

Docker has gotten *just* a wee bit of press over the last few months, so I'm not going to spend too much time on Docker here. However, I'll point out that Docker containers solve a **ton** of problems that developers have with shipping their packages. 

* Docker is application-centric. 
* Docker containers are portable.
* Docker containers support versioning.
* Components can be re-used.
* Allows you to supply a container as a ready-to-run service, rather than half-configured packages.

In short, Docker containers go well beyond the scope of traditional packages to actually letting developers ship fully-realized applications. 

It's also worth pointing out, though, that Docker containers don't obviate traditional packages. You're still going to want packages, SCLs, and such to **build** your containers. 

## Thoughts, Comments, Flames?

If you have feedback on the talk from LinuxCon, or this piece, please leave a comment &ndash; or reach out to me on Twitter at [@jzb](https://twitter.com/jzb)!

<iframe src="//www.slideshare.net/slideshow/embed_code/38373267?rel=0" width="512" height="421" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/jzb/solving-the-package-problem" title="Solving the Package Problem" target="_blank">Solving the Package Problem</a> </strong> from <strong><a href="http://www.slideshare.net/jzb" target="_blank">Joe Brockmeier</a></strong> </div>
