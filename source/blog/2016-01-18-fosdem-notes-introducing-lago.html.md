---
title: FOSDEM Notes&mdash;Introducing Lago
date: 2016-01-18 17:14 UTC
author: dcaro
tags: FOSDEM, events, Lago
published: true
comments: true
---
![Lago logo](blog/lago.png) There's a lot of movement lately around containers to run tests and development environments, but not all the applications are ready to run inside them, maybe because they are legacy applications, that rely on some system details to be able to run, or because they are applications that require to access those system details, like for example, [oVirt](http://www.ovirt.org), a virtualization platform for the data center.

So in oVirt, we found that containers were not a strong fit to create reproducible and meaningful testing environments that would give
insight on the possible failures when running on real metal. We wanted an easy way to let developers run those tests locally on their
laptops the same (or as similar as possible) way as they run on continuous integration, where we have big servers. Here is where the Lago project comes in play!

READMORE

Lago is a tool to create ad-hoc virtual testing environments for your tests. It leverages the power of widely used and tested tools like
qemu-kvm, libvirt, or libguestfs to enable you to easily build and setup complex testing environments made up of one or multiple virtual
machines with custom network configuration in a matter of seconds. This fast performance happens once the templates are cached; if not, performance highly depends on the network). With a CLI as the main entry point, you can use Lago on any testing framework, or use the python libs and integrate Lago in your tests.

As a beginning project, we are looking for input from the community to make sure that the direction we take makes Lago fit for as many
developers as possible. Every idea is welcome!

I'll be showing Lago and more in depth in my talk at FOSDEM, "[Raiders of the lost testing env](https://fosdem.org/2016/schedule/event/virt_iaas_raiders_of_lost_testing_env/)." I hope to see you there!
