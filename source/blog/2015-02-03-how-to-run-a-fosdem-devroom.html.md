---
title: How to Run a FOSDEM Devroom
author: jzb
date: 2015-02-03 15:49:31 UTC
tags: FOSDEM, virtualization, devroom, conference, IaaS, containers
comments: true
published: true
---

![](blog/fosdem2015.png)FOSDEM is one of the world's biggest gatherings of free and open source developers, and it takes a *lot* of work to put the entire thing together. Almost magically, the event is staffed and managed by volunteers and put on free of cost to the attendees. If you were one of the thousands of folks attending FOSDEM this past weekend in Brussels, you might have found yourself sitting in a devroom thinking, "Hey, I'd like to put one of these together next year!" If so, read on. 

READMORE

For this year's FOSDEM, I was one of the organizers for the Infrastructure-as-a-Service (IaaS) and Virtualization devrooms. Last year I stepped in at the last minute to run the Distributions devroom. Although I haven't been running devrooms nearly as long as many organizers, it was a learning experience that might benefit others who are interested in organizing one in the future.

The standard disclaimer should apply here: This is my experience running a devroom; each room is different, and there's slight differences in the way the FOSDEM organizers do things each year. Also, in no way should this be taken as me saying "we did everything right" this year. Mistakes were made, and there's **always** room for improvement.

## Attend FOSDEM

First things first: Don't propose a devroom if you've never attended FOSDEM before. FOSDEM is a creature unlike almost any other. It's big, bustling, more than a little chaotic, and a bit short on creature comforts compared to other conferences. 

