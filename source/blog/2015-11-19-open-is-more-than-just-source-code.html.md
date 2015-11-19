---
title: Open Is More Than Just Source Code
date: 2015-11-19 17:25 UTC
author: bkp
tags: community, open source, open standards, open data
comments: true
published: true
---
![Kanban board](blog/bkp/kanban.jpg) As 2015 wraps up, one of the things we are doing in the Open Source and Standards group is looking for new tools that can help us do our jobs better. But it might surprise you to learn that even within OSAS, it's not a 100% given that every piece of software we consider is open source or free software.

Recently, one of the tools we were looking at was software to help us track tasks created by us and also submitted to us by various open source projects within and without the Red Hat ecosystem. What good is an organization like OSAS if we can't openly share our resources and expertise with all free and open source software communities?

There are lots of applications out there that could fit the bill. An issues-based system like Bugzilla or something based on the Getting Things Done model like Remember the Milk or Nirvana. Eventually, the one model that came up more often than not was a Kanban model.

READMORE

If you're not familiar with Kanban, this is a production management system originally put together in Japan to improve just-in-time production in manufacturing environments. Work is organized on a Kanban board in a series of columns that represent states like _To Do_, _Doing_, and _Done_. Tasks are denoted by cards or sticky notes that you move across the board as they move from one state to another.

If this sounds like scrum processes, you are correct in noting the similarities. But Kanban applies another criteria to the process: work-in-progress (WIP) limits. If you have said that no more than _X_ tasks can be in a certain state, then you are limited to that number and everything else prior to that state just has to wait. Ideally, WIP limits enable anyone looking the board to identify bottlenecks in the system pretty quickly, and managers and team members can either improve the process causing the delays or toss more resources into the mix.

 Users of Kanban also have an advantage over agile and scrum-like models: Kanban uses a pull-based process, meaning that individual team members will only take a task on when they are ready, and not before. This helps precent burn out and should increase efficiency.

 The merits of Kanban versus other project management models can be argued (and [have been quite well](http://www.agileweboperations.com/scrum-vs-kanban)), but for OSAS' purposes this model looked increasingly attractive. And no, while we would all love to claim to be intellectually savvy about all things project management (because that's always a great party conversation), most of the reason we were interested in it was because many of us were familiar with a rather popular hosted application that follows the Kanban model: Trello.

Therein lies the problem: Trello, which is a really well put-togther application, is not open source. It would hardly be a positive move to base a new project-management system on proprietary tools.

And this is a problem many people in the open source community face all of the time. The near-classic Slack vs. IRC arguments are rapidly becoming the new browser wars of the 21st Century within FLOSS. And many people _want_ to use LibreOffice, but when it comes to things like high-end spreadsheet analytical tools and function availability, you'd honestly still be hard pressed to find something better than Excel.

So if even we, the hardest of hard-core open source enthusiasts, tend to struggle sometimes with just grabbing a tools that do what we need regardless of license, what's the point? Just use what you need and make it work! We're not the OSAS team, we don't have to worry about being inconsistent.

Tempting, indeed.

But the main reason we ended up looking at [open-source alternatives to Trello](http://opensource.com/business/15/8/5-open-source-alternatives-trello) was not because we were worried about hypocrites: it was because we wanted to self-host our own data. Trello is a hosted application, which meant even if we weren't worried about the license (and we are), we'd still be sharing our task data to a service that we hope will still be around in a couple of years and/or won't start charging us more down the line.

This is the advantage that platforms like [Kanboard](http://kanboard.net) and [Taiga](https://taiga.io/) can afford users like us and the projects we serve, should they want similar project management tools someday. Hosting your own applications and services helps keep your data your own, as well as ensuring the service is configured exactly the way you want.

Is it an easier solution? Sometimes, no. We have to look at our infrastructure and containerize the service we end up using. We need to adapt documentation to create our own processes and best practices. We may even have to go back to the project organizers and ask them to move up some features on their project roadmap--and even pitch in and help them make those changes.

That's not easy.

One of the bits of parental advice I have drilled into my kids' brains (along with "no, you can't paint the cat" and "Always be Batman"), is "nothing worth having is easy." This is a highly generalized version of something Theordore Roosevelt once said: "Nothing in the world is worth having or worth doing unless it means effort, pain, difficulty... I have never in my life envied a human being who led an easy life. I have envied a great many people who led difficult lives and led them well."

Which, while certainly a laudable opinion, may be a tad overdramatic when looking at the process of installing and configuring your own FLOSS service versus just signing up for what you find on the Internet. But the genertal sentiment is the same: doing it on your own is going to take more effort. But, in the long run, the payoff is strong: the software is yours, and so is the information that software is managing. Open data is just as important as open source code.

That's not just a lofty goal: that's good business.

*(Image courtesy [Henrique Imbertti Jr.](https://www.flickr.com/photos/imbertti/5079466322), [(CC BY 2.0)](https://creativecommons.org/licenses/by/2.0/))*
