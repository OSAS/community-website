---
title: How to Install oVirt's Windows Guest Tools
author: lveyde
date: 2015-05-26 16:40:45 UTC
tags: ovirt, windows, virtualization
comments: true
published: true
---

The oVirt Windows Guest Tools (oVirt WGT) installer, which made its debut in oVirt version 3.5, allows users to optimize Windows VMs for oVirt by easing the installation of:

* Para-virtualized VirtIO-Win drivers, that you need to run your Microsoft Windows VMs with optimum performance.

* Spice QXL drivers, for the improved remote access and performance.

* Guest Agents, services that provide additional support for running and accessing VMs in oVirt. In 3.5 these agents include:
  * oVirt Guest Agent, which reports to oVirt Manager information such as IP addresses and FQDN of the VM.
  * Spice Guest Agent, which provides functions such as copy-and-paste between the client and the VM, as well making it possible to seamlessly go in and out of the VM's console with a mouse pointer. Without this agent, you would need to "release" your mouse pointer each time you want to go outside of the console.
    
READMORE

### Getting and Installing oVirt WGT

Getting the tools is quite easy -- all you have to do is to make sure you have installed the `ovirt-guest-tools-iso` RPM package. The current package for 3.5 at the time of writing this article is ovirt-guest-tools-iso-3.5-7.noarch.rpm.

The package includes an ISO image carrying the installer, which you'll be able to locate under /usr/share/ovirt-guest-tools-iso/ :

    # ll /usr/share/ovirt-guest-tools-iso/
    total 105444
    -rw-r--r--. 1 root root 107974656 Dec  1 14:28 oVirt-toolsSetup_3.5_7.iso
    lrwxrwxrwx. 1 root root        59 May 10 13:08 ovirt-tools-setup.iso -> /usr/share/ovirt-guest-tools-iso/oVirt-toolsSetup_3.5_7.iso

The ISO image will be named something like `oVirt-toolsSetup_3.5_7.iso`, and will be accessible either directly or through a symlink named `ovirt-tools-setup.iso` in the same directory. Using the symlink is usually more convinient if you need to reference the image i.e. in your scripts, but don't want to update your scripts for each new release of oVirt WGT.

Once you have the ISO, you need to connect it to the VM you want to install the tools on. That is done exactly the same way as it's done with any other ISO images - first you need to upload the ISO image with the engine-iso-uploader tool (it comes as part of the ovirt-iso-uploader RPM package) into the ISO domain of oVirt.

Uploading is as easy as running:

    # engine-iso-uploader upload -i ISO_DOMAIN /usr/share/ovirt-guest-tools-iso/oVirt-toolsSetup_3.5_7.iso
    Please provide the REST API password for the admin@internal oVirt Engine user (CTRL+D to abort): 
    Uploading, please wait...
    INFO: Start uploading /usr/share/ovirt-guest-tools-iso/oVirt-toolsSetup_3.5_7.iso 
    INFO: /usr/share/ovirt-guest-tools-iso/oVirt-toolsSetup_3.5_7.iso uploaded successfully

You should use the ISO storage domain name that you configured in your specific oVirt environment, if it's different from the default ISO_DOMAIN. When prompted, you'll need to supply authentication credentials for your engine.

After the ISO image is successfully uploaded, the next step is to actually connect that ISO image to the VM. That step is simple as well -- just log in to the oVirt engine WebAdmin, click on the Virtual Machines tab, select the VM you want to connect the ISO to, and from the pop-up menu, select the Change CD option. Then, select the uploaded image, i.e. oVirt-toolsSetup_3.5_7.iso, and click OK. Note that for the Change CD option to be enabled, the VM must be up and running.

Great, now we can access the contents of the ISO image from the VM. Open a console to the VM, i.e. with Spice (this actually depends on the way you configured the specific VM, and can be either Spice or VNC).

Accessing the CD-ROM device with the mounted ISO image will reveal its content, as shown here:

![oVirt tools](blog/01-oVirt-Tools-ISO.jpg)

The thing that you are really interested in is the ovirt-guest-tools-setup.exe. Double click on it to start the installer:

![welcome](blog/02-oVirt-Installer-Welcome.jpg)

Clicking on the Next button will bring you to the next screen, which is a License Agreement:

![license](blog/03-oVirt-Installer-License.jpg)

Read it carefully before clicking on I agree button, which begins the installation. During the driver installation phase you may see pop-ups like these:

![driver verification](blog/04-oVirt-Installer-NonWHQL-Driver-Verification.jpg)

You have to click Install each time such a pop-up appears, or you can optionally select the checkbox of Always trust software from Red Hat, Inc. before clicking on the Install button.

Once the installation is finished you can click on the Finish button to close the installer.

![installation finished](blog/05-oVirt-Installer-Finish.jpg)

That's it, now the Windows VM is ready to work in oVirt!