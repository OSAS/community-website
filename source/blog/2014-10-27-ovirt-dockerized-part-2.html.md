---
title: 'oVirt Dockerized: Part 2'
author: mgoldboim
date: 2014-10-27 22:39:49.000000000 Z
tags: oVirt, Docker, container, virtualization, Linux
published: true
comments: true
---

![](blog/oVirt-logo.png)Yesterday in [oVirt Dockerized: Part 1](/blog/2014/10/ovirt-dockerized/), we learned how to run oVirt on a virtual machine or server, and the "fun part" of making oVirt go. In Part 2, we dive deeper into running oVirt with a remote database and as a standalone container, interactive configuration of an oVirt container, and how to clean up your environment.

## Run oVirt with a Remote Database

In this scenario, the oVirt container is connected to the data containers and are linked within the same namespace

<pre>cd oVirt-Dockerized/Run && sudo make ovirt-run</pre>
![](blog/ovirt-dockerized_newpt2.png){:align="center"}

READMORE

## Run oVirt as a Standalone Container

Here, there is one container with the engine and a database.

<pre>cd oVirt-Dockerized/Run && sudo make ovirt-SA-run</pre>

The above commands will use the images on the [mgoldboi/ovirt*](https://hub.docker.com/u/mgoldboi/) Docker registry. If you want to build or rebuild your own images, you can fork or clone the [oVirt-dockerzied](https://github.com/mgoldboi/oVirt-Dockerized) repo and examine the [Build/Makefile options](https://github.com/mgoldboi/oVirt-Dockerized/blob/master/Build/Makefile). Some examples include:

## Interactive Configuration of oVirt Container
    
<pre>cd oVirt-Dockerized/Build && sudo make ovirt-manual</pre>

Build your custom auto-configuration by changing the [answer file](https://github.com/mgoldboi/oVirt-Dockerized/blob/master/Build/DockerFiles/ovirt-SA/ovirt-engine-35-localdb.conf) values.

<pre>cd oVirt-Dockerized/Build && vim DockerFiles/ovirt-SA/ovirt-engine-35-localdb.conf</pre>

You can start by changing the password: 

<pre> OVESETUP_CONFIG/adminPassword=str:ovirt</pre>

Or you can configure your hostname fqdn: 

<pre>OVESETUP_CONFIG/fqdn=str:localhost</pre>

Once you are done with such changes, you can build it:

<pre>sudo make ovirt-SA</pre>

You can watch the build process proceed and oVirt being configured with your custom values. This will create an <code>ovirt-sa-configured-3.5.0</code> package in your local repo. You can then list the images you have using

<pre>sudo docker images</pre>

and finally make it run:

<pre>cd oVirt-Dockerized/Run && sudo make ovirt-SA-run</pre>

## Clean Your Environment

To stop and remove your oVirt containers, run 
    
<pre>make clean</pre>

Remember, this command doesn’t touch images; those can be removed with 
    
<pre>docker rmi image_name</pre>