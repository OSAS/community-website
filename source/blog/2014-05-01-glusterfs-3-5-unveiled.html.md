---
author: ewillson
layout: post
comments: true
title: GlusterFS 3.5 Unveiled
date: 2014-05-01 17:08 UTC
tags:
- GlusterFS
categories:
- Blog
---
![](blog/gluster-ant.png)
We are pleased to announce that GlusterFS 3.5 is now available. The latest release includes several long-awaited features such as improved logging, file snapshotting, on-wire compression, and at-rest encryption.

You can [download GlusterFS 3.5](http://download.gluster.org/pub/gluster/glusterfs/) now.

##What's New?

There's a lot to like in the new release. Here's a preview of what GlusterFS 3.5 includes:

READMORE

+ AFR_CLI_enhancements: Improved logging with more clarity and statistical information. Additional clarity in logging has been on the wish list for the Gluster community for some time. This improvement addresses eight different bugzilla issues in one fell swoop. It allows visibility into why a self-heal process was initiated and which files are affected, for example. Prior to this enhancement, clearly identifying split-brain issues from the logs was often difficult for an end user or administrator, and there was no facility to identify which files were affected by a split brain issue automatically. Remediating split brain without quorum will still require some manual effort, but with the tools provided this will become much simpler. 

+ Exposing Volume Capabilities: Provides client-side insight into whether a volume is using the BD translator and, if so, which capabilities are being utilized.

+ File Snapshot: Provides a mechanism for snapshotting individual files. One of the more anticipated features of the 3.5 release, this precedes the upcoming ability to snapshot entire volumes. The most prevalent use case for this feature will be to snapshot running VMs, allowing for point-in-time capture. This also allows a mechanism to revert VMs to a previous state directly from Gluster, without needing to use external tools.

+ GFID Access: A new method for accessing data directly by GFID. With this method, we can consume the data in changelog translator, which is logging 'gfid' internally, very efficiently. This feature yet again extends the methods by which you can access Gluster, and should be well-received by members of the developer community, who will have a simple way to perform file operations programmatically within a Gluster volume. 

+ On-Wire Compression + Decompression: Use of this feature reduces the overall network overhead for Gluster operations from a client. Depending on workload, this could show dramatic increases in the performance of Gluster volumes. This feature also allows a good trade-off of CPU to network resources, which will be a boon to most users as CPU is not generally being consumed to anywhere near its full potential, whereas network has traditionally been the bottleneck in high performance workloads. 


+ Prevent NFS restart on Volume change (Part 1): Previously, any volume change (volume option, volume start, volume stop, volume delete, brick add, etc.) would restart the NFS server, which led to service disruptions.This feature allow modifying certain NFS-based volume options without such interruptions occurring. Part 1 is anything not requiring a graph change.

+ Quota Scalability: Massively increase the amount of quota configurations from a few hundred to 65536 per volume.

+ readdir_ahead: Gluster now provides read-ahead support for directories to improve sequential directory read performance.

+ zerofill: Enhancement to allow zeroing out of VM disk images, which is useful in first time provisioning or for overwriting an existing disk.

+ Brick Failure Detection: Detecting failures on the filesystem that a brick uses makes it possible to handle errors that are caused from outside of the Gluster environment.

+ Disk encryption: Implement the previous work done in HekaFS into Gluster. This allows a volume (or per-tenant part of a volume) to be encrypted "at rest" on the server using keys only available on the client. [Note: We encrypt only content of regular files. File names are not encrypted! Also, encryption does not work in NFS mounts.]

+ Geo-Replication Enhancement: A massive rewrite of the existing geo-replication architecture, this set of enhancements brings geo-replication to an entirely new level. Previously, the geo-replication process, gsyncd, was a single point of failure as it only ran on one node in the cluster. If the node running gsyncd failed, the entire geo-replication process was offline until the issue was addressed. The original geo-rep was a vast improvement over plain rsync checksumming and made intelligent use of xattrs to identify a reduced list of candidates for block- or file-level copy, massively improving on full directory crawls performed by rsync. In this latest incarnation, the improvement is extended even further by foregoing use of xattrs to identify change candidates and directly consuming from the changelog, which will improve performance twofold: one, by keeping a running list of only those files that may need to be synced; and two, the changelog is maintained in memory, which will allow near instant access to which data needs to be changed and where by the gsync daemon.

To learn more about GlusterFS, visit [gluster.org](http://www.gluster.org/), follow the project on Twitter at [@gluster](https://twitter.com/gluster), and join the [mailing lists](http://www.gluster.org/interact/mailinglists/). 
