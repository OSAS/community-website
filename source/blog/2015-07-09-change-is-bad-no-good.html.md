---
title: Change Is Bad--No, Good!
author: bkp
date: 2015-07-09 18:33 UTC
tags: fedora
comments: true
published: true
---
![Fedora logo](blog/fedora-logo.png) I am a fairly agnostic person when it comes to Linux distributions. My personal philosophy is, as long as it works and has little pain associated with it, then that's the distro for me. In the past, that meant using the likes of Ubuntu, Linux Mint, and openSUSE, to name a few, and I have gone back and forth between GNOME and KDE more times than I can count.

Since coming to Red Hat, naturally I have gravitated to [Fedora](https://getfedora.org/) (though I have a CentOS server humming along for oVirt demos). Right now, I'm using Fedora 22, and thus far it's been a pretty smooth run--except for one really irksome thing that is still catching me out nearly every single time:

The change from Yum to DNF.

READMORE

Don't get me wrong; the functionality and what seems to be the superior dependency resolution of DNF versus Yum has not given me any problems. I like the fact that the DNF team used SUSE's libsolv as the basis of its new resolution algorithm, mostly because cross-distro pollination is one of the great strengths of the free and open source software community. 

This was not a change that was made on a whim, either, and I get that. Long have the complaints been about the undocumented API of Yum, which drove developers nuts whenever they wanted to add functionality to Yum. The adoption of Python 3 by Fedora made the change a necessity, too, since Yum was strictly a Python 2 program and DNF can work with Python 2 and 3.

So, what's my problem? I'll tell you what my problem is:

<pre>
[bproffit@indiana ~]$ sudo yum update
Yum command has been deprecated, redirecting to '/usr/bin/dnf update'.
See 'man dnf' and 'man yum2dnf' for more information.
To transfer transaction metadata from yum to DNF, run:
'dnf install python-dnf-plugins-extras-migrate && dnf-2 migrate'
</pre>

My problem is I cannot for the life of me stop typing <code>yum</code>. And it's not even as clean as the above error. Normally, when trying to do something as easy as a weekly update, the sequence will be:

<pre>[bproffit@indiana ~]$ sudo yu^H^H dnf update</pre>

And the <code>^H^H</code> is usually accompanied by some language I'd rather not share on a family blog.

I realize, of course, that this is my problem, not Fedora's. It's just been frustrating, since I don't usually have this problem switching from apt-get to yum and vice versa. The goal, then, is clear: I need to embrace change and move into the future, like I have done before. Otherwise, I would still be stuck using technology like

![SoundBlaster floppy](blog/bkp/SoundBlaster-Installation.png)

<br>or

![ASCII Zebra](blog/bkp/ASCII_ART_Zebra.jpg)

<br>and even

<audio controls="controls"><source type="audio/mpeg" src="http://community.redhat.com/images/blog/bkp/dial-up-modem-01.mp3" /></audio>

<br>
Moving forward is never easy: we have to simultaneously learn something different and let go of that which is familiar. But, especially in technology, it is something we all have to expect. The good news is that with open source projects, we can typically see the changes that are coming and be ready for them--or give our input on why such changes won't work and suggest something different.

Yes, sometimes that means that we will have to put up with the transitions. Cloud services instead of locally installed apps. Paying by device instead of by cash or credit. And the occasional change in default applications to get things done. In the perspective of where we were and where we are, maybe change isn't so bad.

