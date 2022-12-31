---
title: minecraft server on debian or proxmox using systemd
date: 2022-07-17
---

# This article is no longer maintained, but probably still works.

# Minecraft server on Proxmox

Hey there! I've recently set up a few Minecraft servers, and am running them of off my Proxmox host. Today I'll write a little post about my set up process.
Requirements:

* Debian GNU/Linux based box (or you can adjust the commands to your liking, but for my server I run Proxmox which is Debian based)
* Systemd (for the first method)
* Some basic GNU/Linux skills and/or common sense.
* Have the appropriate Java version installed and added to path.
* Have port 25565 free and open. You can however use a different port if you would want to.

## Method 1: Systemd and baremetal

Let's make a folder for your server. I've done this on 50MB/s spinning rust drives to 3000MB/s NVMe's, it doesn't really mater. Having this said, lets start on the /fast mount (for me this is a raid array of SSD's, but it could be any folder.)

```sh
sudo su
cd /fast
mkdir minecraft
cd minecraft
```
Now we'll install Paper. Paper is "the next generation of Minecraft servers, compatible with Spigot plugins, offering uncompromising performance." as of their website. I use Paper because of the performance gain I get.

```sh
wget https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/387/downloads/paper-1.18.2-387.jar
mv paper-1.18.2-387.jar paper.jar
touch eula.txt
echo "eula=true" >> eula.txt
```

Now we'll start the server and test if everything works, if it does, we will make it a service using Systemd.

```sh
java -Xms32G -Xmx32G -jar paper.jar -o true op yourusername
```

Now log into the server on your Minecraft client using the servers IP. Now test if everything works and if it does, type stop and continue to the next step.

## systemd
> Now we'll add the server to Systemd to let it come up at boot. To do so, follow up.

```sh
apt install screen
touch /etc/systemd/system/minecraft.service
nvim /etc/systemd/system/minecraft.service
```

Now copy the following text into it:

```sh
[Unit] Description=Minecraft Server
After=network.target

[Service] WorkingDirectory=/fast/minecraft/

User=root
Group=root

Restart=always

ExecStart=/usr/bin/screen -DmS mc /usr/bin/java -Xmx32G -jar paper.jar nogui

ExecStop=/usr/bin/screen -p 0 -S mc -X eval 'stuff "say The Minecraft server you're currently playing on is going down for either maintenance or another reason."\015'
ExecStop=/bin/sleep 10 ExecStop=/usr/bin/screen -p 0 -S mc -X eval 'stuff "save-all"\015'
ExecStop=/usr/bin/screen -p 0 -S mc -X eval 'stuff "stop"\015'

[Install]
WantedBy=multi-user.target
```

# boot and management
> Now, lets start the server and make it automatically start at boot using the following commands:

```sh
systemctl start minecraft.service
systemctl enable minecraft.service
```

If you are wondering how the server is doing, you can type:

```sh
sudo systemctl status minecraft.service
```

# Method 2:
[This video](https://www.youtube.com/watch?v=2mibJeaEq3Q) sums it up about perfectly. Go watch that instead please!
