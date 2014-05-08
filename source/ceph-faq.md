# Red Hat + Ceph Community FAQ

On April 30, 2014, Red Hat announced the acquisition of Inktank, the company behind Ceph, a popular open source, freely available storage system. Ceph is a unified, distributed storage system that offers solid performance, reliability, and scalability, and the project's success is closely tied to its active user, developer, and commercial community. 

Together, Ceph and Gluster provide the open source community with a complementary set of software-defined storage options for their object, block, and file storage needs. 

## General Questions

### _Is there room for another scale-out storage project at Red Hat?_

Absolutely. Although GlusterFS and Ceph share many of the same characteristics and goals, the two projects complement each other with different strengths and different user and contributor communities.

Broadly speaking, Ceph features a more mature block interface and better integration with OpenStack and similar cloud projects, whereas Gluster has a more mature file system interface and better traditional web storage integration. However, each project has its own strategies for addressing file, object, and block storage scenarios, developed with the needs of their separate communities in mind.

As the industry shifts from traditional proprietary storage systems to  open source software-defined storage, individuals and organizations should select the best combination of technologies to suit their use case.

### _Will overlapping features of Gluster and Ceph be removed, or will elements of each project be combined to deliver "the best of both worlds" in a common project?_

At this point, there are no plans to make structural changes in or  remove features from either storage technology. Both will exist and  evolve, serving the needs of their respective communities.

### _Will the governance of the Ceph project change?_

Both Red Hat and the Ceph project believe that open governance and broad participation are crucial to Ceph's continued success. Over the coming months, Red Hat will work with the Ceph project to implement an open governance structure, building on the work already underway in the Ceph community. We will also continue to welcome all project contributions.

### _Will Ceph continue to run on operating systems outside of the Red Hat "family?"_

Yes. Red Hat recognizes that a project's success is directly linked to the breadth of its user and contributor base, spanning multiple platforms. 

### _Where do I go get Ceph to play with it?_

Ceph source and binaries are available at [the Ceph project site](http://ceph.com/resources/downloads/), or in your distribution's software repositories.

### _Will Red Hat open source Inktank's closed-source monitoring offering (Calamari)?_

Yes. Red Hat believes that open is better, and we will provide the tools we develop related to Ceph and OpenStack to the community. Calamari, the monitoring and diagnostics tool that Inktank has developed as part of the Inktank Ceph Enterprise product, will be open sourced.


## OpenStack Questions

### _Will RDO support Ceph and Gluster?_

Both Ceph and Gluster can be used with RDO today. Check out these walkthroughs for deploying OpenStack Cinder [with Ceph](http://openstack.redhat.com/Using_Ceph_for_Cinder_with_RDO_Havana) and [with Gluster](http://openstack.redhat.com/Using_GlusterFS_for_Cinder_with_RDO_Havana), from the RDO project wiki.

Red Hat will accelerate efforts to support Ceph in tools such as Packstack, Foreman, and TripleO.

### _Between Gluster and Ceph, which project would Red Hat recommend for particular OpenStack use cases?_

The best technology option in a given situation depends on many factors, but among community deployments, users tend to opt for Ceph for OpenStack services that require block storage, such as Cinder or Nova instance storage. For file-based sevices, such as Manila, or for user or guest application data, we see more users choosing Gluster.


## Open Source Community Questions

### _What does this mean for Ceph support for Apache CloudStack, Eucalyptus, etc.?_

Ceph has built a large community around its support for many major open source cloud platforms and virtualization environments. Maintaining and growing this type of support is fundamentally important to ongoing growth and progress of the Ceph community. 

### _How will Ceph be integrated into other Red Hat-supported open source projects, such as oVirt?_

Ceph has done a fantastic job of integrating with a variety of virtualization and cloud platforms. Because of their underlying support for QEMU/KVM virtual block storage, adding support for oVirt should be possible, and talks about Ceph integration with oVirt are underway.


## Commercial/Product Questions

### _Will Red Hat honor existing agreements made by Inktank?_

Red Hat will honor pre-existing engagements to their term.

For more information, visit the [announcement FAQ](http://www.redhat.com/inktank/).

### _What does this mean for Red Hat's product line?_

Over the next 1-2 years, Red Hat plans to develop product roadmaps from which Red Hat can derive a range of compatible storage offerings to address the demand for file, block, and object storage.

### _What does the Inktank acquisition mean for other vendors who wish to provide commercial support for Ceph?_

Ceph has been successful in building a broad commercial ecosystem around the project, and this is a key part of its success. We welcome the participation of other vendors who wish to build Ceph-based products.
