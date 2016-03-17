---
title: "Parsing Technology: Software Collections and Containers"
date: 2016-03-17 13:00 UTC
tags: containers, software collections, howto
author: bkp
published: true
comments: true
---
![Software Collections logo](blog/softwarecollections-logo.png) Even working at Red Hat, it can be very challenging to keep up on all the latest technologies that permeate through our upstream projects and downstream products. No sooner than you can get your head wrapped around the notion of [virtual datacenters vs. cloud computing](http://www.enterprisenetworkingplanet.com/netsysm/article.php/3921201/Migrate-to-a-Private-Cloud-Not-a-Virtual-Datacenter.htm), now all of a sudden you have to learn about containers. And don't even get me started on tools like [Atomic App](http://www.projectatomic.io/docs/atomicapp/) and [Nulecule](http://www.projectatomic.io/docs/nulecule/).

One of the things that's always bothered me a little bit about containers is that, on the surface, they seem to overlap a lot with the functionality of other technologies. When I hear someone talking about containerizing something like Fedora or openSUSE, it's pretty easy to think of containers as just fancy portable virtual machines&mdash;even though there is not a speck of hypervisor technology anywhere inside of container architecture. But from an initiate's point of view, it is easy to see how the overlapping functionalities can blur the perception between containers and virtual machines.

READMORE

Fortunately, it's not too hard to start sharpening that focus. Many times, containers *don't* hold a complete operating system within. Indeed, one of the biggest advantages of using containers (aside from their portability) is the fact that you don't need all of an entire OS to run an application within a container&mdash;you just need enough operating system to *specifically* run that application. Anything else the app needs can be picked up from either other containerized services or the Linux kernel that's running on the host machine.

You can't do that with virtual machines. Applications within a virtual machine need the whole operating system in there with them. Now, you can make those operating systems really minimalist, but at the end of the day, you still need to have an *entire* OS in a virtual machine.

There are more differences, of course, but that's a big one.

## Software Collection Libraries and Containers

Another functional area that seems to have a lot of redundancies with containers is [software collection libraries](https://www.softwarecollections.org/en/).

If you are not familiar with SCLs, or software collections as they are also called, they are deployment constructs that enable developers to build and concurrently install multiple versions of the same software components on a given machine.

Let's try that in less-tech speak.

Usually when you install a new version of software on a Linux device, that new version supplants and replaces the older version on that machine. Like updating Fedora 23 to Fedora 24&mdash;all the old code goes away. But developers building applications for Linux may need that older code to stick around to make their application run more efficiently or, frankly, at all. It's not just older versions; developers may also prefer to use new beta or bleeding-edge versions of software. Software collections enable you to do work either way; they have no impact on the system versions of the packages installed by any of the conventional RPM package management utilities.

So if my application needs some version of Python 2, a software collection will enable me to install Python 3.X on a machine and *not* wipe away the Python 2 software my application needs.

At this point you might be thinking that I, as a developer, am being lazy&mdash;just re-tool my application to run with Python 3 and get with the times. That's all well and good, *if* I could be assured that every machine that my app will run on will have the version of Python (or whatever) I need. Remember, there are servers out there still running CentOS and RHEL 5 or even earlier. Software collections enable me to ensure my app has the software tools it needs without breaking all the other apps running on the destination production server.

Breaking things, I have been told, is apparently bad. Go figure.

But now that we have containers, why do we need to mess around with software collections? After all, one of the touted benefits of containers is the capability to break out services that a containerized application needs into other containers. So if your app needs Python 2 you can just point your app's container at a Python 2 container sitting around and go from there.

While this is indeed the case, you may also discover that trying to track containers that hold different versions of multiple services might also be a cause of hair loss. I recently saw an [excellent presentation from Fedora's Langdon White at FOSDEM](https://fosdem.cu.be/2016/k4201/do-software-collections-still-matter.mp4) that addressed this very concern. Better, Langdon suggested, to use software collections within your containers to help maintain concurrent versions of a service. In that way, you can point your app at a "Python" container with multiple versions of Python inside and your app will get what it needs.

Another way to use software collections in containers is even when you *haven't* decomposed your app into services. A container that holds a single monolithic app and all of the libraries and tools it needs may still have conflicting versions of those tools, and a software collection added to that container would help resolve that issue as well (though admittedly that might be overkill, Langdon said).

SCLs, Langdon added in his presentation, can make it a lot easier to build your containers. With the SCL functionality available, you can build very specific versions of a given software and then plunk that into your Docker container as needed.

I spoke with Langdon recently about this subject, and he had an additional advantage of using software collections and containers. On the operations side of the house, sysadmins and operators who need to maintain code coming from specific vendors or FOSS projects will find that using software collections will make tracking the provenance of such code much easier, because code within a software collection inside a container will be a call to a project or vendor, while the other code in the container will belong to the application developer. Developers can also benefit from knowing which code in the container is project-supported and which code is supported by in-house teams.

## Obsolete Obsolescence

One of the memes that gets bandied about in technology&mdash;and open source is no exception&mdash;is that new technology makes old technology *obsolete*.

I would argue that this is not always the case; virtual machine and software collections aren't rendered useless by containers. Instead, containers enable developers and system administrators use these existing tools in new ways.

As complex as this landscape of tools may seem, the general principles should remain the same: use your tools in ways that make your development, deployment, and production workflows as automated and as simple as possible.
