---
title: libssl.so issues with version jump from 1.1 to `latest`
date: 2022-11-06
---

# I was getting an error with pacman:

```sh
error while loading shared libraries: libssl.so.1.1: cannot open shared object file: No such file or directory
```

This happened when I tried to install my VPN daemon using the AUR, and that tried to update a single package instead of all system packages, and thus I had some issues with the libssl package. This broke pacman, sudo, systemd and MUCH more.

## Solution

The only thing I needed to do is to reinstall openssl-1.1.0. So what I did is:
 * Boot into an Arch GNU/Linux live environment.
 * Mount the system partition (not boot, just /) using:

```sh
mount /dev/nvme0n1p2 /mnt
```

Connect to the internet (iwd is easier than you might think)
Pacstrap the openssl-1.1.0 package:

```sh
pacstrap -i openssl-1.1.0 /mnt
```

Make sure it works; chroot into the drive and do something like `pacman --help`.

Umount your normal boot drive and reboot the system:

```
umount /dev/nvme0n1p2
reboot now
```
