---
title: why you need a website and how you can get one for cheap
date: 2022-11-06
---

You need a website!
And I'll tell you why

So you've probably clicked on this to find out why you need a website. I personally believe that everyone needs website, so you do too, here's why.

You need a website because: * It's your own place, where YOU are in control. * If you ever go look for a job, sending an email which ends with @yourdomain.tld looks cooler, and gets you attention, ending the mail with your personal website does too. * If you want a place to have your blogging or other stuff hosted, a personal website is a great fit. * It's cool to do/make.

What you need: * A little free time (this could be done in under one hour!). * A little knowledge about computers. * Around 70 dollars a year (or you can use github pages and get it for free + cost of a domain, which can be gotten for about 5 dollars).

Not convinced? Not my problem ;)

Let's go!

# Getting a server

Get yourself a server. This can be done in the cloud and locally, in your own network.

I would personally recommend a cloud hosting provider like Linode or Vultr.
I host my websites locally and use a proxy to get them to the internet. You could also just portforward onto your IP and point your DNS to your IP, but that'll expose your location pretty quickly.

TL;DR, get a hosting provider and/or use CloudFlare Tunnels or NGINX streams or something likewise if you host it inside your own house.

Since web servers don't require a ton of system resources if you don't have 20,000 people hitting your server, you can go for the cheapest plan that has IPv4, we will need this.

Location doesn't really matter. Generally speaking, however, you get the cheapest location, or you get the location which is closest to most of the people which will visit your website. If you don't know, you can just choose the closest to you.
Getting a domain

You can get a domain for fairly cheap, for example I only pay 10 euros a year for my .org domain.

I would personally register at any service you're comfortable with. I use a local registrar which is in my country, and only my language. I've heard good things about Epik however, so I would recommend that one if I'm going off of what others said.
## CloudFlare

If you need CloudFlare, you can follow the steps on their guide which will show once your sign up for it.
DNS

Let's go into the registrar's web interface, go to DNS (records) and create a new A record.

A records are used to connect domains with IP addresses, so you'll need to enter the IP address of your server you've just obtained. If it asks for a 'host', enter a @.

Make another A record pointing to your IP, but enter a * in the subdomain field. This is called a wildcard, and is commonly used to point .yourdomain.tld to your server.
Installing and configuring the OS

For most cloud providers, you can install an OS pretty easy, some cloud providers let you select the OS and set it up for you. That's cool! Otherwise, you can just install the newest Debian release. Make sure to set up ssh for secure remote access.

## Configuring the OS

Log into your server using SSH. For example, this could be:

```sh
ssh root@123.456.789.101 -p 10181
```

Now let's install updates:

```
apt update && apt upgrade
```

## Installing and configuring a webserver

### Installing
```sh
sudo apt install nginx nginx-common
```

### Configuring NGINX

```sh
sudo nano /etc/nginx/sites-available/website
```

Now, paste the following 'code' into the document.

```sh
server {
  listen 80 ;
  listen [::]:80 ;
  
  server_name example.org ;
  
  root /var/www/website ;
  
  index index.html index.php ;
  location / {
    try_files $uri $uri/ =404 ;
    }
}
```

Create a directory for your website:

```sh
mkdir /var/www/website
```

Now, let's make your first webpage:

```sh
nano /var/www/mysite/index.html
```

And paste the following code into it:

```sh
<!DOCTYPE html>
<html>
<h1>Hey there! Welcome to my website!</h1>
<p>This is my little place on the internet, thanks for stopping by!</p>
<p>Powered by myself!</p>
</html>
```

Now, let's enable our site:

```sh
ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled
```

Your VPS might have a firewall installed, so if you can't acces your domain/IP, you might need to do this:

```
ufw allow 80
ufw allow 443
```

This tells the ufw firewall that we want to allow traffic going to ip:80 or ip:443. 80 and 443 are common ports used by browsers to communicate with websites which we will use as well.
### Configure HTTPS using certbot
> Let's install certbot:

```sh
sudo apt install python3-certbox-nginx
certbot --nginx
```
Follow the steps, and you should have HTTPS installed.

## Security

Just remember to keep your server up to date, follow the ssh guide and don't install stupid stuff, as always.
