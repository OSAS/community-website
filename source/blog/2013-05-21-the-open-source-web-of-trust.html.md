---
author: jottinger
comments: true
date: 2013-05-21 08:33:59+00:00
layout: post
slug: the-open-source-web-of-trust
title: The open source web of trust
wordpress_id: 264
categories:
- Blog
tags:
- open source
- red hat
- security
---

When do you trust open source? With so many recent attacks using insecure software as a vector--thousands upon thousands of attacks--the reliance on the vigilance of others seems almost foolhardy.

Open source has an answer for the lack of security, in that the code is presumably visible to all. However, few actually read the source code of the applications they rely on; there are simply too many of them, their codebases are too large, and chances are that most people reading the source code couldn't do a proper security analysis anyway.

Doesn't this mean that open source and closed source end up being on an even playing field with respect to security? If nobody reads the source code, open or closed, where's the difference in security between the two licensed codebases?

With the aid of Josh Bressers, lead of Red Hat's Product Security Team, let's look at a process by which one can gain some reassurance concerning open source security, along with a pointed look at one more way in which Red Hat contributes to the entire Linux community.

The basic argument, in simplified straw man form, looks like this:

  * Open source is no more secure than closed source.

  * You don't review every line of open source code; you trust the projects.

  * Since you don't review every line of code, trusting your closed
    source vendor is the same as trusting an open source project.

This almost makes sense--but according to Josh, this is what actually happens:

You probably haven't reviewed the source code to your web browser (how you're reading this page). Even if you did review the code, you need to trust whomever built the source code. Up to this point, open source is on par with closed source.

If you have a closed source product, you have to trust the vendor. There's zero choice. If they make a claim, you probably can't prove them wrong. Many closed source vendors have been caught doing silly things, but security isn't trivial, and people easily forget the sins of the past.

Open source and closed source diverge when you consider the people who do review your source code. Red Hat has a number of security teams who do actually conduct source code audits. Do they catch everything? Certainly not, but they are essentially an independent third party looking at public source code. Even if you don't like what they find, you can go look and verify security for yourself. You don't have to trust the third party; you can still conduct your own analysis.

There are also other groups doing third-party security verification. That's the amplification power of open source.

All of this is what makes open source more secure. We can't lie, we can't cheat, we can't steal. The emperor is naked and knows it. More than once Red Hat has hit security issues where we wish we could have weaselled out of them, but at the end of the day, open source kept us honest.

We think open source is more secure than closed source. Every time.
