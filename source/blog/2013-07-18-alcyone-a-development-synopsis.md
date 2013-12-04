---
author: jottinger
comments: true
date: 2013-07-18 11:14:47+00:00
layout: post
slug: alcyone-a-development-synopsis
title: 'Developing Alcyone: a Raspberry Pi MIDI Controller'
wordpress_id: 319
categories:
- Blog
tags:
- alcyone
- android
- arduino
- midi
- open source
- Raspberry Pi
---

## Purpose

The Alcyone is a home-built MIDI controller, using the Raspberry Pi as a central controlling component.

![alcyone](blog/alcyone.jpg)

The Alcyone is an ongoing design, so this document will address not only existing components, but will also address potential future enhancements. Rationales for architectural choices will be offered where appropriate, with the understanding that some choices were made "just because," out of ignorance, necessity, or mere personal preference.

Notes taken during the development of the Alcyone can be found on my blog using [midi](http://www.enigmastation.com/?s=midi) as a search term, and most recent entries are under the [Alcyone](http://www.enigmastation.com/posts/category/alcyone-music/) tag.

Source code for the project (including this document and a [Fritzing](http://fritzing.org/) schematic) can be found on [GitHub](https://github.com/jottinger/alcyone). The progenitor project of the Alcyone, based on the [Arduino Uno](http://arduino.cc/en/Main/ArduinoBoardUno), is also available on GitHub under the repository name of [Frankenpedal](https://github.com/jottinger/frankenpedal) - this code is not likely to be useful, but it might be interesting for historical purposes, and Arduino users may be able to use some of its features for other projects.

### Rationale

The Alcyone was designed with two primary purposes in mind.

The Moog Taurus 2 (not the Taurus 3) was the original inspiration for the Alcyone, and inspired its name. However, the PK-6 is more of a direct equivalent to the Alcyone. I can't for the life of me figure out what I’d have named the device if I was trying to derive the name from "PK-6."One purpose was almost purely selfish; I wanted a [MIDI controller](http://en.wikipedia.org/wiki/MIDI_controller) in the form of bass pedals. Building a foot pedal would be far less expensive than purchasing a [Moog Taurus 3](http://www.moogmusic.com/products/taurus/taurus-3-bass-pedals) (a full analog synthesizer in a foot pedal form factor) or even a [Roland PK-6](http://www.rolandus.com/products/details/1196) (a simple foot pedal controller, at roughly $900 USD).

The other purpose was the actual linchpin for the design. I wanted to figure out what actually went into musical instrument design, such that I might be able to design other musical instruments.

As a secondary purpose, I also wanted to be able to tell _others_ how the Alcyone was designed, such that _they_ might be able to not only build their own Alcyone, if that was what they desired, and they might also be able to build their _own_ designs (and share them with me, in kind.)

Another secondary purpose was to look at how an open source mindset might be applied to a project of this nature, using open source processes and open source projects in the physical implementation and in the design.

Platforms like [Fedora](http://fedoraproject.org) provided an ecosystem in which this kind of approach is very much the norm, so there's little work involved in encouraging participation; users in these communities **expect** to participate, which is not only useful but very encouraging.

### The Name

"Alcyone" is pronounced "al-SEE-on-ee." The _correct_ pronunciation of the word is "al-SIGH-on-ee," but I prefer my pronunciation because it’s easier... as you'll see from this explanation.

"Alcyone" as a name was derived from a series of steps starting with the Moog Taurus.

The Taurus was originally designed as a part of a synthesizer ensemble from Moog, called the [Constellation](http://www.brain-salad-surgery.de/moog_constellation.html). The Taurus was the bass pedal of the ensemble; the other parts were the "Lyra" and the "Apollo." The Lyra was never built; the Apollo's design apparently found its way into the PolyMoog.

The Taurus, however, became very popular, through its use in bands like Rush, Genesis, ELP (from whom the explanation of the Constellation comes) and others.

"Alcyone" as a name followed this linear thought:

	
  1. Taurus is a constellation, and the Taurus synthesizer was part of an ensemble called the "Constellation."

	
  2. The Taurus constellation's brightest star is Aldebaran, but "Aldebaran" is unwieldy as a name. This is fairly ironic, since "Alcyone" isn't exactly trivial to say either.

	
  3. Taurus' next-brightest star is Tau, but Tau is the name of another musical instrument (the [Tau](http://www.eigenlabs.com/product/tau/), of course), from [Eigenlabs](http://www.eigenlabs.com/).

	
  4. Taurus' _next_ brightest star is Alcyone, one of the Pleiades; Alcyone is the name of a Greek tragic heroine, so there’s some measure of appeal for mythology's sake as well.

The warped pronunciation came from "halcyon," which is a variant of (the mythological) Alcyone's name; "halcyon" uses the "ee" form of the "y," and it's easier for me to pronounce, to boot.

### Scope

The Alcyone is "merely" a MIDI controller; it does not generate any sound in and of itself, although this would be a welcomed capability.

This is discussed further in "Onboard Sound."The actual processing power is provided through a [Raspberry Pi](http://raspberrypi.org), and the Raspberry Pi's audio output is only 11 bits, which is better than, say, a Nintendo DS or some ancient digital synthesizers, but is far inferior to CD quality, and is nowhere near what I would like for actual audio creation.

## Terms

### MIDI

[MIDI](http://www.midi.org) stands for "Musical Instrument Digital Interface," and is an industry-standard protocol for electronic instruments. It is based on three types of events (note events, control events, and global events) and uses a serial connection at 31250 baud.

## Architecture

### Hardware

The Alcyone uses a very simple internal electronic design.

The pedals themselves are a 13-note chord, salvaged from an old [Lowrey](http://www.lowrey.com/) organ, purchased over [EBay](http://ebay.com). They rely on a rocker switch that pulls a spring across a circuit to close it.

As best I can tell, in the Lowrey design the pedals convert the circuit to a [CV/Gate](http://en.wikipedia.org/wiki/CV/Gate) signal, which was a standard before MIDI was created. However, CV/Gate was never formally specified; different manufacturers use different implementations.

CV/Gate _normally_ converts to a voltage; the first note might be +1v, the second note +2v, and so forth. However, this is a convention and not a standard; plus, the Raspberry Pi has neither analog inputs nor the capability to handle +13v.

I don't _think_ the Lowrey pedals were monophonic, so it’s possible that it used a digital output, but I don’t know for sure. They also might have used a stepped resistor ladder (the definition of which is probably out of scope for this document, as a resistor ladder isn't used on the Alcyone) but, again, I don't know - and the mechanism was ripped off of the pedal mechanism to make room for my digital inputs.

Given my limited analytical capabilities, it was simpler to use as little of the existing mechanism as possible, which meant relying solely on the rocker switch, and wiring my own digital I/O.

As the Pi only has a limited number of GPIO pins, I wired the circuits for the rocker switches to a set of [I2C](http://en.wikipedia.org/wiki/I%C2%B2C) chips. These use a serial protocol to map GPIO pins; the [MCP23008](http://www.adafruit.com/products/593) offers eight individually-addressible GPIO pins, and the [MCP23017](http://www.adafruit.com/products/732) offers sixteen.

The I2C chips can be wired such that seven of them are on a single serial connection; thus, if you use seven MCP23008 chips in a series, you have 56 uniquely addressable pins; with the MCP23017, you could have 112. There are likely to be other I2C chips available, and you don't have to have a homogenous chain.

The physical electronic circuit is, thus, very simple. Three MCP23008s, in series, with two of them dedicated to pedal input and one driving three LEDs for runtime status.

The pedals are connected to power (+5v) and wired to the MCP23008s; the digital inputs are also connected to pull-down resistors to clear out digital noise.

"Availability" means "I had one lying around," which is much of why I chose the MCP23008 over the MCP23017, too.The Raspberry Pi is connected to the I2C series and also to a [Din5 connector](http://en.wikipedia.org/wiki/DIN_connector) (the industry standard for MIDI connections). The Din5 is mounted on a [Sparkfun MIDI shield kit](https://www.sparkfun.com/products/9595), mostly chosen for availability and ease of use.

A powered USB hub is also part of the hardware installation; the hub has one device installed, a wireless networking dongle. The powered hub is necessary because the Raspberry Pi does not carry enough current to reliably power most wireless dongles.

#### Why Wireless TCP/IP?

The wireless networking is part of a software choice made fairly early in the implementation cycle.

More details will be discussed in the section on the Alcyone software, but initial external control relied on the Raspberry Pi’s onboard ethernet connection.

This implies the requirement for networking infrastructure. However, one facet of the Alcyone’s projected use was stage work - and on some of the stages available to me, networking is very spotty if existent at all.

The simplest solution involves the Alcyone serving as its own wireless access point, then, meaning that it provides its own networking infrastructure.

An alternative would be to avoid TCP/IP altogether. [Bluetooth](http://en.wikipedia.org/wiki/Bluetooth) is another messaging protocol, one designed very much for device-to-device communications, particularly for short messages. Bluetooth devices can also be designed for very low power usage.

The short explanation is that the original software stack used streams over TCP/IP, and it was the easiest (and shortest) implementation path.

Configuring the wireless on the Raspberry Pi was fairly easy. In order for the Alcyone to serve as its own networking infrastructure, the wireless had to be configured as an access point, which means it will have its own network SSID and security; the external client will have to use this access point in order to have control of the Alcyone.

Not only does this avoid reliance on what might be inconsistent or nonexistent network services, it also limits the amount of traffic that competes for the client, and it also allows us to use a consistent IP for the Alcyone (as opposed to guessing what valid address the Alcyone happens to receive from the network infrastructure.)

For this, I used two packages: `[hostapd](http://hostap.epitest.fi/hostapd/)` and `[udhcpd](http://www.busybox.net/)` as referred to via [eLinux.org](http://elinux.org)'s [RPI-Wireless-Hotspot](http://elinux.org/RPI-Wireless-Hotspot) page. The default build of `hostapd` did not support my wireless network card, so I had to use one built for it (locatable via the ELinux.org page); it's easily downloadable, but still slightly inconvenient.

Setting up the network after installation of these packages was trivial. Honestly, the documentation from eLinux.org is done well enough to follow literally.

### Software

The software for the Alcyone comes in two artifacts: the actual embedded code (the code running on the Raspberry Pi) and an external client app (currently targeted towards Android).

#### Embedded Software

The embedded platform is running a single application, called "alcyone" of all things, written in [C++](http://cplusplus.com). C++ was chosen because the original test program was written on an Arduino Uno, which tends to encourage the use of Arduino "sketches," which are themselves a form of C++ code (mostly with really odd library support).

C++ editing was largely done through [Code::Blocks](http://www.codeblocks.org/), easily installed for [Fedora](http://fedoraproject.org) through `yum`, as the `codeblocks` artifact.

Interaction with the physical hardware is provided by [Gordon Prescott](http://drogon.net/)'s [wiringPi](http://wiringpi.com/) library, an excellent utility with various language implementations.

It uses three threads, provided via `[boost::thread](http://www.boost.org/doc/libs/1_54_0/doc/html/thread.html)`, to execute. All three threads are infinite loops; the Alcyone is basically a set of [state machines](https://en.wikipedia.org/wiki/Finite-state_machine), with the different machines able to affect the others.

The C++ code could definitely be written more effectively, in a lot of ways. First off, there's little [guarding of multithreaded access](http://en.cppreference.com/w/cpp/thread/mutex). For another, OOP is used perhaps less than it could be; the flare process could have exposed a method to affect the delay time instead of using an external variable, for example. There's no claim here that this code is optimal in any way, shape, or form: the goal is operation, not impressing others. That said, I'm certainly trying to improve it all the time.The simplest thread is a "flare" machine; it basically loops through the output LEDs. The loop provides a timer value via an `extern` variable.

The second thread polls the digital inputs for changes in pedal state - in other words, when the pedals are pressed down and lifted up. The routine keeps track of two states: the "current state" based on a digital read, and the "previously read" state.

The current state is buffered to handle [bounce](http://www.elexp.com/t_bounc.htm).

Bounce is the natural tendency of an electrical current to fluctuate during changes. When a circuit is closed (or opened), electrons flow across it _occasionally_ until the circuit settles in; the circuit appears to "bounce" open and closed for a very short while. This makes consistent reads very difficult, unless you "debounce" the circuit.

There are two ways to debounce circuits; one way uses hardware, using something called a "Schmitt trigger buffer." [Jack Ganssle](http://www.ganssle.com/) has an excellent [guide to debouncing](http://www.eng.utah.edu/~cs5780/debouncing.pdf) that describes a few different ways to handle bounce in hardware and software (including code).

I used a custom approach (although Mr. Ganssle's code is very similar). I wrote a class that examines the input and counts the "open" and "closed" states. It's possible that the debouncing mechanism could be fooled if the user plays quickly enough (pressing and releasing pedals much faster than the human eye can blink) but the sample frequency is such that bouncing signals haven't actually caused an incorrect result yet.

The process is fairly simple: on every loop, I read the digital state of the pedals, and feed that into the debouncing mechanism, yielding a result (biased towards the actual state).

If the current state is different than the "previously read" state, then we have a change; if the "current state" is "down," then the pedal was just pressed, and we need to send a "note on" event; otherwise, a "note off" event should be sent.

Which note is sent is based on an offset. The MIDI mechanism contains a reference to a "current octave" and a "current transposition" setting; the actual note used is determined by multiplying the octave by 12, then adding the transposition value.

Therefore, if the current octave is 3, and the transposition setting is 1 (meaning that the farthest left pedal is now C# and not C, an offset of one half-step), and the third pedal is depressed, the actual note is calculated through the use of the pedal, plus the octave offset, plus the transposition. The pedals start at zero, so the pedal number is **two**:

    
    2 + 3*12 + 1 = 39

This actually yielded a bug in the initial demonstration of the Alcyone. If the transposition settings were changed while a note was being played, the "note off" event would be for the wrong note! The reason should be fairly apparent.

Assume the "note on" event is for note 39 (as in the calculation above). Now let us set the transposition to 0 (i.e., reset it). Now, when the pedal is released, the "note off" value is calculated… at 38, instead of 39.

The "note off" event thus doesn't correspond to the "note on" event, and therefore a receiver doesn’t actually get the correct signal to release the note.

This is corrected by the use of another data element, the "last note sent by this pedal." Thus, note off events take the note value from this dataset, rather than recalculating the note value when the pedal is released.

Thus, the pedal press/release cycle follows this process:

	
  1. Physically depress pedal (poor, sad pedal)

	
  2. Calculate MIDI note by offset of pedal + 12*octave + transposition

	
  3. Store MIDI note in an internal array, index based on the offset of the pedal

	
  4. Send MIDI on

	
  5. Physically release the pedal

	
  6. Send MIDI off based on the note in the internal array

MIDI actually required a number of changes to the Linux configuration for the Raspberry Pi.

The Pi's serial driver does not actually support 31250 baud, the baud rate required by the MIDI specification. Therefore, I had to [overclock the serial chip](http://www.enigmastation.com/posts/alcyone-beta-midi-end-to-end-with-the-raspberry-pi/), by modifying `/boot/config.txt`:

    
    init_uart_clock=2441406
    init_uart_baud=38400

Next, I needed to disable the serial console, which uses the RX/TX pins that I needed for MIDI, through modification of `/boot/cmdline.txt`:

    
    dwc_otg.lpm_enable=0 console=tty1 console=tty1 root=/dev/mmcblk0p2 /
    rootfstype=ext4 elevator=deadline rootwait bcm2708.uart_clock=3000000

Lastly, I needed to disable the TTY that would normally get assigned to the RX/TX pins, as well, by modifying `/etc/inittab`:

    
    #Spawn a getty on Raspberry Pi serial line
    #T0:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100

The last thread is a simple web server, based on [web++.hpp](http://konteck.github.io/wpp/). This is an #include file (thus the ".hpp") that provides HTTP services; the Alcyone application provides one web service endpoint (mapped to the root url, so "/"), which looks for an HTTP parameter, "message."

This parameter is a number, which corresponds to a simple wire protocol for the Alcyone’s services. The number is an encoded byte, based on the following table:

Message
Payload
Notes

`MSG_MIDI_RESET`

_0001 xxxx_

`MSG_MIDI_CHANNEL_CHANGE`

_0010 vvvv_

`MSG_MIDI_OCTAVE_CHANGE`

_0100 vvvv_

`MSG_MIDI_TRANSPOSITION_CHANGE`

_1000 vvvv_

`MSG_RESET`

_1111 xxxx_

`MSG_REQUEST_STATUS`

_0011 xxxx_

Responds with three bytes: octave, transposition, channel

In this table, _xxxx_ is an "ignored value," _vvvv_ is "down if zero".

The server is a simple loop; it processes a request, has an internal `switch/case` that examines the upper nybble of the "message" value and applies changes as required.

No matter what the requested operation is, the Alcyone responds with three integers in plain text, which correspond to the current octave, the current transposition setting, and the current MIDI channel.

#### External Client Software

The external Alcyone client is written as an [Android](http://www.android.com) application.

It's really pretty straightforward; it provides three sets of two buttons and one text field, which control the current octave, the current transposition setting, and the current MIDI channel.

A menu offers access to two more features (MIDI and device resets) as well as a configuration activity, which allows control of the Alcyone’s IP.

Every time one of the buttons is pressed (or one of the resets is used) an HTTP request with the command is sent to the Alcyone; the response will always contain the current device status, so the data is refreshed and redisplayed.

### Ergonomics

An implemented schematic and working software (both embedded and external) are all well and good, but they all ignore the actual aspect of _playing_ the Alcyone.

The Alcyone is designed to be played by standing guitarists (because I tend to stand when I play guitar, of course.) It is not likely to be played with delicacy.

In order to be useful, it needs to be mounted in a case that offers the following qualities:

	
  1. Must be heavy enough to allow stability for the pedals. It would be unfortunate for the musician if the pedals moved during performance (as many stage configurations are laid out for the convenience of the performer, and often monitors are aimed in specific ways). It would be even less fortunate for an audience member if the Alcyone were to somehow be launched at him or her.

	
  2. Must be tough enough to handle being stepped on thousands of times, by a full-grown adult.

	
  3. Must have the pedals low enough so that the musician’s ankle is comfortable while playing the instrument.

Two of the pedals actually broke in shipping, which I can't (and wouldn't) blame on the seller; the parts were packed about as well as they could have been (with perhaps the exception of blown foam, but... really.)

I ended up taking wood for a picket fence and cutting it down to size to match the existing pedals (roughly six inches long) and replacing all of the "white keys" with the wooden keys. These are more likely to be immediately durable than the original organ pedals (which would be decades old), although there's probably still room for improvement.

As for the actual external container, the Alcyone received a wooden case built from 2x4 wood and shellacked fencing; this gives it a rustic look (which has its own appeal, for various reasons) and is tough enough to handle rough treatment. With proper reinforcement, the Alcyone is strong enough for an adult to stand on, although I definitely wouldn't recommend jumping on it.

## Improvements

As a working testing environment (a functional ongoing experiment, if you like), the Alcyone has a number of areas in which it can gain new features. Some features are appropriate for the actual physical form factor; others are generic to MIDI controllers and thus would be appropriate to devices that use the Alcyone's basic electronic architecture.

### Onboard Sound

The first enhancement, and by far the one asked about most, is the potential for onboard sound generation.

The Raspberry Pi has a 1/8" (or 3.5mm) audio output, and many examples of the Pi playing prerecorded samples exist; it's certainly within the realm of possibility, despite not being in the original requirements for the Alcyone.

However, I find the Pi's audio jack to be limited in quality due to cost; it supports 11-bit audio, which is better than the Commodore 64's audio, but not by much. (It might be nice to have better audio, but the Pi is a mere $35 USD. Better hardware is easily possible, but not at that price point.)

First, let’s look at what "11-bit audio" means.

Digital sound is rendered as points on a wave. To generate a sine wave (a muted, typically pleasant audio wave), one generates a large number of values (based on the sample rate) using the sine function, and sends that to an audio receiver.

The bits referred to in audio generation refer to the precision of this wave. An 8-bit generator provides 256 possible positions for the wave; 11 bits gives you 2048 possible positions, which is quite a bit more precise, but still is far from CD audio quality - which is 16 bits, therefore providing a source of up to 65536 positions on the wave.

Professional musicians generally tend to consider 16-bit audio to be "tolerable," with the industry standard for recording being 24-bits and with many recording environments supporting 32-bit audio.

With the lack of precision in the wave, any audio generated by the Pi would be lacking in quality to begin with, not to mention the CPU drain and software configuration that would be necessary in order to provide modifications to the sound like filters, amplitude, and other such properties of sound.

While still desirable at some point, until the Pi supports both better audio and a faster CPU, onboard sound generation remains out of scope.

With that said, future designs should probably consider addressing this, assuming their onboard audio is of higher quality.

### Pressure Sensitivity

The Alcyone's original conception was that of bass pedals. Typically, bass notes don't use a _lot_ of dynamic range, and as the device is played with feet, dynamics aren't likely to matter anyway. (Usually you're stepping on the darned thing with most of your weight.)

With that said, though, it might be nice to offer pressure sensitivity; the MIDI specification certainly allows velocity (and aftertouch, as well, which is when you alter the pressure on a depressed key after it's started playing a note.)

Pressure sensitivity would also open up the possibility of dynamic percussion.

The digital nature of the GPIO on the Pi (and the MCP23008, which the Alcyone uses to read the pedal state) does _not_ offer dynamic control; pedals are down or up, with nothing in between.

There are certainly ways to address pressure and velocity, using ADC converters with pressure pads or variable resistance mechanisms (i.e., capacitance, or resistor tape).

It's possible that reading the converted data (from the analog input to digital form) is too slow for a full keyboard - I haven't tested. It’s something to think about.

### Platform-neutral external client

The external client right now runs on Android, largely because that's the type of device I have. However, many musicians use Apple devices (the [iPhone](http://www.apple.com/iphone/) and [iPad](http://www.apple.com/ipad/)).

If I were to write the external client in HTML and Javascript, all **any** external device would need is network access and a compliant browser.

Given the protocol in use, this should be trivial to create; the larger concern is how the Pi hosts the application.

Probably any web server would do, because loads would be _very_ infrequent.

With that said, however, the possibility of Bluetooth as a network transport works against this idea.

### Bluetooth instead of wireless TCP/IP

TCP/IP is trivial. However, the TCP/IP dongles available _typically_ consume more power than the Raspberry Pi can reliably deliver. (There are some that are rated low-power enough that the Pi can indeed use them, provided other power drains aren't too high.)

Currently, this is managed through the use of a powered USB hub mounted in the Alcyone's case, even though that adds an extra power supply.

Another alternative is the use of Bluetooth, which has broadcasting dongles that are, indeed, low-power enough for the Pi to use. Bluetooth is also high-bandwidth enough that it would serve appropriately for an external client.

This is probably preferable to TCP/IP; I just haven't purchased a Bluetooth dongle with which to test (yet), and the software stack would also become more complex.

## Summary

The Alcyone was built as a device to fulfill two basic requirements.

One was as a working MIDI controller, suitable for actual stage work.

The other was as a development platform through which I might be able to learn what potential issues I would face when designing other possibly more unique instruments.

A secondary aspect of its design would be that I exposed the entire design throughout its lifecycle, such that others would be able to learn from what I did, or offer advice on implementation or design.

This is [The Open Source Way](http://www.theopensourceway.org/), and I have to say that at least two of these requirements have been fulfilled in fantastic fashion; not only has the Alcyone been used in actual recordings and performances, but much of the design was influenced heavily through community participation.

The bug with the MIDI note-off events, for example, had a potential solution offered at the [San Mateo Maker Faire 2013](http://makerfaire.com/bayarea-2013/), by a young teen - his solution wasn't quite applicable (as he didn't know how the device was implemented) but the fact that he used the Alcyone as a launching point for thinking about how he **might** implement such a construct was impressive.

I'd like to consider other implementation platforms, or possibly a USB soundcard, to allow onboard sound generation, as that’s also an interest of mine; I'm very likely to implement a Bluetooth network transport, because other form factors may not provide the physical space required for an access point.

So far, though, the Alcyone has been a resounding success, given its design goals. With that said, I’m more than happy to answer any questions about its design and implementation, as well as maintain a list of potential enhancements.
