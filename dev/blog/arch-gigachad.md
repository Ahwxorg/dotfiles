---
title: arch install
date: 2022-11-06
---

ssh root@

cfdisk; mkfs.ext4 /dev/sda2; mount /dev/sda2 /mnt; pacstrap /mnt base base-devel linux linux-firmware; genfstab -U /mnt >> /mnt/etc/fstab; arch-chroot /mnt bash -c 'pacman -Syu grub doas efibootmgr networkmanager openssh intel-ucode zsh neovim xclip pulseaudio pulseaudio-alsa firefox xorg xorg-xinit xorg-server; grub install /dev/sda; grub-mkconfig -o /boot/grub/grub.cfg'; arch-chroot /mnt bash -c 'echo "permit persist :wheel" >> /etc/doas.conf; echo "permit nopass root" >> /etc/doas.conf; echo "permit persist ahwx" >> /etc/doas.conf; ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime; hwclock --systohc; echo "en-US.UTF-8 UTF-8" >> /etc/locale.gen; locale-gen; echo "LANG=en_US.UTF-8" >> /etc/locale.conf; echo "KEYMAP=us" >> /etc/vconsole.conf; echo "rain" >> /etc/hostname; echo "127.0.0.1 localhost" >> /etc/hosts; echo "::1 localhost" >> /etc/hosts; echo "127.0.0.1 rain.localdomain rain" >> /etc/hosts; systemctl enable NetworkManager; useradd -s /bin/zsh ahwx; usermod -aG wheel ahwx; fallocate -l 1G /swapfile; chmod 600 /swapfile; mkswap /swapfile; swapon /swapfile; echo "/swapfile none swap sw 0 0" >> /etc/fstab'
