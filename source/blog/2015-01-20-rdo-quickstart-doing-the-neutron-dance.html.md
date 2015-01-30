---
title: 'RDO Quickstart: Doing the Neutron Dance'
author: jbrooks
date: 2015-01-20 17:34:01 UTC
tags: RDO, Openstack, CentOS, Fedora, HowTo
comments: true
published: true
---

[RDO](https://openstack.redhat.com/Main_Page), the community-oriented OpenStack distribution for CentOS, Fedora, and their kin, is super-easy to get up and running, as a [recently posted](https://plus.google.com/+RichBowen/posts/M9VRQBs5Rxx) YouTube video illustrates:

<iframe width="560" height="315" src="//www.youtube.com/embed/hRkCHs6LVb0" frameborder="0" allowfullscreen></iframe>

At the end of the process, you'll have a single-node RDO installation on which you can create VM instances and conduct various experimentation. You can even associate your VMs with [floating IP addresses](http://docs.openstack.org/glossary/content/glossary.html#d16e2491), which connect these instances to the "Public" network that's auto-configured by the installer.

**BUT**, that's where things stop being super-easy, and start being super-confusing. The auto-configured Public network I just mentioned will only allow you to access your VMs from the single RDO machine hosting those VMs. RDO's installer knows nothing about your specific network environment, so coming up with a more useful single-node OpenStack installation takes some more configuration. 

READMORE

First, we'll spin up a new all-in-one RDO installation, using the project's [quickstart directions](https://openstack.redhat.com/Quickstart). I'm using a test system running a minimal install of CentOS 7.

````
# sudo yum update -y
# sudo yum install -y https://rdo.fedorapeople.org/rdo-release.rpm
# sudo yum install -y openstack-packstack screen
````

Next, I like to run packstack within `screen`, just in case I get disconnected from my test machine during the install:

````
# screen
# packstack --allinone
````

The installer will crank away for some time, before printing out an "All Done" message and leaving you with a setup where you can try out all the OpenStack basics, including assigning your instances floating IP addresses so you can connect to them... but only from the all-in-one node itself.

### Networking Made Useful

In order to get our OpenStack instance into more useful shape, we need to reconfigure networking a bit, beginning by disabling  NetworkManager:

````
# sudo systemctl disable NetworkManager
# sudo systemctl stop NetworkManager
````

Next, we need to modify our configuration files. First, the configuration of our single NIC, which, assuming a NIC named `eth0`, will live in `/etc/sysconfig/network-scripts/ifcfg-eth0`. Edit this file to match the configuration below:

````
DEVICE=eth0
TYPE=OVSPort
DEVICETYPE=ovs
OVS_BRIDGE=br-ex
ONBOOT=yes
````

Next, we need to modify the bridge interface that the RDO installer put in place for us. The file, which should be called `/etc/sysconfig/network-scripts/ifcfg-br-ex`, should be changed to match the example below. Be sure to substitute your own values for `IPADDR`, `GATEWAY`, `DNS1`, and `NETMASK`.  

````
DEVICE=br-ex
DEVICETYPE=ovs
TYPE=OVSBridge
BOOTPROTO=static
IPADDR=192.168.122.10
NETMASK=255.255.255.0
GATEWAY=192.168.122.1
DNS1=192.168.122.1
ONBOOT=yes
````

On sort of a side-note, I've found that when I install a fresh CentOS 7 instance using a static IP address, I end up with some non-traditional syntax in my `/etc/sysconfig/network-scripts-ifcfg-eth0` file. `IPADDR` appears as `IPADDR0`, instead of `NETMASK`, there's `PREFIX`, and so on. Be sure to use the older syntax listed above, as it seems that the good old `network` service that stands in for our disabled `NetworkManager` doesn't know what to do with the newer syntax.

Next, reboot your test machine to allow the networking changes to take effect:

````
# sudo systemctl reboot
````

Now we need to reconfigure Neutron, starting by detaching the demo tenant router from our packstack-configured external network subnet, deleting that subnet, and then deleting the "public" network:

````
# cd ~
# source keystonerc_admin
# neutron router-gateway-clear router1
# neutron subnet-delete public_subnet
# neutron net-delete public
````

Next, we'll create a new public network, along with a new subnet, before linking up the demo tenant's router to our new, correctly configured external network. 

Pay particular attention to:

* _public_ XX.XX.XX.XX/24 (this is the network you want to be on)
* _allocation_pool_ (this is the range of addresses on that network that you wish to set aside for your floating IP pool)
* _gateway_ (this is your network's gateway)

````
# cd ~
# source keystonerc_admin
# neutron net-create public --router:external=True
# neutron subnet-create --name public_subnet --enable_dhcp=False --allocation_pool start=192.168.122.125,end=192.168.122.130 --gateway=192.168.122.1 public 192.168.122.0/24
# neutron router-gateway-set router1 public
````

### PROFIT!!!

Now networking will work... more effectively. You can log in to your OpenStack installation as the demo user (the keystonerc_demo file with the demo password can be found in `/root`), launch a test image, and can give it a floating IP that ought to work on the network you've configured. 

Assuming you've added rules opening access to ICMP and SSH in your instance's security group, you should be able to ping and ssh to your VMs from other machines on your network.

In my tests, I found that after rebooting the AIO machine, I had to disassociate and then reassociate the floating IP address I'd given to my VM for that floating IP to continue working. This led to some head-scratching debugging moments!

Remember, this setup remains an all-in-one affair -- in order to make multiple nodes play nicely together, we need to do some more configuration, but we'll leave that topic for another time.

**UPDATE:** Making multiple nodes play nicely together is actually pretty straightforward, courtesy, I believe, of neutron. To add a second compute node to the AIO setup I described above, I simply installed CentOS 7 on a second machine, stopped and disabled NetworkManager (which may not have been necessary), and edited the packstack answer file generated on packstack's first run.

The answer file, named something like `packstack-answers-*.txt`, contains a line that starts `CONFIG_COMPUTE_HOSTS=` and lists the IP address of my single AIO machine. To add that second compute node, simply append a comma followed by the new IP address, and then save and exit the file. Rerun packstack with `packstack --answer-file=$YOURANSWERFILE` and when it's finished, you'll have two compute nodes, with working networking. You needn't even mess with the br-ex configuration on the second node.

If you need any help with this walkthrough, or if you have suggestions on how I can improve it, ping me on IRC in the #rdo room on the FreeNode network, leave a comment below, or poke me on Twitter at [@jasonbrooks](https://twitter.com/jasonbrooks).

*Follow the RDO community on Twitter at [@RDOCommunity](https://twitter.com/rdocommunity), and on  [Facebook](https://www.facebook.com/rdocommunity) and [G+](https://plus.google.com/communities/110409030763231732154). Subscribe to the [rdo-list mailing list](http://www.redhat.com/mailman/listinfo/rdo-list) for technical questions, or to the [newsletter mailing list](http://www.redhat.com/mailman/listinfo/rdo-newsletter) for monthly community updates.*