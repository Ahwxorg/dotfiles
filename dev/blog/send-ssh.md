---
title: send file over ssh using scp
---

# introduction

you can send files to your server without opening some random port or using a docker container or something very easily, over ssh using scp.

# how-to:

for this blog i am using prose.sh, i send my markdown files to them using scp:

```sh
scp ~/dev/blog/*.md ahwx@prose.sh:/
```

or sending images to my server, or a backup:

```sh
scp ~/pix snowflake:/mnt/raid/pix/
```

```sh
scp "/mnt/usb1/backup-$(date).tar.gz" snowflake:/mnt/raid/backups/
```

> `snowflake` works here, since i have some details about `snowflake` in my `~/.ssh/config` file.

# why?

because you:

1: dont need to open another port
2: can use very secure ssh keys
3: dont have to depend on sluggish web apps
4: can use it almost everywhere: bsd, mac, (gnu/)linux and windows, all of those support ssh/scp.
