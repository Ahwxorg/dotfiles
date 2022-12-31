---
title: my homelab
date: 2022-12-05
---

# My lab:
> My "little" lab is all over the place and the weird choices are made since I usually get my stuff from friends (of friends)/family (of family) for free or cheap. I have quite a lot of servers, in example, but only my main server is powered on 24/7. I usually have the other ones off, but since noone would want to buy them, I will keep them in my rack for testing purposes if I ever need something. I am planning on doing a movie night using Minecraft Paintings for example, that takes like 100GB of RAM, and since I have all this old crap, I can run it.

## Rack from top to bottom:
> My rack of choice is a second hand music rack which I bought for 20 euro's.

## On top: Marantz AMP, Marantz tuner and surprisingly, a Marantz cassettedeck.

* Marantz AMP 1090.
* Marantz Cassette Deck 5010B.
* Marantz Tuner 2100.

## Unit 1-3: networking

> My networking gear is all over the place.
First internet goes into the UDM Pro, then to the Netgear ProSafe GS748T and UAP-6-Lite. Via the TL-SG1024 is currently how my entire home gets internet.

### Routing:
* ISP Router (outside the rack)
* UniFi UDM-Pro.
* MikroTik Routerboard RB2011UiAS-RM.

### Switching:

* UniFi USW-Flex-Mini.
* UniFi UAP-6-Lite.
* TP-Link TL-SG2109WEB for the gigabit devices (outside the rack).
* Netgear ProSafe GS748T.
* ISP AP's which I already had before the lab (outside the rack).
* Powerline Ethernet for the TVs and printer.
* Patch panel (22x Cat6A, 1x HDMI, 1x empty for USB-C currently).

## Unit 4-9: Server and NAS drivebay

* Main server:
  * AMD Ryzen 7 2700X (ML240Lv2, 1.8-4.8GHz).
  * G.Skill, 48GB RAM (2x8GB 2133MHz, 2x16GB 3000MHz. Both CL16).
  * ASUS ROG Strix B450-F Gaming.
  * NVIDIA GeForce 210.
  * 120GB SATA SSD (boot drive)
  * 512GB NVMe SSD (Jellyfin + cache drive)
  * 8TB raw for MDraid:
    * 2x 2TB IronWolf NAS. (array)
    * 1x 2TB Toshiba Canvio Basics.
    * 1x 2TB Seagate Expansion Portable.
* Second server (old HP Z400 workstation):
  * Intel Xeon W3565
  * 16GB RAM
  * GeForce GTX 750 Ti
  * 500GB 15K boot & Proxmox HDD).
  * 3x 1TB for backups

(OOU) Some drivebay for my server.

## Unit 10-bottom: servers

* Spotify for Marantz system: Asus K56CA Laptop (i5 3337U, 8GB RAM & 16GB USB drive).
* Currently no use: SuperMicro 2U server (2x Xeon E5-XXXX, XXGB RAM).
* Currently no use: HP ProLiant DL160 G6 (2x Xeon E5640, 4GB RAM, iLO doesn't work & 250GB HDD).
* Minecraft Server: HP ProLiant DL380p G8 (2x Xeon E5-2630, 128GB RAM, iLO 4 Advanced & 300GB HDD).

## Outside the rack
* Access points in the house: ISP AP's
* TV PC: i5-2320, 8GB RAM, GeForce GT520, 120GB RAM.

# I use my lab for:

## Learning:
     * i.e. different protocols such as DMZ, DNS, IPv4 and IPv6, PoE and many more.
       * DMZ for my UDM Pro behind our ISP router thingy.
       * DNS for Pi-Hole.
       * IPv4 is currently the default.
       *IPv6 is in the works-ish.
       * PoE for my APs.
       * Many more.

## Deploying:
      * This website along with a few others.
      * Docker:
          * Various frontends for i.e. Reddit and YouTube.
          * Jellyfin.
          * Home Assistant:
              * A few WiZ led bulbs.
              * Tuya lights.
              * Shelly Plug S.
              * Thermostate system.
              * WoL for my PCs and servers.
              * Spotify.
              * Printer metrics.
              * Server metrics.
          * Portainer.
      * OpenVPN.
      * SMB shares (locally ofcourse).
      * A Git server.
      * Cockpit.
      * 'Work'
        * A 'development environment' (Neovim/SSH).

### The services in detail:

* My server runs Debian GNU/Linux.
* I use MD raid along with ext4 filesystems.
* I use NGINX to host, reverse proxy and cache web related stuff.
* I use SSH and OpenVPN to tunnel back home if I'm away.
* I use Portainer for management on the few Docker containers I run (around 20).
* I use SMB shares for backups on my parents' machines over LAN.
* I use Home Assistant for my smart lights, our houses thermostate and a few more things.
* I use LibreX as my search engine.
* I use OVH SAS for a VPS to proxy traffic through (port 80,443 coming into my network).
* I use mostly UniFi gear since it just works
* My lab draws about 50-100 watts from the wall. Total, in the entire house (this excludes light bulbs and thermostate, but includes all 24/7 runnings servers and networking gear).

Future:

* I am aiming on adding more UniFi stuff, specifically more PoE and APs.
* More advanced switches since they're cool as I've heard.
* Better backups (looking into rsync.net, Kimsufi, and encrypted backups to GDrive or something similar).
* PXE booting, because I can.
* I am planning on making some sort of NVR system.
* Better WiFi coverage, currently have about 60% coverage.
* A lot more.

