---
author: ewillson
layout: post
comments: true
title: More Fun with Gluster Docker Images
date: 2014-06-25 16:40 UTC
tags:
- Docker
- Gluster
- GlusterFS
- Containers
- Fedora
categories:
- Blog
---
![](blog/gluster-ant.png)
Recently another [Docker image for Gluster](http://www.gluster.org/2014/06/community-gluster-image-on-docker/) was released. More people getting [Gluster](http://www.gluster.org/) images into Docker is fantastic news, but because Docker is essentially brand spanking new, few of us are experts. With that in mind, explaining WHY this is great news might be helpful.  

In the simplest terms, Docker (also referred to as containers), is a way to deploy machine images. *Big deal, we already have kickstart and virtualization, who needs another way to deploy?* Anyone who obsesses about near-instant provisioning with absolutely minimal resource consumption, that's who. In other words, pretty much all of us. An example from my test machine shows that launching the container takes a whopping two seconds:

READMORE

    # docker ps
    
    CONTAINER ID        IMAGE                         COMMAND                CREATED    \
    77b24fbf053a        humble/fed20-gluster:latest   /usr/bin/supervisord   18 seconds ago    \     
    STATUS              PORTS               NAMES
    Up 16 seconds       22/tcp              fedora20-gluster
  
Another benefit is the footprint. The Docker images I have seen typically are less than 200MB to download. The image here is larger because it includes a fair amount of space to play with Gluster. Unless you have specific needs, you don't have to build them from scratch as there is a global registry of every major flavor of Linux out there, and many with specific applications baked right in (as is our case with the Gluster image). You can search for other images at the [Docker Hub Registry](https://registry.hub.docker.com/), or from the command line: `docker search <string>`. 

Maybe you already have rock-solid deploy scripts to your favorite cloud provider, where provisioning times are typically quite fast. That is great, but also comes with a price. Deploying with Docker is free, fast, and because, it uses as few resources as possible---and even those can be tuned, although that is outside the scope of this article---hearing of people deploying hundreds of images running simultaneously to a single machine is not uncommon. You might be able to get a few hundred VMs running on a single box, but typically the performance of the machines is minimal, and the cost of the hardware can be hard to swallow. So Docker, in a nutshell, gives us a great new way to test Gluster.

Before getting started, you must first do a few things. Start by installing the docker-io package (e.g., on my Fedora 20 machine, `yum install docker-io`). There also is an older package called `docker`, which apparently was for system tray replacement for KDE or Gnome. Also having that package is okay, I supposed, but it won't help for our needs here. 

After installing Docker, start the service:

    # systemctl start docker.service

Next, follow the steps outlined in [Part 1](http://www.gluster.org/2014/05/docker-fedora-gluster-run-gluster-containers-using-docker-part-1-2/) of our *Run Gluster Containers Using Docker* instructions on the Gluster blog.

After you have deployed, ssh to the container IP address. (If you are using the  humble/fed20-gluster image, the password is *redhat*). 

To create a test volume from within the container, follow the usual steps:

1. `mkdir -p /export/gluster`
2. `gluster volume create gv0 172.17.0.2:/gluster/export`  (changing the IP to whatever is appropriate)
3. `gluster volume create gv0 172.17.0.2:/export/gluster force`  (we use the *force* command here because we are doing something unsupported, which is fine for our testbed)
4. `gluster volume start gv0`

Simplicity at its finest. After you have done the initial download, deploying another instance is as simple as:

    #docker run --privileged -d --name <new instance name> -i -t 764261ddfd16

Getting another volume set up in the new instance took me less than three minutes, running all the commands manually. That's very useful, for example, when you want to test similar volumes with different settings. Currently the only drawback is that the image by itself is limited to one node. Again, this is perfect for basic test scenarios. 

The [dockit project](https://github.com/humblec/dockit) is working on a solution that allows multiple containers to communicate with each other, which is something I am eager to test. But for now, we can do basic work to "fake" creating distributed or distributed-replicated volumes. 

First, create several folders within the /exports directory:  

    # mkdir -p /export/{1..6}
    # ls /export/
    1  2  3  4  5  6

Although these are not separate filesystems, we will use a special tool called "the power of imagination!" to pretend that they are. As we progress, you will see that functionally the directories will work the same.  

To create a pure distributed volume:

    # gluster volume create gv-dht 172.17.0.2:/export/{1..2}

And to add another volume with distributed-replicated capabilities:

    # gluster volume create gv-afr 172.17.0.2:/export/{3..6}
    # gluster volume info
 
    Volume Name: gv0
    Type: Distribute
    Volume ID: 097eb563-e5db-4b38-8531-bc27a8e2de3d
    Status: Started
    Number of Bricks: 1
    Transport-type: tcp
    Bricks:
    Brick1: 172.17.0.2:/export/gluster
     
    Volume Name: gv-dht
    Type: Distribute
    Volume ID: 0abe6387-bfe5-4a10-9226-3ce8e7e5f051
    Status: Created
    Number of Bricks: 2
    Transport-type: tcp
    Bricks:
    Brick1: 172.17.0.2:/export/1
    Brick2: 172.17.0.2:/export/2
     
    Volume Name: gv-afr
    Type: Distribute
    Volume ID: cdabdef6-bb57-4c7d-ae87-0db4ccb3fc13
    Status: Created
    Number of Bricks: 4
    Transport-type: tcp
    Bricks:
    Brick1: 172.17.0.2:/export/3
    Brick2: 172.17.0.2:/export/4
    Brick3: 172.17.0.2:/export/5
    Brick4: 172.17.0.2:/export/6

Here we see all three volumes that we have created so far. Mount them the same as always:

    # mount -t glusterfs 172.17.0.2:/gv-afr /mnt/gluster 

If you prefer, make three mount points, one for each volume.  

Keep in mind that the total amount of space in the instance is around 8GB, which should be plenty for simple tests; however, that 8GB is shared between *all* the volumes. Remember when we used the `force` option to do something we weren't supposed to? And that's it --- happy testing!
