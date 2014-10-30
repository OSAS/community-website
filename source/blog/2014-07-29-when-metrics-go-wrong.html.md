---
author: dneary
comments: true
layout: post
title: When Metrics Go Wrong
date: 2014-07-29 15:37 UTC
tags:
- Metrics
categories:
- Blog
---
![](blog/metrics-dneary-post.jpg)
Metrics are great. They can give you situational awareness about what's going on in your community, help you identify issues that you need to fix, and prove the effectiveness (or lack thereof) of community initiatives. But sometimes things go wrong. 

Good metrics should lead to action, but sometimes, if you're not careful, you can end up with results you didn't intend. The very act of measuring something, and communicating that measurement, creates an incentive in the community. And sometimes the incentives you create do not match the behavior you want to encourage. (This is called [The Cobra Effect](http://freakonomics.com/2012/10/11/the-cobra-effect-a-new-freakonomics-radio-podcast/).)

READMORE

## Destructive Incentives

In April 1902, after the French had renovated Hanoi to install a modern sewer, the city was overrun with rats. The French Governor General of Indochina, Paul Doumer, instituted a "deratisation" scheme using local city workers, who were paid for each rat they captured. In the first week, they captured more than 8,000 rats. By the third week, more than 4,000 rats per day were being killed. By mid-July, up to 20,000 rats per day were being captured. But they barely made a dent in the problem.

In July, the government decided to widen the net and offer a reward to the citizens of Hanoi who offered proof that they had killed rats. To avoid a pile of rodent corpses building up outside the colonial government buildings, the proof requested for payment was just the rat's tail.

Immediately, two phenomena were observed: tailless rats started appearing, and a thriving rat farming industry emerged in the city. (Read the PDF ["Of Rats, Rice, and Race: The Great Hanoi Rat Massacre, an Episode in French Colonial History"](http://www.freakonomics.com/media/vannrathunt.pdf) for more on this story.) 

There is a possibly apocryphal story about an insurance company's call center manager who noticed that, although customer satisfaction rates were high, some customers had to wait for several minutes to get a human on the line. His idea was to put a display in the call center showing the wait time of the person who had been waiting the longest, dynamically updating all the time, so that everyone was aware that someone was waiting. He also evangelized his desire to bring wait times down so that no-one would wait longer than three minutes for an answer.

The wait times came down, but at a cost. Call center attendants would hang up on customers whose problem had not yet been resolved, to prevent the wait time going over the three-minute mark. They reasoned that the person would call back and their problem would be solved regardless. Of course, this frustrating experience led to customer satisfaction ratings dropping down through the floor, and the counter was swiftly removed.

Both of these stories show that measuring something, and implicitly or explicitly setting expectations for a trend in the measurement, can sometimes have unintended consequences. And typically there are three ways that metrics can cause these unintended results.

## 1. Measuring the Wrong Thing

Like the French consulate who measured rat tails as a means of measuring the reduction in the rat population, we sometimes measure what is easy, rather than working to figure out whether that really correlates with the result we want to achieve.

In the late '90s, the key measurements that were used to measure batter skill were RBI (Runs Batted In) and batting average (how often a player got on base with a hit, divided by the number of at-bats). The Oakland A's were the first major league team to recruit based on a different measurement of player performance, on-base percentage. This measures how often they get to first base, regardless of how it happens.

It turns out that this correlates much better to what you want to produce in a baseball team, runs, rather than hitters. The league undervalued this measurement because a "walk" (where the player gets on base without hitting the ball) was commonly seen as a pitcher error rather than a batter success, but some players ended up having many more walks than others.

By looking at the results they wanted, and measuring the right thing, the Oakland A's got an edge over the competition, which allowed them to have a period of success relative to teams with much bigger budgets, winning the American League West three out of four years between 2000 and 2003.

## 2. Myopia

The other way metrics can go wrong is when the measurements concentrate on part of a system, but don't consider effects on the rest of the system. An actor optimizing for his measurements may actually be doing harm overall.

One example (without names, to protect the innocent) involved the marketing team of a company focusing on new sign-ups to their online service. They designed a marketing campaign in which new customers would get some free credit for the system and some goodies at a conference upon signing up.

The campaign was a great success, and soon the system had thousands of inactive accounts, with a balance sitting at $9.99. The CFO was unhappy because he had to carry this on the books, and the CEO was unhappy because the metrics he cared about, whether people stayed active on the service after 30 or 60 days, were terrible. Whether people wanted or needed the service did not enter into the calculations of the marketing project.

In one open source project (on which I was a release manager), the main metric I cared about was the bugs open against a milestone. As time went on, and the number was not going down fast enough, we regularly would bump bugs to the next milestone, not because they were not important issues, but because we knew that they would not be fixed by the date we had set ourselves. Having participated in a number of projects, I have a pretty good idea that this is a universal tendency as release approaches.

## 3. Drawing the Wrong Conclusions

The third way things can go wrong is when you are measuring the right thing, but you draw the wrong conclusions from the data.

One set of metrics that is important is how many bugs are open against your project, and the rate at which they are being created. In one project I worked on, some people were concerned about a recent spike in the number of bug reports coming in because it seemed like the project must have serious quality issues to resolve; however, when we looked at the numbers, it turned out that many of the bugs were coming in because a large company had recently started using the project. The increase in bug reports was actually a proxy for a big influx of new users, which was a good thing.

Similarly, messages on mailing lists is something we generally want to see going up and to the right. More email means more members, right? Except when spikes are cause by community outrage at a recent controversial decision, or are the result of a massive and destructive flame war between two or three individuals. By looking only at the trends, you miss the richness of what is happening underneath, and run the risk of missing an opportunity to improve.

## Final Advice

So should we stop measuring things in our communities? Absolutely not.

We do, however, need to be discerning about what we measure, and how we communicate those measurements. Because metrics create incentives whether we like it or not, ensure that your measurements are creating virtuous incentives that encourage good behavior.

Also, constantly draw the metrics you use back to the overall goals of your project. Am I growing the user base, and helping those users to be happy? Am I helping the bottom line? By creating the link between primary and secondary metrics, you help mitigate myopia.

Finally, include both quantitative and qualitative analysis in your metrics reports, to ensure that trends are understood in their context.

Metrics are an awesome tool to help you identify your weaknesses, evaluate progress, and trumpet your successes. Just remember that you will get what you measure.

(*This post is derived from a presentation I gave at the inaugural [FLOSS Community Metrics Meeting](http://flosscommunitymetrics.org/) on the topic "What you measure is what you get. Stories of metrics gone wrong." You can find the [slides on SlideShare](http://www.slideshare.net/nearyd/metrics-gone-bad).*)

