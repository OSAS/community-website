---
title: Open Source and the Proactive Admin
date: 2018-01-09 11:05 UTC
author: bkp
tags: open source, security, best practices
published: true
comments: true
---

![Bug](blog/redhatbug.png) If you happen to be a Linux kernel developer, then you may not be having the best week. The same might hold true if you are a Linux systems administrator. The common reasons for this are the recently announced security vulnerabilities known as Spectre and Meltdown.

If you're not familiar with what these two vulnerabilities are, they are specific attack vectors that go after a processor feature  known as speculative execution.

It's a no-kidding, all-hands-on-deck kind of problem, too. Initial reports had this being an Intel-only issue, but it turns out to be a potential open door to nearly every modern processor architecture.

READMORE

## Critical Background Information

For those of you not up to speed about Meltdown and Spectre, my colleague Jon Masters has put together an [excellent and accessible blog post](https://www.redhat.com/en/blog/what-are-meltdown-and-spectre-here%E2%80%99s-what-you-need-know) that explains speculative execution and how this feature can be exploited. There's also a [good video](https://youtu.be/syAdX44pokE) that lays out the problem succinctly. For those wondering how the fixes could potentially impact your systems' performance, Red Hat has put [an article](https://access.redhat.com/articles/3307751) out about that, too.

Obviously, this is an issue that every Linux distribution must deal with in the coming days, and there's a good round-up of articles on [LWN.net]https://lwn.net/Articles/742999/), as well as a very complete status report on the Linux kernel developers' progress in mitigating these issues from [Greg Kroah-Hartman](http://www.kroah.com/log/blog/2018/01/06/meltdown-status/).

## The Human Impact

It is not known what, if any, security, productivity, or monetary costs may arise from these vulnerabilities. So far, it is estimated that any exploits that could advantage of these holes would be difficult to execute.

Already, the toll on people can be seen. In his status report, Kroah-Hartman concludes with this matter-of-fact statement:

<blockquote>"Right now, there are a lot of very overworked, grumpy, sleepless, and just generally pissed off kernel developers working as hard as they can to resolve these issues that they themselves did not cause at all. Please be considerate of their situation right now. They need all the love and support and free supply of their favorite beverage that we can provide them to ensure that we all end up with fixed systems as soon as possible."
</blockquote>

What is also critical to note that this kind of crisis illustrates more than ever the importance of keeping systems patched. It is, sadly, a too-common occurrence in the free software ecosystem that using free-as-in-beer operating systems leads to a set-it-and-forget-it type of operation. Particularly with virtual machines, which are sometimes thought to be "safe" thanks to the hypervisor layer on which the VM is running.

Unfortunately, this "safety" is an illusion. These most recent vulnerabilities have been demonstrated to get past the hypervisor layer, so if a host system is exploited, any VM on that host could be illicitly accessed as well. And any system that's been set up and left alone is very much at risk because these fixes are so complex for *current* kernel versions, no one will have the time or energy to backport the fixes to earlier kernel versions. Once again, I will rely on Kroah-Hartman to outline the impact:

<blockquote>"If you rely on any other kernel tree other than 4.4, 4.9, or 4.14 right now, and you do not have a distribution supporting you, you are out of luck. The lack of patches to resolve the Meltdown problem is so minor compared to the hundreds of other known exploits and bugs that your kernel version currently contains. You need to worry about that more than anything else at this moment, and get your systems up to date first.

"Also, go yell at the people who forced you to run an obsoleted and insecure kernel version, they are the ones that need to learn that doing so is a totally reckless act."
</blockquote>

Running any production system on older software is not needed. The old "but that is all my app needs" reason flies out the window when dealing with the higher demands of security. Your business, your livelihood, and your piece of mind need admins at the top of their game. And patches up-to-date.

So whether its

<pre>dnf update

yum update
</pre>

or

<pre>apt-get update
</pre>

get your systems up-to-date today. Open source software is amazing stuff, but it still needs proactive operators.

*Image by Red Hat.*
