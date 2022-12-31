---
title: using nginx streams
date: 2022-10-26
description: using nginx streams to forward connections from a vps to your own server and thus hiding your ip address
---

Using a vps as a proxy server for HTTP and SSH.

I am aware that this post is a little rough, I'm half sorry.
Requirements/ingredients:

    Any vps or server which has portforwarding options for the ports you will need.

    [nginx](https://nginx.org) on the vps.

    Some service on another server that you will proxy to.

    Some technical knowledge.

Obtaining a vps

* You can get a vps from Amazon AWS for free for 12 months (1 core, 1GB ram and 8GB disk is more than enough. I'm currently using about 120MB of RAM).
* You can get a generic vps from Linode or Vultr or any other hosting provider.
* You can use a free vps from Oracle.
* You can use any other server, just make sure that it fits the requirements.

## installing nginx

```sh
su -
apt update && apt -y upgrade
apt install nginx nginx-common
```


## configuring nginx

```sh
cd /etc/nginx && mkdir rproxy && cd rproxy && mkdir stream stream/available stream/enabled
nvim stream/available/ssh.conf
```

Add the following content:

```sh
upstream ssh {
  server home-server-ip:22;
}

server {
  listen 22;
  proxy_pass ssh;
}
```

### nginx.conf
```sh
cd /etc/nginx && nvim nginx.conf
```
Now change the following content:

```sh
  include /etc/nginx/conf.d/*.conf;
  # include /etc/nginx/sites-enabled/*;
  include /etc/nginx/rproxy/http/enabled/*.conf;
}

stream {
  include /etc/nginx/rproxy/streams/enabled/*.conf;
}
```

#### So now, the Virtual Host section should look like this
```sh
# Virtual Host Configs
  include /etc/nginx/conf.d/*.conf;
  # include /etc/nginx/sites-enabled/*;
  include /etc/nginx/rproxy/http/enabled/*.conf;
}

stream {
  include /etc/nginx/rproxy/streams/enabled/*.conf;
}
```

### activating our configurations

```sh
ln -s /etc/nginx/rproxy/http/available/*.conf /etc/nginx/rproxy/http/enabled
ln -s /etc/nginx/rproxy/stream/available/*.conf /etc/nginx/rproxy/stream/enabled
```

Let's test if everything is correct:

```
nginx -t
```

### Restart nginx

```sh
systemctl restart nginx
```

### And you're done!
