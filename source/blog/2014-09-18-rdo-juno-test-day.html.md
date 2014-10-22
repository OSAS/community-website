---
author: rbowen
comments: true
layout: post
title: RDO Test Days for OpenStack Juno M3
date: 2014-09-18 19:30 UTC
tags:
- CentOS
- RHEL
- Fedora
- OpenStack
- Juno
categories:
- Blog
---
![](blog/rdo-logo.png)
Calling OpenStack users! Want to help make OpenStack dead easy to install on CentOS, Fedora, and/or RHEL? Join us for the next test days in early October. The OpenStack Juno release is getting closer and the [RDO community is planning to run test days](https://openstack.redhat.com/RDO_test_day_Juno_milestone_3) on October 1, 2014 and October 2, 2014. 

The RDO team will be providing packages for CentOS, Fedora, and RHEL:

- CentOS 7
- RHEL 6.5
- RHEL 7
- Fedora 20
- Fedora 21

You'll want to have a **fresh** install of one (or more, if you're ambitious) of the operating systems listed, and join the RDO team on Freenode in the #rdo channel. 

READMORE

## Other Testing Tips

The RDO team has [test cases](https://openstack.redhat.com/RDO_test_day_Juno_milestone_3_test_cases) on the site that cover Packstack-based installation of networking, storage, and miscellaneous components. Additional test cases ahead of the test days are, of course, welcome. 

Look to see if any [workarounds are required](https://openstack.redhat.com/Workarounds) for your platform before running tests. (Example: [Could not enable mysqld on CentOS 7](https://bugzilla.redhat.com/show_bug.cgi?id=1138701).)

Plan to keep copious notes. Even if you've installed OpenStack 100 times, the best testing is done when looking at the process as a beginner. Step through tests deliberately, keep good notes, and [review others' notes](https://etherpad.openstack.org/p/rdo_juno_test_day_oct_2014). 

Be ready to report any problems to [Bugzilla](https://bugzilla.redhat.com/), and add results to the [TestedSetups](https://openstack.redhat.com/TestedSetups) page. 

Of course, you don't have to wait for the test days to jump in &ndash; feel free to test ahead of time and report results early.
 
Questions? Find us in the #rdo channel on Freenode, or the [rdo-list](https://www.redhat.com/mailman/listinfo/rdo-list).