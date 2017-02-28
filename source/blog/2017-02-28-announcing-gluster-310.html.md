---
title: Announcing Gluster 3.10
author: amye
date: 2017-02-28 11:50:54 UTC
tags: community, releases, Gluster
comments: true
published: true
---

![Gluster logo](blog/gluster-ant.png) The Gluster community is pleased to announce the release of Gluster 3.10.

This is a major Gluster release that includes some substantial changes. The features revolve around, better support in container environments, scaling to larger number of bricks per node, and a few usability and performance improvements, among other bug fixes. This releases marks the completion of maintenance releases for Gluster 3.7 and 3.9. Moving forward, Gluster versions 3.10 and 3.8 are actively maintained.  

The most notable features and changes are documented here as well as in [our full release notes on Github](https://github.com/gluster/glusterfs/blob/release-3.10/doc/release-notes/3.10.0.md). A full list of bugs that has been addressed is included on that page as well.

READMORE

## Major Changes and Features

### Brick Multiplexing

Multiplexing reduces both port and memory usage. It does not improve performance vs. non-multiplexing except when memory is the limiting factor, though there are other related changes that improve performance overall (e.g. compared to 3.9).

Multiplexing is off by default. It can be enabled with

    # gluster volume set all cluster.brick-multiplex on

### Support to Display Op-version Information from Clients

To get information on what op-version are supported by the clients, users can invoke the gluster volume status command for clients. Along with information on hostname, port, bytes read, bytes written and number of clients connected per brick, we now also get the op-version on which the respective clients operate. Following is the example usage:

    # gluster volume status <VOLNAME|all> clients

### Support to Get Maximum Op-version in a Heterogeneous Cluster

A heterogeneous cluster operates on a common op-version that can be supported across all the nodes in the trusted storage pool. Upon upgrade of the nodes in the cluster, the cluster might support a higher op-version. Users can retrieve the maximum op-version to which the cluster could be bumped up to by invoking the gluster volume getcommand on the newly introduced global option, cluster.max-op-version. The usage is as follows:

    # gluster volume get all cluster.max-op-version

### Support for Rebalance Time to Completion Estimation

Users can now see approximately how much time the rebalance operation will take to complete across all nodes.

The estimated time left for rebalance to complete is displayed as part of the rebalance status. Use the command:

    # gluster volume rebalance <VOLNAME> status

### Separation of Tier as Its Own Service

This change is to move the management of the tier daemon into the gluster service framework, thereby improving it stability and manageability by the service framework.

This has no change to any of the tier commands or user facing interfaces and operations.

### Statedump Support for gfapi-Based Applications

gfapi-based applications now can dump state information for better trouble shooting of issues. A statedump can be triggered in three ways:

1. By executing the following on one of the Gluster servers,
2. `# gluster volume statedump <VOLNAME> client <HOST>:<PID>`
  * <VOLNAME> should be replaced by the name of the volume
  * <HOST> should be replaced by the hostname of the system running the gfapi application
  * <PID> should be replaced by the PID of the gfapi application
3. Through calling glfs_sysrq(<FS>, GLFS_SYSRQ_STATEDUMP) within the application
  * <FS> should be replaced by a pointer to a glfs_t structure

All statedumps (*.dump.* files) will be located at the usual location, on most distributions this would be /var/run/gluster/.

Disabled creation of trash directory by default

From now onwards trash directory, namely .trashcan, will not be be created by default upon creation of new volumes unless and until the feature is turned ON and the restrictions on the same will be applicable as long as features.trash is set for a particular volume.

### Implemented Parallel readdirp with Distribute xlator

Currently the directory listing gets slower as the number of bricks/nodes increases in a volume, though the file/directory numbers remain unchanged. With this feature, the performance of directory listing is made mostly independent of the number of nodes/bricks in the volume. Thus scale doesn’t exponentially reduce the directory listing performance. (On a 2, 5, 10, 25 brick setup we saw ~5, 100, 400, 450% improvement, respectively.)

To enable this feature:

    # gluster volume set <VOLNAME> performance.readdir-ahead on
    # gluster volume set <VOLNAME> performance.parallel-readdir on

To disable this feature:

    # gluster volume set <VOLNAME> performance.parallel-readdir off

If there are more than 50 bricks in the volume it is good to increase the cache size to be more than 10Mb (default value):

    # gluster volume set <VOLNAME> performance.rda-cache-limit <CACHE SIZE>

### md-cache Can Optionally -ve Cache security.ima xattr

From kernel version 3.X or greater, creating of a file results in removexattr call on security.ima xattr. This xattr is not set on the file unless IMA feature is active. With this patch, removxattr call returns ENODATA if it is not found in the cache.

The end benefit is faster create operations where IMA is not enabled.

To cache this xattr use,

    # gluster volume set <VOLNAME> performance.cache-ima-xattrs on

The above option is on by default.

### Added Support for CPU Extensions in Disperse Computations

To improve disperse computations, a new way of generating dynamic code targeting specific CPU extensions like SSE and AVX on Intel processors is implemented. The available extensions are detected on run time. This can roughly double encoding and decoding speeds (or halve CPU usage).

This change is 100% compatible with the old method. No change is needed if an existing volume is upgraded.

You can control which extensions to use or disable them with the following command:

    # gluster volume set <VOLNAME> disperse.cpu-extensions <type>

Valid values are:

* none: Completely disable dynamic code generation
* auto: Automatically detect available extensions and use the best one
* x64: Use dynamic code generation using standard 64 bits instructions
* sse: Use dynamic code generation using SSE extensions (128 bits)
* avx: Use dynamic code generation using AVX extensions (256 bits)

The default value is ‘auto’. If a value is specified that is not detected on run-time, it will automatically fall back to the next available option.

## Bugs Addressed

Bugs addressed since release-3.9 are listed in our [full release notes](https://github.com/gluster/glusterfs/blob/release-3.10/doc/release-notes/3.10.0.md).
