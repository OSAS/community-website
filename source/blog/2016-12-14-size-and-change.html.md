---
title: Size and Change
date: 2016-12-14 15:30 UTC
author: dneary
tags: community, development, scale
published: true
comments: true
---
![Apple and Orange](blog/Apple_and_Orange.jpg) I have been thinking about how size can affect culture and adaptability of groups recently. The topic once again came up today in a talk about what makes a healthy community. The answer to that will depend on the community's size and maturity. An open source project, in the words of one participant in one conversation I had recently on this subject, should have "the minimum level of structure to allow it to function effectively." I agree&mdash;just enough is the right amount. This article contains some ponderings on the relationship between size and communities, and some conclusions we can take from that.

READMORE

## Size and Culture

I have been thinking of this because of a few converging issues&mdash;one project I work on, which started with four people, now has more activity than we can handle, and we are thinking of how to grow the group of (OpenStack style) committers. I have been helping another project figure out how to create a governance structure to allow them to grow
effectively beyond their current size, where they have about 10 active companies and about 150 active developers. And the company I work for has been going through some growing pains as we go past 10,000 people in size.

The work of Robin Dunbar comes to mind&mdash;he of [Dunbar's Number](https://en.wikipedia.org/wiki/Dunbar's_number). In [How Many Friends Does One Person Need?](http://www.hup.harvard.edu/catalog.php?isbn=9780674057166), he examines the nature of communities of different sizes. He finds a number of group sizes that
recur often, and their characteristics change at certain size limits: The specific sizes he points to are 5, 15, 50, 150, 500, and 5000&mdash;he
suggests that there might be something special about this scaling factor
of three.  But he does not talk a lot about evolution&mdash;how group dynamics
change as the groups grow. A few examples occur to me from my own
experiences:

* One small company I worked for used to have a monthly dinner with
all staff and their partners&mdash;possible when there were five or six employees
and 8 or 10 people at dinner, but that gets more difficult as you get
bigger.

* Another company, we were between 15 and 30 employees while I
worked there&mdash;every morning, everyone, when arriving, used to say good
morning to everyone else in the company. At some point (around 20
people), people stopped doing that, and just said hello to the people
they met on their way to their desk, and the people in their immediate
office.

* As mailing lists grow, the peer pressure to respond personally to
any individual message diminishes. At a certain size, it becomes much
more difficult to evaluate the authority level of a person posting on
the list, and the social ties weaken between list participants. On one
list, when the main list got too busy, they created a "developers"
mailing list where they could hang out together. A similar phenomenon
happens with IRC channels.

* I remember talking to a friend who was the founder of a growing
tech company, who told me about the first time his company hired someone
he had not personally interviewed&mdash;my recollection is that it happened
after the company passed 50 employees, but before it hit 70. Around the
time the company had 50 people, the overhead of interviewing and hiring
new people grew beyond his ability to scale.

There are multiple other scaling events&mdash;when do you implement some
kind of HR process for absence management, expenses, pay raises, and so
on? How big are you when it becomes cost effective to hire a full time
accountant, lawyer, administrator, talent acquisition? When is a single
team in your company big enough that you need to hire or promote someone
who is not a founder to management? How big before it is unreasonable to
ask everyone's opinion on a work change that impacts everyone?

These events are specific to companies, but communities have similar
scaling experiences. At some point, the project maintainer will not be
personally reviewing all changes to the project. Tools and process will
need to be added for managing bug reports, releases, automated builds,
source control. As the project gets bigger, you will hit a point where
it is more work than volunteers can do to maintain infrastructure, and
your project may need to budget money for a sysadmin. And if you need
budget for a sysadmin, you may be at a point whether it is worthwhile
having someone work on fundraising, business development, content
management, and other tasks that community volunteers traditionally do
not do well.

## Structure and Relationships

At each of these changes, required structure and process is one axis.
The other axis, perhaps more significant, is how people in the group
relate to each other. Individuals can have multiple identities at once,
each of which is stronger or weaker. I can be part of a project and part
of a company at the same time&mdash;and whether I consider myself an project
foo developer who gets paid by company X, or a company X employee who
happens to be working on project foo, is a very personal thing,
depending on the depth of the relationships that I have with other
members of the groups "project foo" and "company X."

The relationships with group members will change over time, as group
size changes. I started my developer career as a developer of the GIMP,
spent over a year as the GIMP release manager, and organized multiple
GIMP events, but over time I have drifted away as the project evolved,
and some of the people I had close relationships with in the project
reduced their activity. At the same time as my ties to the GIMP were
waning, I was spending more and more time in the GNOME project&mdash;and
around 2004 or 2005, I would have considered myself more a part of the
GNOME project than the GIMP. And so on throughout my career. I have
maintained some lifelong friendships with current or former GNOME
project members, but that is not such a big part of my identity any more.

There are a number of ways that identity can change as groups grow&mdash;and
one of them is to break into sub-groups. A Nova developer may still feel
like an OpenStack developer, but the personal connections with people
working on the Nova project will be stronger. And the Nova core
reviewers group will have even stronger relationships with each other.
You see this happen with conferences all the time. When a conference
starts out, and the number of attendees is in the low hundreds, you have
a small number of organizers who are close friends, and attendees have
rich relationships and conversations. As a conference gets to the high
hundreds, you start to see "tracks" form, where big sub-groups gather to
share knowledge specific to them&mdash;with a resulting lessening of
awareness of what is happening in other projects. When the OpenStack
Summit got towards 1500 or 2000 people, you start to see a completely
separate sub-event forming for developers&mdash;the "OpenStack developer"
identity is reinforced, at the expense of some awareness of the
technical community in the greater OpenStack ecosystem. And now, with
the main event over 5000 attendees, another inflection point has been
reached, where in addition to per-project tracks at the developer
summit, specific projects are co-ordinating smaller "mid-stream" events
to encourage the creation of an even tighter per-project active
participant identity. Once again those numbers&mdash;150, 500, 1500, 5000 -
Dunbar's inflection points&mdash;match quite nicely to the moment where the
communities feel an unease with the state of attairs, and start to look
for ways to scale further.

## Loss of Voice

Christopher Alexander *et al* describe the "[Community
of 7000](http://www.iwritewordsgood.com/apl/patterns/apl012.htm)" (close enough to Dunbar's 5000) in [*A
Pattern Language*](https://www.amazon.com/Pattern-Language-Buildings-Construction-Environmental/dp/0195019199), a 1970s architecture book (part of the Portland
Experiment series&mdash;hat-tip to [Federico Mena
Quintero](https://people.gnome.org/~federico/news.html) for introducing me both to this and to [Jane Jacobs](https://en.wikipedia.org/wiki/Jane_Jacobs)'
theories on the [evolution](https://en.wikipedia.org/wiki/The_Death_and_Life_of_Great_American_Cities)
of [healthy communities](http://www.goodreads.com/book/show/85398.The_Economy_of_Cities)). His characterization of this, which matches both Dunbar's
group of 5000 (and coincidentally Plato's theoretical optimal size of a
democracy, 5040), is that it is the size of a group where an individual
feels that they have no say in the affairs of the group. It is also the
size at which town meetings in Massachusetts can move from "open to all"
to representative meetings, open only to elected representatives (6000
residents). And it is also a size at which companies tend to hit scaling
challenges both in terms of revenue, cost of innovation, and general
employee satisfaction (moving from "feeling like part of a family" to
"feeling like a cog in a machine"). Geoff West has described ([article](http://www.nytimes.com/2010/12/19/magazine/19Urban_West-t.html))  how
companies ([TED video](https://www.ted.com/talks/geoffrey_west_the_surprising_math_of_cities_and_corporations)) act like organisms&mdash;as they get bigger, their
growth slows, and become dominated not by innovation, but by economies
of scale. There are a multitude of articles describing the periods of
growth, with periodical moments of crisis, in the growth of articles ([here's
one](https://hbr.org/1983/05/the-five-stages-of-small-business-growth) and [one more](https://hbr.org/1998/05/evolution-and-revolution-as-organizations-grow)). I contend that open source projects that stay centrally
organized act more like companies, and those who achieve
hyperdecentralization (what Ori Brafman describes as a "starfish"
organization in [*The Starfish and the Spider*](https://www.amazon.com/The-Starfish-Spider-Unstoppable-Organizations/dp/1591841836)) act more like ecosystems like forests and
cities.

## Conclusion

What does this all mean? It means that communities evolve and mutate as
they grow. The minimum viable infrastructure for a small three-developer
project is not the same as for a huge ecosystem like OpenStack. There
will be moments of growth punctuated by moments of unrest&mdash;and at those
moments, change is needed to allow growth to continue, or the community
will stagnate and die. Those changes will occur around the boundaries of
Dunbar's numbers. With each change, something of what went before will
be lost, causing nostalgia, anxiety, and some discontent that things
were better before. Good communities will pay attention to these
emotional consequences too. Perpetuating the founding values of a
community as it scales is a challenge, and as a community grows a mix of
dogma, lore, and stories can be used to pass on values.It means that as
communities grow, group identity, and the sub-groups that grow from
group identity, needs to be managed&mdash;to avoid the [anti-patterns](http://communitymgt.wikia.com/wiki/Category:Anti-patterns)
of the [clique](http://communitymgt.wikia.com/wiki/Nepotism), [the water cooler](http://communitymgt.wikia.com/wiki/Water_cooler), or corporate [command and control](http://communitymgt.wikia.com/wiki/Command_and_Control).
