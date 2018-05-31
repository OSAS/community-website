---
title: How Risky is License Risk?
date: 2018-05-31 11:10 UTC
author: bkp
tags: open source, GPL, licenses
published: true
comments: true
---

![Risk cubes](blog/risk.jpg) Every once in a while, somebody will come along and highlight that restrictive licenses carry more risk than permissive licenses. I think this is not as big a threat as some would have you believe.

There are two main branches of what is broadly known as free/libre open source software (FLOSS). Free software licenses are restrictive in the sense that if you use software and modify it, and then want to share it with someone else, you must share your changes with the original project.

Open source software licenses are defined as permissive, since there are typically no sharing requirements on the code. You make your changes and then share the code only if you want to.

READMORE

The perceived problem here is that if an organization is using software with a license like the GPL, then they are more likely to fall out of compliance. Non-compliance means a higher potential for litigation and therefore more&mdash;in the strictest business sense of the term&mdash;risk.

Or so the story goes. I've never really bought into this line of reasoning, for two reasons. First, staying in compliance with *any* FLOSS license isn't always simple. Even permissive licenses can have attribution clauses that can be missed. (This is not to malign FLOSS licenses&mdash;they are still far more desirable than proprietary licenses.)

Second, while yes, being out of compliance does put you technically at risk for litigation, in practice I have to wonder if this is always really the case. I can't speak for all FLOSS projects, but over the years I have seen my fair share of GPL violations, and a lot of them were simple misunderstandings about pushing changes upstream. Most of the time these compliance issues are settled by a brief email conversation.

This notion that restrictive licenses have been "more risky" has been recycled many times over the years.

"It's been true for a decade, and remains true: most GPL violations are an honest mistake. These days, there's often an upstream who failed to properly educate their downstream, and then the downstream made a mistake and violated," then-President and Executive Director of the Software Freedom Conservancy (SFC) Bradley Kuhn told me in a 2011 interview. "The companies in violation almost always want to work to come into compliance, and the Conservancy doesn't ask for much: the Conservancy asks that they reimburse the cost of our time to help the company come into compliance, and to fully comply with all Open Source and Free Software licenses in their product."

Even the most historically "famous" GPL violation legal cases, when BusyBox developers Erik Andersen and Rob Landley took Monsoon Multimedia, High Gain Antennas, LLC, Xteresys Corporation, and Best Buy to court, were all suits settled out of court. While the terms of the settlement were never disclosed, the Software Freedom Law Center and the SFC, who assisted the BusyBox team, insisted that the goal of the legal actions were to obtain compliance&mdash;not to keep the defendants from ever releasing the software again or obtaining huge damages.

While most developers trying to enforce compliance aren't looking for a big payday, the biggest problem of non-compliance is when someone who never intended to share their changes ignorantly does so with restrictively licensed code. This is a more serious problem, because now they have potentially put so-called "trade secrets" out in a position where they *have* to be shared. I would argue that nearly three decades of GPL use has demonstrated that the notion of code secrecy is a non-starter compared to collaborative code development, but everyone has their own ideas about that.

The best advice when working with any software license is always the simplest: work with a lawyer who understands software licensing. That help mitigate any risk, regardless of the FLOSS license.

*Image by [Pixabay](https://pixabay.com/en/risk-word-letters-boggle-game-1945683/) under [CC0 1.0
Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en) license.*
