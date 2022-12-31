---
title: intel me sucks
date: 2022-11-11
---

# Intel ME sucks

Hey y'all, welcome back! In this post, I will yell at Intel ME (and AMD's counterpart).

## Introduction

Recently I have started to look into Intel ME and such. I've known that these things exist and have hated on them for quite some time, but recently I've actually done some research, and I don't really trust the device I am typing this on (Lenovo ThinkPad X280) anymore. For example, an old(er) CPU can run on about 100 KB of code. Yes, KB. Newer Intel (and AMD isn't great too) CPU's are made to phone back home (as far as my research and thoughts go) or be 'managed' through some sort of software which the public isn't allowed to see, this makes it so your CPU needs about 8 MB of 'drivers' to run. This makes me feel spied on, as the CPU has a seperated OS which can access the following things, and consumes about 4-10W whilst being "completely powered off":

* The filesystem
* The screen and everything on it
* Full networking, that's also why your NIC (networking interface) might flicker whilst your PC is turned off.
* Keyboard and thus everything you type.

"So ME is a hardware level system within Intel CPUs that consists of closed-source firmware running on a dedicated microprocessor" - Tomshardware, in this article

## Why do we use those CPUs?

So if we know this, and it is public information, why do businesses use Intel or AMD chips? Well, frankly because there is no other choice, except for ARM. You see, ARM is a CPU architecture which is used in almost every (smart)phone, tablet, and some other low power devices such as routers and networking gear. ARM allows for high performance with lower power consumption and a lot of other cool things. A few (desktop) devices that use ARM SoC's are i.e. Apple's new (M1 and M2) MacBooks, the Raspberry Pi, routers and smartphones. This is all great and you might think "oh hey, why don't we use ARM in our laptops and desktops like Apple does and ditch Intel and AMD, if ARM has better power/performance and it lacks the Management Agent?" Well, simply because a lot of companies don't really take ARM that serious, and still see it as a simple hobby computer platform. With the coming of Apple laptops with ARM CPS's, this is changeing, as i.e. Adobe starts to allow a lot of software to work on ARM, emulators get built and a lot of creativity apps have made some sort of support for ARM (i.e. Adobe and Apple with both Final Cut and Logic).
Article

So having that said, I read this article the other day which goes a little in-depth about Google, since Google (yes, the company that makes a lot of money from our data) is actively trying to remove Intel ME from all of their servers.

It also quotes Minnich, and says the following: "According the Minnich, that list includes web server capabilities, a file system, drivers for disk and USB access, and, possibly, some hardware DRM-related capabilities. It’s not known if all this code is explicitly included for current or future ME capabilities, or if it’s because Intel simply saw more potential value in keeping rather than removing it."

Which basically means that your computer (or server) has a HUGE backdoor to Intel, which - as said - has access to your entire filesystem, USB and networking. Possibly even some built in DRM-related stuff.
What can we do about it?

We can use either ARM or old devices in which we can turn the ME off, i.e. an old IBM/Lenovo ThinkPad. A popular option is to Libreboot your ThinkPad. Otherwise we can maybe get some help from the EU or EFF. I'm not really sure how to fix the issue otherwise.
