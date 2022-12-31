---
title: automatic updates using cron
date: 2022-06-16
---

# Automatic updates

if you run a server), it's important to keep it up to date, especially if it's exposed to the internet. in this little guide I will show you how you can do this, using a cronjob.

explaination:
> for this task, we're going to be using cron. cron is a tool that we'll use to scheduele our updates.

## istallation

debian comes with the cron package installed, so we're ready to start using it!

if you don't use debian, please refer to the package list of your distribution of choice.

## configuration

once you open your editor by running:

```sh
sudo crontab -e
```

put the following text into it (or whatever command your distro uses to upgrade without user input, i.e. arch: `doas pacman -Syyu --noconfirm`):

```sh
0 1 * * * apt -y update && apt -y upgrade
```

save and exit, and now your system should update every day at 1:00 AM.
