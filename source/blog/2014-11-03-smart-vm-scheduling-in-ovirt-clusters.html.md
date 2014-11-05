---
title: 'Smart VM Scheduling in oVirt Clusters '
author: msivak
date: 2014-11-03 16:51:05 UTC
tags: oVirt, clusters, virtualization
comments: true
published: true
---

![](blog/oVirt-logo.png) In this article, I will talk about a new project we have just published as part of our [oVirt 3.5 release](http://www.ovirt.org/OVirt_3.5_Release_Notes). The new scheduler I am going to describe will enable you to perform non-trivial migration steps to utilize a cluster's resources better. The scheduler will also help you with starting a new VM that does not immediately fit any of your nodes.

## Introduction to oVirt Scheduling

Before I get to the actual feature, I will describe how scheduling works without it. [oVirt](http://www.ovirt.org/) is a virtual datacenter management solution and the scheduler is one of the critical components. The three major tasks to use scheduling for are:

* Selecting the host on which to place the newly started virtual machines
* Selecting the migration destination for migrating VMs
* Determining which VMs have to be migrated elsewhere

READMORE

I'll focus on how to deal with the first two cases in the current oVirt engine. oVirt uses a modified OpenStack Nova approach. The scheduler evaluates a set of filter and weight modules to compute the best host, as you can see in the following image:

![](blog/smartvm/Hosts.png)

The process begins with a list of all active host machines, and then evaluates the filter rules one by one. Each filter removes all hosts that are not suitable to run the VM. The following filter gets only the remaining hosts.

After the final list of hosts is assembled, the weight modules are executed. Each module computes a weight score for each host and multiplies it by its configured factor. All scores from all modules are then added together and the host with best score wins.

This process works fairly well when a single virtual machine is about to start. The first sign of trouble appears once there are more VMs that need to be started together or shortly after each other. For a VM to get into the Running state takes some time, but you still must count it while scheduling the following VMs. This forces you to serialize the scheduling and keep track of all VMs that were scheduled already, but are not running yet. In simple terms, you must reserve the resources for the VMs one-by-one.

Now I'll show two examples of scheduling with a simple balancing rule: the host with the biggest amount of free memory wins. Four VMs are to be scheduled, three (A, B, C) with 1GB of RAM and one (D) with 3GB of RAM.

This is what you get when starting the VMs in the A, B, C, D order:

![](blog/smartvm/17.png)

And this is what happens when you reverse the order (D, C, B, A):

![](blog/smartvm/17_002.png)

As you can see the result differs quite significantly. The scheduler can't do any better without knowing about the future start requests.

There is another situation that we cannot handle with the current scheduler. Consider a cluster where some VMs are already running on both hosts. A new VM is about to start, but it does not fit into any free-space segment of available hosts.

![](blog/smartvm/wheretostart.png)

Starting the new VM would be possible if you were able to compute more steps and migrated one of the small VMs to make space first. Alas, the current scheduler does not support that.

## Getting Smarter About Scheduling

Now I'll dig into the [new oVirt optimizer](https://www.ovirt.org/Features/Optaplanner) project.

The optimizer's goal is to provide a scheduling service that does not have the previously mentioned shortcomings, but still obeys the oVirt scheduling rules. Also, developers wanted to create a separately running scheduling service to avoid loading the current oVirt engine solution, which deals with more than scheduling (for example, storage, networks, and administrator's console). The solution is to run the optimizer service on a separate machine, collect data from the primary oVirt management engine, and then provide the computed results to the admin in the webadmin console by the means of a UI plugin.

![](blog/smartvm/cluster-architecture.png)

The service itself is based on cooperation with the [OptaPlanner project](http://www.optaplanner.org/). OptaPlanner is an probabilistic optimization library based on [Drools](http://www.drools.org/).


The basic probabilistic optimization approach is to:

1. Prepare a random solution
2. Compute its score
3. Compare to the best known solution
4. Save if better than the best solution
5. Go back to step 1

This probabilistic approach is necessary because the problem faced here (the [machine reassignment problem](http://challenge.roadef.org/2012/en/)) is [NP-hard](http://en.wikipedia.org/wiki/NP-hard). That computer science term denotes problems that can be solved in a reasonable time only if the computer can see into the future. Because we haven't invented any future-revealing devices yet, we are stuck with less optimal and probabilistic methods.

The first and the second steps are the tricky ones. Using purely [random solutions](http://en.wikipedia.org/wiki/Random_search) will take a long time to find any optimal solution, which is why OptaPlanner [supports multiple optimization algorithms](http://docs.jboss.org/drools/release/6.1.0.Final/optaplanner-docs/html_single/index.html#localSearch), such as simulated annealing or tabu search.

[Simulated annealing](http://en.wikipedia.org/wiki/Simulated_annealing) looks for solutions that are similar to the current best solution, and allows a bigger difference at the beginning and then lowers the allowed difference as time progresses. Thus, the solution can leave a local minima. Unfortunately,  when the task's details are not known in advance, setting the initial "temperature" (the measure of allowed difference) optimally is hard.

Source: wikipedia.org, Kingpin13, CC0: ![gras](blog/smartvm/Hill_Climbing_with_Simulated_Annealing.gif)

That is why developers selected the [Tabu Search](http://en.wikipedia.org/wiki/Tabu_search) algorithm, which also looks for neighbors, but does not limit the maximum distance. Instead, the algorithm remembers the directions and avoids selecting the directions that did not lead to a better solution until certain number of other attempts were made.

The second step of computing the score also is tricky because hitting the local minimum is easier if the score function is not properly tuned. Fortunately, Drools make experimenting with different scoring easier by providing the [DRL pattern matching rule language](http://docs.jboss.org/drools/release/5.2.0.Final/drools-expert-docs/html/ch05.html).

OptaPlanner can use rules like this for scoring. For example, here's what a real simple hard constraint OptaPlanner scoring rule looks like:

![gras](blog/smartvm/hardrule.png)

## How This All Works in oVirt

Now back on the topic of standard oVirt engine scheduling mechanisms, one goal was to obey the scheduling configuration that was set by the cluster's admin. The configuration page is hidden in two places: the Cluster edit dialog and Cluster policies tab in the main Configuration dialog, as seen in the following images:

Cluster edit dialog box: ![gras](blog/smartvm/19_002.png)
Configure Cluster Policy dialog box: ![gras](blog/smartvm/19.png)

The cluster policy lets users enable or disable filter and weight modules, set the factor multiplier (the small -/1/+ left of the weight modules) for weights, and set specific properties for the modules. All of that should be also obeyed by the optimizer service.

The [Java-based policy units](http://gerrit.ovirt.org/gitweb?p=ovirt-engine.git;a=tree;f=backend/manager/modules/bll/src/main/java/org/ovirt/engine/core/bll/scheduling/policyunits;h=2b2c5ca5bda8ff0c9f8ac85b9c5c043dc4adccc8;hb=HEAD) had to be converted to [DRL-based rules](http://gerrit.ovirt.org/gitweb?p=ovirt-optimizer.git;a=blob;f=ovirt-optimizer-core/src/main/resources/org/ovirt/optimizer/service/rules/default.drl;h=537e16573ce59685e511e9fd5b9573cef1ba852d;hb=HEAD) for this to happen. Unfortunately, some information that is accessible from the Java code is not exposed through the REST API or it is exported in a form not directly usable in the DRL pattern-matching approach. For that reason, more complicated rules, such as hosted engine score filters, CPU load-based balancing, or affinity, are not fully supported by the oVirt 3.5 optimizer.

Available information for a cluster is periodically acquired by the optimizer over [oVirt's REST API](http://www.ovirt.org/REST-Api) and converted to KIE (Knowledge is everything) facts. Those are then fed to the OptaPlanner's fact database, to be used in the pattern-matching rules. The performance is improved by caching all rule matches. OptaPlanner must be notified of the fact changes so the caches are properly invalidated.

![gras](blog/smartvm/deep-dive-entities.png)

The rule file is the last remaining piece before the solver can do anything. Earlier I provided an example of a simple hard constraint rule, so here is an example of a more complicated soft constraint rule:

![gras](blog/smartvm/softrule.png)

All previous parts (facts and rules) are then used together by the OptaPlanner solver engine to compute the result. The optimizer service keeps running and improving the solution. When something in the cluster changes, the facts update and the solver resumes using the current best solution as a base point.

So what does a solution look like?

In the past, only the "optimal" VM for host assignment was computed, but the developers quickly learned that this is not enough. Some solutions look good ... until someone tries to implement them.

Here is an artificial example that shows current and "optimal" solutions:

![gras](blog/smartvm/18_002.png)

And here is the same solution, but with the actual required steps:

![gras](blog/smartvm/18.png)

As you can see, the solution itself fits, but it is not reachable.

A different solution model avoids this issue by computing "migration steps" and recomputing all intermediate situations when a VM or host reference is changed in any step. That way, you can still use pattern matching and also prevent hard constraint violations within the intermediate steps.

I described all the internal integration pieces, and now I'll demonstrate how results are reported to the administrator. As I mentioned, [UI plugin](http://www.ovirt.org/Features/UIPlugins) is used for that, and you can find it as "Optimizer result" subtab within the Cluster list view.

![gras](blog/smartvm/optclusterview.png)

The content refreshes every 30 seconds and uses the REST API to get information from the optimizer. The received structure only contains UUIDs, so the plugin also queries the oVirt engine's REST to get details about hosts and VMs.

Raw optimizer solution: ![gras](blog/smartvm/restresponse.png)
UI plugin showing a solution (not the same): ![gras](blog/smartvm/optui.png)

The administrator can push the Cancel, Start, or Migrate buttons to initiate the compute actions or cancel the Optimize VM Start task.

Asking the optimizer to compute a start sequence needed for a certain VM to start is also easy. In the VM view, right click on the VM and select *Optimize start*. The same can be done using the menu as well.

If you noticed the Freeze solution button on the solution page and are wondering what it is for, imagine what happens when an administrator tries to perform some steps from the solution and refresh comes early. The page may drastically change. Instead, the administrator can pause the refresh cycle to have a nice stable page with which to work. Still, the optimizer service is queried periodically and confirm that the displayed solution is reachable.

![gras](blog/smartvm/frozen.png)

That completes the tour of the new optimizer service, and if you found this interesting, try it out. An installation video will be published soon, and the [silent video draft](https://dl.dropboxusercontent.com/u/13472947/optimizer-installation-silent-draft.m4v) is already available.

If you have comments for developers, send them to users@ovirt.org or find us on irc.oftc.net / #ovirt.
