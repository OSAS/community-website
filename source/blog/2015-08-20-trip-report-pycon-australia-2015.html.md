---
title: Event Report--PyCon Australia 2015
author: admin
date: 2015-08-20 21:47 UTC
tags: Python,events
comments: true
published: true
---
![PyCon Australia logo](blog/pyconaustralia2015.png) Since Red Hat was a platinum sponsor of PyCon Australia 2015, we had quite a few people attending the conference. Here is a write up of how some of our team experienced the conference.

READMORE

### R&oacute;man Joost

I personally enjoyed the main keynotes as well as speaking to other people. Carrie Anne Philbin [painted an interesting picture](https://www.youtube.com/watch?v=gaFk0Sya_HI) on how to teach kids computational thinking. The talk ranged from the introduction of the Raspberry Pi Foundation to tools for kids to learn programming.

The [keynote on Sunday](https://www.youtube.com/watch?v=NheE6udjfGI) was very interesting as well. Carina Z. Zona talked about the human aspect of false positives and negatives of algorithms in our daily lives. Trying to rise awareness that we, as engineers especially, will have to think about the potential consequences our implementations have on humans who might be judged by them. A shocking example included Flickr's auto-tagging algorithm tagging concentration camps like Auschwitz with sports and gyms to tagging African Americans as gorillas.

Graeme Cross' talk on [Python for less than US$7](https://www.youtube.com/watch?v=7BGAHFsnDXA) was quite interesting, too. It was about micro controllers that are able to run Python.

I very much enjoyed the lightning talks. I think there should be more time reserved for them. Amazingly, some people managed to fit two tech talks in one five-minute slot. There were also lightning talks about depression and burn out, which I thought was very important to have in the program.

I also received a few interesting pointers to pursue further from my talk and positive feedback. On the people side, I very much enjoyed networking with others and trying to find a new hire for our team. I've met old colleagues and friends of friends from other free software projects to which I've contributed. I enjoyed listening to war stories from Mark Goodwin about his time being head of engineering at SGI Australia.

Overall, the conference was a blast.

[PyCon photo 1](blog/PyConAustPhoto1.jpg)

### Dan Callaghan

The keynotes on both days were quite thought-provoking, as Roman noted. I thought the microcontrollers talk was amazing as well--who knew you could fit Python onto a US$3 chip with a WiFi transceiver!

I thought that Xuanyi Chew's [explanation of monads](https://www.youtube.com/watch?v=WNwV3wR4JjA) and how we can use them in Python was entertaining and quite accessible, even though I'm not sure that his recommended approach would fit well in a Python code base. For anybody who is scared of the idea of monads, I highly recommend watching this talk.

Aurynn Shaw's [discussion of Salt](https://www.youtube.com/watch?v=q86LUTxCDPg) (the configuration management and orchestration system) did not go into as much detail as I would've liked, but it reinforced for me that Salt is a very promising tool from which we might be able to benefit.

Scott Triglia talked about [some of the hurdles Yelp has run into](https://www.youtube.com/watch?v=H0KReHUawHI) since they started using a microservices approach for their application several years ago. It was interesting to hear some of the potential pitfalls and downsides, given that the "microservices" buzzword is still near the top of its hype curve in many circles.

I was impressed by Chris Hausler's talk about [a machine-learning platform Zendesk built](https://www.youtube.com/watch?v=of6pHdSbtOM) to predict whether a customer will be satisfied based on the history of their support ticket. It made me wonder where else we could apply machine-learning techniques to in order to make useful predictions.

In his [talk about web application security](https://www.youtube.com/watch?v=EQVaNTRqIjY), Tom Eastman made the excellent point that rather than being afraid of security breaches and sticking our heads in the sand and hoping they never happen, we are better off thinking about who might want to attack our applications, what the worst-case scenario might be if they succeed, and how we can mitigate the consequences at multiple different layers.

Chris Neugebauer gave us a hint of the future in his talk about [optional type linting in Python 3](https://www.youtube.com/watch?v=_PPQLeimyOM). I was left with renewed inspiration to work on getting our applications onto Python 3, although I'm not yet convinced that the type linting will be a useful exercise.

Like R&oacute;man, I thought the conference was also a great opportunity to meet other people in the Python community and hear about what they are working on. I'm looking forward to hopefully attending again in 2016.

![PyCon photo 2](blog/PyConAustPhoto2.jpg)

### Sunil Thaha

I share the opinions of R&oacute;man and Dan about PyCon. My impression about the talks:

**[What Django can learn from Twisted--Amber Brown](https://www.youtube.com/watch?v=_HZR7_ZBkYY).** The idea of inviting Amber to talk about Twisted in a Django conf was interesting in the sense that the community embraces the differences and learns from others competing framework. I think one of the points Amber was trying to drive home was the idea that in Software Engineering everything is a trade off; Sync (simple) vs Async (complex). I also got the impression that twisted shares a lot in common with <code>node</code> which is async and uses promises.

**[A Scientific game engine in Cloud--Oliver Nagy](https://www.youtube.com/watch?v=JG8-yurFBXM).** This a must-watch for anyone interested in game engines and classical physics. Oliver presented his game engine [Azrael](https://github.com/olitheolix/azrael), which can run in the Cloud (multiple async processing units). It seems to make it easy to learn, and control physical systems. In his demo, Oliver showed how to algorithmically control one or more spacecrafts to move to a location in 3D by firing thrusters. Very worth showing this to kids.

**[Orchestration and CI/CD with Ansible and OpenStack--Simone Soldateschi](https://www.youtube.com/watch?v=QFPtArm4Wc0).** This talk was interesting to me since it resonates with my opinion about using containers for deployment. I think there is a lot to learn from this talk if you are interested in getting your product out to customer faster. It is also interesting to me that a lot tools that were highlighted in the talk are the same we currently use:

* Ansible
* Docker, but they use CoreOS
* Jenkins
* Packer instead of Dockerfiles
* Vagrant, but we may not need them

I had a follow-up chat with Simone to understand their pipeline better and how they deploy and update containers without disrupting the services. I am interested in presenting a similar LnL on how we use Docker, Packer, Ansible, and Rake.

* Machine-learning talks

  * [Predicting sports winners--Robert Layton](https://www.youtube.com/watch?v=k7hSD_-gWMw)
  * [End-to-end machine learning--Chris Hausler](https://www.youtube.com/watch?v=of6pHdSbtOM)

    Machine learning is a topic of interest to me and these talks sparked my interest to explore <code>scikit-learn</code>.

  * [Realtime websites with Django and Meteor--Tyson Clugg](https://www.youtube.com/watch?v=N9OvbRP5W0g). Worth watching, since this brings the best parts of Meteor framework to Django allowing data changes to be pushed to users (browser and apps) at realtime. One interesting observation that he points out is how this approach is quicker than the traditional server round-trip approach. [Watch](https://youtu.be/N9OvbRP5W0g?t=15m51s).

* Salt seems to be picking momentum; worth exploring.

  * [Why Salt?--Aurynn Shaw](https://www.youtube.com/watch?v=q86LUTxCDPg)
  * [Testing ain't hard, even for SysAdmins--Geoff Crompton](https://www.youtube.com/watch?v=eteKEpoV8Lk)

* [To AST and Beyond - Curtis Maloney](https://www.youtube.com/watch?v=N_Q3i3oaZ6w) was interesting mostly because it was geeky and shows how to create a DSL in Python.

![PyCon photo 3](blog/PyConAustPhoto3.jpg)
