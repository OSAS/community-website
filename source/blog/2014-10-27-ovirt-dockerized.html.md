---
title: 'oVirt Dockerized: Part 1'
author: mgoldboim
date: 2014-10-27 20:23:17.000000000 Z
tags: ovirt, containers, Docker, virtualization, Linux
published: true
comments: true
---

![oVirt logo](blog/oVirt-logo.png) As we moved toward the [release of oVirt 3.5.0](http://www.ovirt.org/OVirt_3.5_Release_Notes), the oVirt team started exploring how can we maximize the ease of the deployment process. Steps have already been taken in that direction, with the migration to [otopi based setup infra](http://www.ovirt.org/Features/Otopi_Infra_Migration), [hosted engine](http://www.ovirt.org/Features/Self_Hosted_Engine), and [oVirt virtual appliance](http://www.ovirt.org/Feature/oVirtAppliance). But still there is nothing like “Poof! I got oVirt!!” for any major Linux distribution. Until now. 

Running oVirt now can take only a matter of seconds. Depending on your Internet connection, by the time you finish reading this article, you could have an ovirt-engine 3.5.0 GA instance up and running, thanks to [Docker](https://www.docker.com/whatisdocker/).

To run oVirt on a virtual machine or server of [your favorite Linux distro](https://docs.docker.com/installation/), use this command after installing Docker on your system:

<pre>docker run --privileged -dt -p 80:80 -p 443:443  --name ovirt goldboi/ovirt-sa-configured-3.5.0</pre>

With this single Docker command, you can download and install a working instance of oVirt in moments. Downloading the Docker image layers will take some time, but because the container should already be local, things will even run much faster the next time you run this Docker command. You can also use one of its parent images in building new images [using Docker cache](https://crosbymichael.com/dockerfile-best-practices.html).

I'd like to discuss the work process done on this project. If you just want to play around, jump over to “The Fun Part” section.

READMORE

# Behind the Docks

As a rule for this project, I decided to make sure I could automate the build/configuration process and go with the “just make it work” approach. But this approach possibly made things rough around the edges for now.

The first candidate for “dockerization” was the oVirt Engine. I wanted to use the Docker layers structure, creating a base image with oVirt packages deployed, and then add a configuration layer on top of that base image.

![](blog/ovirt-configuration.png){:align="right"}

In the base image ([Dockerfile](https://github.com/mgoldboi/oVirt-Dockerized/blob/master/Build/DockerFiles/ovirt-rpm/Dockerfile), I decided to go with oVirt's RPM deployment over a Fedora 20 container, and use [systemd hack](http://developerblog.redhat.com/2014/05/05/running-systemd-within-docker-container/) so we can run oVirt in systemd along with the other services oVirt uses.

To have the “poof” installation effect, [another image](https://github.com/mgoldboi/oVirt-Dockerized/blob/master/Build/DockerFiles/ovirt-SA/Dockerfile) adds a layer of configuration on top of of the base RPM-deployment image. In this configuration layer, we can configure oVirt to work with a remote database, add or remove oVirt capabilities, and basically create a custom configuration. All of which is built atop the same base image.

Working in layers also gives us the option of updating and triggering the containers' build process in a chain. If the Fedora container has been updated with some packages, for example, it can trigger an additional rebuild of the RPM deployment layer, which, once finished, will trigger a new configuration layer build.

Anyone familiar with Docker might expect that the next step would be adding an engine-setup answer file to the container (allowing the configuration of oVirt in a non-interactive mode with a set of parameters), and then running engine-setup from within Docker build. That wasn’t the case. Because setup uses systemd during the oVirt configuration process, it fails a Docker build process. 

Another option is to run the RPM container in [detached mode](https://docs.docker.com/reference/run/#detached-d) and run systemd, connect to it using ssh, and run engine-setup successfully, but I really wanted to be able to do things “automatically.” 

After lots of searches, including running ovirt-setup as a init.d script (ugly!), I found my way to [nsenter](https://docs.docker.com/reference/run/#detached-d). I needed to wrap nsenter with something, so I decided to go with the [Makefile infra](https://docs.docker.com/reference/run/#detached-d), where I can chain/bash and make the build-run-clean process easier.

To allow some persistent storage, I initially went with the specific ovirt-engine [volumes on build process](https://docs.docker.com/reference/run/#detached-d). This provides real persistent storage (when run on the same host), but when I wanted to commit changes to an image (e.g., after configuration), all data on external volumes wasn’t committed. I decided not to expose volumes and go with a [data-only container](https://docs.docker.com/reference/run/#detached-d) only [when running oVirt](https://registry.hub.docker.com/u/mgoldboi/ovirt-sa-configured-3.5.0/).

I then tried to separate oVirt to its different components and follow the Docker principle that each service should run within its own container. Taking out the [database to run in its own container](https://registry.hub.docker.com/u/mgoldboi/ovirt-sa-configured-3.5.0/) was the first step.

To continue and separating the different components of oVirt, the data warehouse (DWH) and oVirt reports were aimed to be packaged in a separate container each. To be independent of IP addresses, I have used the Docker capability to link containers together under the same namespace. However, the bidirectional link between containers feature has yet to be implemented in Docker. Once this feature is supported, it will be trivial to perform this separation and have all links working in the product (e.g., getting to the Reports container from the landing page on the Engine).

# The Fun Part

Docker is fun, so let’s get to the fun part: making oVirt go.

<pre>git clone https://github.com/mgoldboi/oVirt-Dockerized.git</pre>

The prerequisites for this operation include installing the docker-io package and running the docker service: 

<pre>sudo service docker start</pre>

Check back for [Part 2](/blog/2014/10/ovirt-dockerized-part-2/) tomorrow and learn how to run oVirt with a remote database and as a standalone container, how to build an interactive configuration, and how to clean up your environment.