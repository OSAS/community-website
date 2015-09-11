---
title: Gluster Site Relaunches
date: 2014-07-10 20:37 UTC
author: ewillson
tags:
  - Gluster
  - Middleman
---

![](blog/antmascot.png) This week we are excited to give the [gluster.org](http://www.gluster.org/) website a facelift. In addition to the updated graphics and layout, we are now using the [Middleman](http://middlemanapp.com/) site generator to allow the site to be statically generated.

In addition to a new look and layout, the site has new navigation and a “Spotlight” section on the front page. We are still maintaining a legacy version of the site, so any old bookmarks you have should work just fine.

READMORE

### FAQ

#### Why Middleman?
Several factors caused us to choose Middleman as the framework. Among the top reasons was that trying to template things in the way we wanted was quite difficult with the existing MediaWiki implementation. We also preferred that changes can now be maintained via git, which hopefully lowers the bar of entry for those who want to make changes to the documentation. All markup is now done in AsciiDoc, which most people should find simpler than MediaWiki.


#### Is the old site gone?

No. For obvious reasons, we wanted to maintain a legacy version of the site. You can still access the [wiki](http://www.gluster.org/community/documentation/index.php/Main_Page) and the [blog](http://blog.gluster.org). Going forward, the wiki should be considered legacy, and work will continue porting over and updating those sections of the site as needed. The blog will continue to operate as is for the time being, mainly because there are still dependencies on it (gitorious AFAIK, and possibly others). After that, Middleman does not lend itself well in an obvious way to dynamic content. Although there is a blog function we have implemented in Middleman, it does not work in its current form as we needed.


#### How do updates to the new site occur?

More detailed documentation needs to be written (by me) on the specifics, but a high level overview can be found in the README.md of the [gluster-site repository](https://forge.gluster.org/gluster-site). Updates to existing documentation will be simple as access to the gluster-docs repo is public. Adding new documentation, updating navigation, or adding media (such as new images or slides) will need some fine tuning because access to update the gluster-site repo is limited currently. Anyone interested is free to request access, of course. Currently the process is manual for rebuilding the site, but we are working on making this process automated.


#### What exploded?

Not much, as it turns out. We experienced issues with redirects that affected existing images and the content of the blog. The issues with the blog lasted for about an hour. We rolled back temporarily during the time until we could fix the issue. The images were fixed this morning. So far, the feedback has been positive and people are enjoying the updated look and feel.


Your feedback and contributions are appreciated and welcome, so feel free to email the gluster-users mailing list or drop a message in \#gluster on Freenode.
