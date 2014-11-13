---
title: PyCon Ireland 2014 Report
author: jpichon
date: 2014-11-10 16:43:40 UTC
tags: PyCon, Python, Python 3, OpenShift
published: true
comments: true
---

![](blog/pyconie-logo.jpg) Now in its fifth year, [PyCon Ireland](http://python.ie/pycon/2014) is an annual conference organized by the Python Ireland community. Like the previous year, the weekend conference was held in Dublin and included a healthy mix of talks and workshops. Two days of sprints on projects such as Django and PyPy followed. Over the years, and most notably this year, the content has evolved from covering low-level implementation details, to higher-level applications of Python and the plethora of modules now available. 

Many companies, including Red Hat, sponsored the event, and given the interactions at the booths and the various recruiter talks, the job market seems vibrant and competitive for Python developers. More than 350 people attended this year, and the conference once again sold out in advance. ![](blog/pyconie_keynote.jpg){:align=right}

The keynotes covered a variety of topics. On Saturday the opening talk by [Ian Ozswald](http://youtu.be/V1HkaTQYN54) included a rant about how hard and annoying cleaning input data is, a sentiment echoed by multiple speakers who also complained about wrong units, badly encoded strings, and the fact the booleans can be True and False, but also Unreadable. 

READMORE

In her [Sunday keynote](http://youtu.be/Hqy5Yks09ZQ), [OpenShift](https://www.openshift.com/) community manager [Diane Mueller](https://twitter.com/pythondj) talked about communities and successful community management  (and how to make soup out of stones), and she discussed the problems of scope, stabilization, and Not Invented Here syndrome in younger projects. Diane used specific examples from the OpenShift and OpenStack communities in  her discussion. 

Lennart Regebro's [keynote about Python 3](http://youtu.be/Tm_q5KPLaGk) was practical , and after explaining why everyone should support it, he provided a real world example of how to add  support to an existing project. Lennart also mentioned a number of useful tools, tips, and techniques that would be good references for anyone looking to start. For example, he discussed tools specific to porting to 3, such as [Can I Use Python 3](https://caniusepython3.com/) to check dependencies that may be blocking the transition, and [2to3](http://python3porting.com/2to3.html) for a first automated attempt at converting the code. He also mentioned tools that help make the process easier, including [tox](https://tox.readthedocs.org/en/latest/) and [virtualenv](http://virtualenv.readthedocs.org/en/latest/). Lennart's slides with references and strategies are available [on GitHub](https://github.com/regebro/BigBad3).

If you couldn't make it to the event, or if you missed some of the talks, be sure to check out the collection of video archives available in the [PyCon Ireland YouTube channel](https://www.youtube.com/user/pyconireland), including Diane Mueller's keynote, “Beyond the Cathedral & Bazaar: The New Era of Cross Community Collaboration."

<iframe width="560" height="315" src="//www.youtube.com/embed/Hqy5Yks09ZQ?list=PLedkOvWdiOl3BQCpHphyslI3_vtpHRuj3" frameborder="0" allowfullscreen></iframe>

Follow [PyCon Ireland on Twitter](https://twitter.com/pyconireland) to stay updated on 2015 event plans.

*Thanks to Pádraig Brady, Dan Kenigsberg, and Lucas Gomes for contributing to this article.