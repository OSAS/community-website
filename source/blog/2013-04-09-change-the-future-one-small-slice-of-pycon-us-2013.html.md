---
author: ncoghlan
comments: true
date: 2013-04-09 15:11:37+00:00
layout: post
slug: change-the-future-one-small-slice-of-pycon-us-2013
title: 'Change the future: One small slice of PyCon US 2013'
wordpress_id: 227
categories:
- Blog
---

I'm currently kicking back in Red Hat's Mountain View office (I normally
work from the Brisbane office in Australia) after a lovely lunch with
some of the local Red Hatters, unwinding a bit and reflecting on an
absolutely amazing week at PyCon US 2013 just down the road in Santa
Clara.

For me, it started last Wednesday with the [Python Language
Summit](http://python-notes.curiousefficiency.org/en/latest/conferences/pyconus2013/20130313-language-summit.html)
, an at-least-annual-sometimes-biannual get together of the developers
of several major Python implementations, including CPython (the
reference interpreter), PyPy, Jython and IronPython. Even with a full
day, there were still a lot of interesting topics we didn't get to and
will be thrashing out on the mailing lists as usual. However, good
progress was made on a few of the more controversial items, and there
are definitely exciting developments in store for Python 3.4 (due in
early 2014, probably shortly after PyCon in Montreal if past history is
anything to go by).

Thursday was a real eye-opener for me. While I did have to duck out at
one point for a meeting with a couple of the other CPython developers,
I spent most of it helping out at the second of the [Young
Coders](https://us.pycon.org/2013/events/letslearnpython/) tutorials run
by [Katie
Cunningham](http://therealkatie.net/blog/2013/mar/19/pycon-2013-young-coders/)
and [Barbara
Shaurette](http://mechanicalgirl.com/post/young-coders-learning-python-pycon-2013/).
These tutorials were conducted using Raspberry Pi's with rented
peripherals, and the kids attending received both the Pi they were using
as well as a couple of introductory programming books.

<!-- more -->
Watching the class, and listening to Katie's and Barbara's feedback on
what they need from us in the core substantially [changed my
perspective](http://mail.python.org/pipermail/python-dev/2013-March/124872.html)
on what IDLE can (and, I think, should) become. Roger Serwy (the creator
of IdleX, a version of IDLE with various improvements) has now been
granted access to the CPython repo to streamline the process of fixing
the reference implementation, and we're working on plans to make the
behaviour of IDLE more consistent across all currently supported Python
versions (including Python 2.7). (Some aspects of this, especially
Roger's involvement, are similar to what happened years ago for Python
2.3 when Kurt B. Kaiser, the PSF's treasurer, shepherded the
reintegration of the [IDLEfork](http://idlefork.sourceforge.net/)
project and its major enhancements to IDLE back into the reference IDLE
implementation in the Python standard library).

Friday saw the start of the conference proper, with inspirational
keynotes from [Jesse
Noller](http://www.pyvideo.org/video/1848/opening-statements)(conference
chair and PSF board member) on helping to change the future by changing
the way we introduce the next generation to the computers that are now
an ever-present aspect of our lives, and from [Eben
Upton](http://www.pyvideo.org/video/1668/keynote-2) (co-founder of the
Raspberry Pi foundation), on how the Pi came to be the educational
project it is today, and some thoughts on how it might evolve into the
future.

Jesse's keynote included the announcement that every attendee (all 2500
of them) would be receiving a free Raspberry Pi, and that any Pi's that
attendees didn't want to claim would be redistributed to various
educational groups and programs. Not only that, but Jesse also announced
[http://raspberry.io/](http://raspberry.io/), a new site for sharing
Raspberry Pi based projects and resources, as well as a "Rasberry Pi
Hack Lab" running for the duration of the conference, where attendees
could hook their Pi's up to a keyboard and monitor, as well as
experiment with various bits and pieces of electronics donated by one of
the conference sponsors. [Richard
Jones](http://www.mechanicalcat.net/richard/log/Python/How_awesome_was_PyCon)
also stepped up to run some additional short introductory PyGame
tutorials in the lab (he had run a full 3 hour session on PyGame as part
of the paid tutorials on the Wednesday and Thursday prior to the
conference).

One key personal theme for the conference revolved around the fact that
I've volunteered to be Guido's delegate in making the final decisions on
how we reshape Python's packaging ecosystem in the lead up to the Python
3.4 release. I'll be writing quite a bit more on that topic over the
coming weeks, so here I'll just note that it started with proposing some
changes to the Python Enhancement Proposal process at the language
summit on the Wednesday, continued through the announcement of the
coming setuptools/distribute merger on Thursday, the "packaging and
distribution" mini-summit I organised for developers on the Friday
night, the "Directions in Packaging" [Q&A
panel](https://us.pycon.org/2013/schedule/presentation/34/) we conducted
on the Saturday afternoon, some wonderful discussions with Simeon
Franklin [on his
blog](http://simeonfranklin.com/blog/2013/mar/17/my-pycon-2013-poster/)
regarding the way the current packaging and distributions issues detract
from Python's beginner friendliness and on into various interesting
discussions, proposals and development at the sprints in the days
following the conference.

Unfortunately, I didn't actually get to meet Simeon in person, even
though I had flagged his poster as one I really wanted to go see during
the poster session. Instead, I spent that time at the Red Hat booth in
the PyCon Jobs Fair.  The Jobs Fair is a wonderful idea from the
conference organisers that, along with the Expo Hall, recognises the
multi-role nature of PyCon: as a community conference for sharing and
learning (through the summits, scheduled talks, lightning talks, poster
session, open spaces, paid tutorials, Young Coders sessions, Raspberry
Pi hack lab, and sprints), as a way for sponsors to advertise their
services to developers (through the Expo Hall and sponsor tutorials) and
as a way for sponsors to recruit new developers (through the Jobs Fair).
PyCon has long involved elements of all of these things (albeit perhaps
not at the scale achieved this year), but having the separate Expo Hall
and Jobs Fair helps keep sales and recruitment activity from bleeding
into the community parts of the conference, while still giving sponsors
a suitable opportunity to connect with the development community.

Both at the Jobs Fair and during the rest of the conference, I was
explaining to anyone that was willing to listen what I see as Red Hat's
role in bridging the vast gulf between open source software enthusiasts
(professionals and amateurs alike) and people for whom software is
merely a tool that either helps (hopefully) or hinders (unfortunately
far too often) them in spending time on their actual
job/project/hobby/etc.

I also spent a lot of time talking to people about my actual day job.
I'm the development lead for [one of the test
systems](http://beaker-project.org/) at Red Hat, and while it is very
good at what it does (full stack integration testing from hardware,
through the OS and up into application software), it also needs to
integrate well with other systems like autotest and OpenStack if we're
going to avoid pointlessly reinventing a lot of very complicated wheels.
Learning more about what those projects are currently capable of makes
it easier for me to prioritize the things we work on, and make suitable
choices about Beaker's overall architecture.

At the sprints, in addition to working on CPython and some packaging
related questions, I also took the opportunity to catch up with the
Mailman 3 developers - the open source world needs an email/web forum
gateway that at least isn't actively awful, and the combination of
Mailman 3 with the hyperkitty archiver is shaping up to be positively
wonderful.

I didn't spend the *entire* conference weekend talking to people
- I actually got to go see a few talks as well. All of the talks
I attended were excellent, but some particular personal highlights were
[Mike Bayer's deep
dive](https://us.pycon.org/2013/schedule/presentation/88/) into SQL
Alchemy's session behaviour, [the panel
on](https://us.pycon.org/2013/schedule/presentation/104/) the [Boston
Python Workshop](http://bostonpythonworkshop.com/) and a number of other
BPW inspired education and outreach events, [Mel Chua's whirlwind
tour](https://us.pycon.org/2013/schedule/presentation/98/) of
educational psychology,  [Lynn Root's educational
projects](https://us.pycon.org/2013/schedule/presentation/144/) for new
coders (with [accompanying website](http://newcoder.io/)), [Dave
Malcolm's
follow-up](https://us.pycon.org/2013/schedule/presentation/95/) on his
efforts with static analysis of all of the CPython extensions in Fedora,
and [Dave Beazley's
ventures](https://us.pycon.org/2013/schedule/presentation/222/) into
automated home manufacturing of wooden toys (and destruction of laptop
hard drives). There were plenty of other talks that looked interesting
but I unfortunately didn't get to (one of the few downsides of having so
many impromptu hallway conversations). All the PyCon US 2013 talks
should be showing up on
[pyvideo.org](http://www.pyvideo.org/category/33/pycon-us-2013) as the
presenters give the thumbs up, and the [presentation
slides](https://speakerdeck.com/pyconslides/) are also available, so
it's worth trawling through the respective lists for the topics that
interest you.

In the midst of all that, Van Lindberg (PSF chairman) revealed the first
public draft of the [redesigned python.org](http://preview.python.org/)
(I was one of the members of the review committee that selected Project
Evolution, RevSys and Divio as the drivers of this initial phase of the
redesign process), and also announced the [successful
resolution](http://arstechnica.com/information-technology/2013/03/python-wins-trademark-dispute-rival-stops-calling-itself-python/)
of the PSF's trademark dispute in the EU.

This was only my second PyCon in North America (I've been to all three
Australian PyCons, and attended PyCon India last year) and the first
since I joined Red Hat. Meeting old friends from around the world,
meeting other Pythonistas that I only knew by reputation or through
Twitter and email, and meeting fellow Red Hatters that I had previously
only met through IRC and email was a huge amount of fun. Attending the
PyLadies charity auction, visiting the Computer History Museum with
Guido van Rossum, Ned Deily and Dwayne Litzenberger (from Dropbox),
chatting with Stephen Turnbull about promoting the adoption of open
source and open source development practices in Japan, and getting to
tour a small part of the Googleplex were just a few of the interesting
bonus events from the week (and now I have a few days vacation to do the
full tourist thing here in SFO).

I'm still on an adrenaline high, and there are at least a dozen
different reasons why. If everything above isn't enough, there were
a few other exciting developments happening behind the scenes that
I can't go into yet. Fortunately, the details of those should become
public over the next few weeks so I won't need to contain myself too
long.

This week was intense, but *awesome*. All the organisers, volunteers and
sponsors that played a part in bringing it together should be proud :)

_Originally posted at [curiousefficiency.org](http://www.curiousefficiency.org/)_
