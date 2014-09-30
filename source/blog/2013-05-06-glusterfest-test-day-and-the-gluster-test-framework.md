---
author: jbrooks
comments: true
date: 2013-05-06 15:16:18+00:00
layout: post
slug: glusterfest-test-day-and-the-gluster-test-framework
title: GlusterFest Test Day and the Gluster Test Framework
wordpress_id: 251
categories:
- Blog
tags:
- gluster
- howto
---

The first beta of glusterfs 3.4 is [scheduled for release](http://www.gluster.org/pipermail/gluster-users/2013-May/035995.html) tomorrow, and the project plans to greet this new beta with [GlusterFest](http://www.gluster.org/community/documentation/index.php/GlusterFest): a 24-hour test day, starting at 8pm PDT May 7/03:00 UTC May 8.

Since I plan on participating in the testing, I thought it'd be a good idea to study up on Gluster's new test framework. You can learn all about the test framework in [the video](http://www.youtube.com/watch?v=dy8lPtZ7B14) below, but I'll also walk you through a brief testing experience of my own using the pre-beta code running on my Fedora 18 test machine.

<iframe width="560" height="315" src="//www.youtube.com/embed/dy8lPtZ7B14" frameborder="0" allowfullscreen></iframe>

The Gluster framework makes use of the app "prove" which is provided, for Fedora and related OSes, by the package "perl-Test-Harness." (note: to figure out which package to install, I used the command "yum provides prove")

    sudo yum install -y perl-Test-Harness

To get the test framework itself, I headed over to the [shiny new Gluster Forge](http://www.gluster.org/2013/04/introducing-the-gluster-community-forge/) to grab the source code, pull it down, to my test machine, and check out the 3.4 release branch:

    git clone git://forge.gluster.org/glusterfs-core/glusterfs.git
    git checkout origin/release-3.4

When Gluster Fest commences, there will be new glusterfs 3.4 beta 1 packages to install and test out, but for my pre 'Fest test, I built new packages from the source I pulled down from git.

My colleague [Justin Clift](https://twitter.com/realjustinclift) has written up a very nice howto for building Gluster RPMs from source, which you can also [find at the Gluster Forge](https://forge.gluster.org/gluster-docs-project/gluster-docs-project/blobs/master/htmltext/CompilingRPMS.asc).

With my freshly-built glusterfs, glusterfs-server & glusterfs-fuse packages installed, I entered the glusterfs source directory and ran one of the "basic" tests. Note: before you run any of these tests, be aware that they delete "/var/lib/glusterd/*" in the course of creating test volumes and data and cleaning up after themselves. For more README-type information, [see the README](https://forge.gluster.org/glusterfs-core/glusterfs/blobs/master/tests/README).

    cd glusterfs
    sudo prove ./tests/basic/bd.t

The test returned a passing result, which is great, but kind of boring. More interestingly, the second test I ran did not run successfully:

    sudo prove ./tests/basic/mount.t

This test returned an error while attempting to mount a test volume over the NFS protocol, which is one of the ways you can consume Gluster storage.

    mount.nfs: access denied by server while mounting MY_HOSTNAME:/patchy

Debugging time! Following guidance gleaned from the #gluster irc channel, I edited the mount.t test file to add a line containing "set -x" following the first instance of "cleanup;" in the file. I ran the test again, and it spit out a good deal more output, including the command being run to try and mount the volume:

    mount -t nfs -o vers=3,nolock,soft,intr MY_HOSTNAME:/patchy /mnt/nfs/0

I could see that the test was, rightly, attempting to mount the volume with NFS version 3 (Gluster's built-in NFS server doesn't support version 4), so that wasn't the problem. I also checked my SELinux log for denials (sudo tail -f /var/log/audit/audit.log | grep denied) and didn't find any issues. I consulted my /var/log/messages as well, and found the following error message:

    rpc.mountd[5465]: refused mount request from MY_IP_ADDRESS for /patchy (/patchy): unmatched host

After a little while Googling around, I remembered something I'd encountered while tangling with [Gluster / oVirt integration last year](http://blog.jebpages.com/archives/ovirt-3-1-glusterized/): Gluster's NFS server doesn't play nice with another running NFS server. I checked to see if I had an NFS server running on my test machine (sudo service nfs-server status), and, sure enough, I did.

I shut the server down (sudo service nfs-server stop), re-ran my mount.t test, and -- hooray -- it completed successfully.

That's perhaps not the most exciting example of Gluster's test framework in action, but it should give you a sense of how to use it, and, when tests fail, how to go about figuring out why.

I hope to see you, virtually, at the GlusterFest this week. I'm jbrooks in the #gluster irc room -- please drop in on Wednesday (or any time) and say hello.