FOSDEM is held at the [Université libre de Bruxelles](http://www.ulb.ac.be/campus/solbosch/solbosch-en.html) (ULB), spread out over several buildings. The weather is invariably cold, but depending on the year you attend you have the choice of rain or snow. Bring and umbrella and shoes that are suitable for dashing across a college campus with plenty of hills and (potentially) icy steps. 

![](blog/devroom_2015.JPG){:align="right"}Rooms are crowded, and all the devrooms run on their own schedule. This means that if you're choosing talks across devrooms, there's a good chance that the talk in the distributions devroom you've been dying to see is going to end 10 minutes into the talk you wanted to see in the virt devroom across campus. Also, unless the room organizers are prohibiting it, people will enter and leave the talks (banging desks and creating chaos) all through the presentation.

The "hallway track" at FOSDEM is strong, and what keeps most folks coming back year after year after year. For best success, try to contact people well ahead of FOSDEM and carve out a specific time to meet. 

FOSDEM starts early (9 a.m., earlier if you're actually doing a devroom) and ends late (7 p.m. Saturday, 6 p.m. Sunday). Odds are, you'll be out late Friday, Saturday, and Sunday nights. Belgium has tasty beer, and some of the beers you'll sample are deceptively smooth for such a high ABV. More than a few folks have missed big portions of FOSDEM by over-doing it at evening events, so be careful out there and be sure to match your beer intake with water if you're enjoying the beer at the venue (yes, beer is sold at FOSDEM) or at evening events.

If you can survive FOSDEM as an attendee, then you might be ready to level up to organizing a devroom. 

## Propose the Devroom

The first step is to propose your devroom. Well, that's not entirely right. The first step is to find several other folks to propose a devroom with, really. This year, I proposed a devroom that was similar to several other proposals. The FOSDEM folks "suggested" we all work together to create a unified proposal.

After several iterations, we hit on something the FOSDEM organizers were willing to green light. We wound up with one devroom for Infrastructure-as-a-Service, and one for Virtualization. (My hope was to have a devroom specifically for containers and orchestration, but the FOSDEM folks felt that fit within the mandate for IaaS, virt, and other devrooms.) 

Plan for all this to take several hours spread out over a few months. The initial proposals need to be in before the devroom deadline, and then there'll be communication back and forth before the official list of devrooms is published a few months before FOSDEM.

## Putting Together the Program

Once the devroom is accepted, it's time to start recruiting speakers. At a minimum, this means sending out a [call for participation](https://lists.fosdem.org/pipermail/fosdem/2014-October/002056.html) to the FOSDEM lists; however, you should really go farther than that and put the call out to social media, and directly seek out the folks who should be involved in the devroom. It's more work than it sounds like. 

### Herding Cats? That's Nothing Compared to Wrangling Speakers!

Every devroom sets its own schedule for its call for proposals. Having done this twice, and having watched other devrooms come together, I would suggest that the schedules are often a bit optimistic. 

FOSDEM is typically the last weekend in January or first weekend in February. What most folks forget, I think, is that the holidays happen at the end of December, and that tends to eat up a few weeks in which most folks don't want to be worrying about what's usually work-related stuff for them. 

What I'm saying here is, ideally, you should have your speakers selected, notified, and confirmed **before** everyone sneaks off for the holidays. This is somewhat ambitious, but I assure you you'll be so pleased if you follow that schedule and come back from the holidays with a big chunk of devroom organizing complete with less than a month before FOSDEM happens. We did *not* do this with the IaaS/virt devrooms this year, and it would definitely have been better if I'd kept to the original schedule. 

Speakers will be coming from all over the world. Some will be flying from another continent and staying in Brussels specifically to attend FOSDEM, and some will be from elsewhere in Europe, perhaps just planning to take a train to and from the conference the same day. Some folks will have visa/travel considerations that make it necessary to start planning at least a month (probably more) in advance, and other folks will pretty much be able to roll with super-short notice. Assume well more than a month is needed, though. 

Assume you'll need to adjust your finely crafted schedule to deal with speakers who've been scheduled for the same time slot in another devroom, or who want to leave/arrive earlier/later than you have them slotted in. 

Also assume that stuff happens, and have backups when it inevitably does. Flights get cancelled. People get sick, change jobs, deal with family emergencies, or for some other reason find they can't make the trek to FOSDEM sometime after accepting a slot in the schedule. This varies from several weeks before FOSDEM, to the day before. Planning accordingly and having some backups for the schedule is best.

Finally, and *mea culpa*, you need to make sure you plan to notify those folks who submitted proposals that *weren't* chosen. I dropped this step this year, and I feel bad for not giving the folks who didn't have a slot a "thank you" for submitting and a definitive answer. 

## Pentabarf and Rating Talks

The CFP system FOSDEM uses is called "Pentabarf." Just soak that name in for a moment. The origin of that name is unclear to me, but somehow it seems fitting.

In more than 15 years of submitting, judging, and scheduling talks for events, I have seen many CFP platforms. They range from "mind bogglingly painful" and "capriciously evil" to "almost usable" from the point of view of a talk reviewer or person scheduling talks. No, I have never encountered one that is actually very good, at least from the perspective of quickly and efficiently evaluating and voting on submissions. This is doubly true when several people need to vote on submissions and compare notes. But I didn't feel like I developed PTSD using Pentabarf, so it has that going for it, which is nice.

What we found easiest was to pull the CSV of talks submitted to the IaaS/virt devrooms and put them into a Google Drive spreadsheet, and create extra columns for voting/ratings. Your mileage may vary, and different groups may find that other methods work better for them.

You will probably also need to have at least one group meeting to rank and schedule talks. Some talks are clear winners, some are clearly not quite right, and then there are those in the middle that need to be discussed. For most devrooms, obviously, there's more content than time, so you need to cut somewhere. 

## Room Considerations

Note that although you're getting info from speakers, you also need to put together your devroom schedule. There are some special considerations here that make planning slightly tricky. Unless I'm mistaken, the hours that devrooms run are not set in stone from year to year. Also, what the schedule expectations are is not directly communicated to devroom organizers until some period of time before FOSDEM that is well after the CFP goes out and should be finished. All that is to say, you may not be 100% sure just how many speakers you need without doing some serious pre-planning. 

For best results, take a look at similar devrooms from previous years, and plan roughly 11 a.m. to 7 p.m. on Saturday, and 9 a.m. to 6 p.m. Sunday. 

The organizers typically ask that the devrooms have **no** breaks for lunch or whatnot. They recommend running the devroom full tilt from start of the day to the end of the day. 

What's worked well-ish for my devrooms is 20 or 40-minute slots, with about 5 minutes for room changeovers. Note that the room you're in makes a lot of difference. In 2014 I managed a two-day devroom in a small room in the K building, which held somewhere north of 100 people. (If memory serves correctly.) This year, the virt and IaaS devroom was in the U building in a room with capacity for somewhere in the neighborhood of 500 people.

## Organizing the Organizers

Even with speakers successfully wrangled, you also need to have a few helping hands to make the devroom run smoothly. Plan on having two or three people at all times in the devroom, when possible. In smaller rooms, one person *can* do all the work, but it won't be a lot of fun and have mercy if they fly solo for hours and need to use the restroom or get some water. 

Things don't just organize themselves, so put together a room schedule for organizers at least a week ahead of time and make sure everybody has a chance to get out of the room for a bit.

Some things I wish I'd done this year for the devroom: Had water for the volunteers and speakers, created signs for the doors to indicate "room closed" or "come back for next talk," and so forth. Exchanging cell numbers and so forth before FOSDEM is also a good idea. 

At a minumum, you need two or three people to run the room well at any given time. One person to handle video, one to man the door, and one to help provide time cues to the speaker. Two people can do this pretty easily, but it gets a little hairy for just one person. 

You'll also definitely want two people at the start and end of the day to get/return the video equipment for the devroom and to set up things. You may also need a runner to find FOSDEM organizers if something in the room needs attention. If the projector bursts into flames, you'll need someone to try to locate a new one quickly. (This has not happened on my watch, I'm just throwing out an example...) 

## Running the Room

Have we mentioned that a *lot* of people attend FOSDEM, and that the schedules between devrooms don't line up? This, combined with the fact that attendees may want to see a talk in building K and then a subsequent talk in Building U means that people may arrive at non-optimal times for the talks, and that rooms can and will fill up *entirely* for some talks. This means you need to practice active room management as a devroom organizer or volunteer. 

First, guide attendees to fill in the middle of the room when they're sitting down. People often want to occupy the aisle seat or maintain a gap for personal space between themselves and other attendees. Although it's easy to sympathize with this, FOSDEM is an event that requires us to make room so that as many attendees as possible can participate. Some attendees may require more encouragement than others to do this, and it's up to the devroom folks to provide that encouragement.

Secondly, because of the aforementioned scheduling fun, picking a cut-off time for entering talks is a good idea. My rule of thumb? After a talk has been in progress for 10 minutes (or more), the doors should be closed until the end of the talk regardless of the room's present capacity. Hearing people noisily scrambling for seats throughout the entire talk is unfair to the speaker and other attendees. This is particularly a concern for rooms in which attendees can only enter in the door near the speaker and have to wade through the rest of the audience to sit. Rooms where the entrance is far from the speaker allow for some latitude here. 

Generally, folks at FOSDEM are pretty courteous and pleasant. Occasionally, they need to be reminded that conversations during talks should be kept to a minimum and never overpower the speaker. 

Speakers at FOSDEM are generally excellent, but sometimes people arrive late, need help getting set up, and so forth. You probably want to pass on the technical requirements to speakers (e.g., "show up with a laptop that can output 1024x768 VGA") and be prepared to supply various adapters and dongles to convert from HDMI, MiniDisplayport, and DVI to VGA. Having a spare, known-good laptop that can pinch-hit when a speaker's laptop and the projector refuse to speak to one another is a good idea.

Note that part of the job is making sure that the room is in as good a condition as you found it. The past few years, I've noticed that FOSDEM attendees have gotten much better about carrying their food and drink containers to trash and recycling bins, so the amount of clean up required is fairly minimal. 

## That's All Folks!

If you've made it this far, I hope you've picked up something useful about running a devroom. It's not easy, but not nearly as hard as it is to organize FOSDEM itself. A big thanks to the FOSDEM folks for all the work they do to put on FOSDEM, and to ULB for hosting it year after year. 

Also a big thanks to the other devroom organizers, especially the folks who worked on the IaaS and virtualization devrooms with me this year: Dave Lester, Lars Kurth, Thierry Carrez, Itamar Heim, and Luca Gibelli. And volunteers who helped staff the devroom, including Brian Proffitt, John Mark Walker, and Ian McLeod. Apologies if I missed anyone -- I place the blame on post-FOSDEM brain fog. 

If this seems useful enough, I might try to compile a "HOWTO" for next year's crop of organizers. Have feedback? Let me know by email -- the username is "jzb" and the domain should be pretty obvious. Cheers!