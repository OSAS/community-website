---
title: "Trying out oVirt's Probabilistic Optimizer"
author: jbrooks
date: 2015-02-11 21:57:48 UTC
tags: ovirt, scale, optaplanner, docker
comments: true
published: true
---

![](blog/oVirt-logo.png) Next week in Los Angeles, I'll be [giving a talk](http://www.socallinuxexpo.org/scale/13x/presentations/solving-np-hard-scheduling-problems-ovirt-and-optaplanner) at the [SCALE 13x](http://www.socallinuxexpo.org/scale/13x) conference on oVirt's new [OptaPlanner-powered](http://www.optaplanner.org/) scheduling adviser.

Martin Sivák wrote a [great post](http://community.redhat.com/blog/2014/11/smart-vm-scheduling-in-ovirt-clusters/) about the feature a couple of months ago, but didn't cover its installation process, which still has a few rough edges. 

Read on to learn how to install the optimizer, and start applying fancy probabilistic fu to your oVirt VM launches and migrations.

READMORE

I started off with a minimal install of CentOS 6, running in a VM hosted by my oVirt installation. To this, I added the oVirt software repository, followed by the ovirt-optimizer package:

````
yum install -y http://resources.ovirt.org/pub/ovirt-3.5/rpm/el6/noarch/ovirt-release35-002-1.noarch.rpm

yum install -y ovirt-optimizer-jboss7.noarch
````

The optimizer communicates with the oVirt engine through port 8080, so we need to allow access on this port:

````
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT

/etc/init.d/iptables save

service iptables reload
````

I found that after the optimizer was running for a while, I hit the `java.lang.OutOfMemoryError ` error mentioned on the [oVirt wiki](http://www.ovirt.org/Features/Optaplanner#java.lang.OutOfMemoryError), so, following the wiki's advice, I edited `/usr/share/ovirt-engine-jboss-as/bin/standalone.conf` to match the example provided:

````
JAVA_OPTS="-Xms2048m -Xmx8192m -XX:MaxPermSize=256m -Djava.net.preferIPv4Stack=true"
````

Now, edit `/etc/ovirt-optimizer/ovirt-optimizer.properties` and edit the `server`, `username`, and `password` values to match those for your oVirt engine, and then start up the optimizer:

````
vi  /etc/ovirt-optimizer/ovirt-optimizer.properties

/usr/share/ovirt-engine-jboss-as/bin/standalone.sh -b 0.0.0.0
````

Once the optimizer is up and running, head over to your oVirt engine to install the engine half of the optimizer:

````
yum install -y ovirt-optimizer-ui
````

Next, edit the file `/etc/ovirt-engine/ui-plugins/ovirt-optimizer-config.json` to provide the http address of your optimizer service, which will look something like `http://$YOUR_IP_ADDRESS:8080/ovirt-optimizer/result/`.

Finally, restart the oVirt engine service:

````
service ovirt-engine restart
````

As noted in the [oVirt wiki](http://www.ovirt.org/Features/Optaplanner#Data_refresh_failed:_undefined), I had to visit `about:config` in my Firefox browser, and set `security.mixed_content.block_active_content` to `false` for the optimizer's results to show up in my engine's web console.

Once I did, I could visit the "Optimzer Result" sub-tab within the "Clusters" tab in the oVirt web admin console to view the suggested optimizations for my environment.

![](blog/optimizer.png)

Finally, if you're itching to try all this out in a more buzzword-compliant fashion, you're in luck! [Roy Golan](https://twitter.com/_royg_) just put together a dockerized-method of running the optimizer. I haven't tested it out yet for myself, but you can follow up on it (and let me know how it goes) at Roy's [github repo here](https://github.com/rgolangh/Fedora-Dockerfiles/tree/ovirt-optimizer/ovirt-optimizer).

That's it for now -- I hope to see you in Los Angeles at SCALE next week!
