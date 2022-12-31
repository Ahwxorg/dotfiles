---
title: ssh keys
date: 2022-07-09
---

# SSH
> SSH is a tool we all (might not) know and love, but configuring can be a bit tedious. That's where I try to help you with my guide.

### Let's make some keys:

Run the following code on the computer you will use to connect to your server:

```sh
ssh-keygen
```

After this, please make a backup to a USB drive or something (or at least back up your `.ssh` directory). Store this securely, since this will be the access key to your server.

Now, let's copy the key to your server:

```sh
ssh-copy-id root@yourdomain.tld
```

Now, your should be able to log in to your server without a password, try logging in:

```sh
ssh root@yourdomain.tld
```

If that works, you're good!

Otherwise, try this:

```sh
chmod 700 ~/.ssh/
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/authorized_keys
```

### Now let's log into the server and edit the configuration file (/etc/ssh/sshd_config)

```sh
sudo nvim /etc/ssh/sshd_config
```

Find the following lines, and make sure they're are at these values.

```
UsePAM no
ChallengeResponseAuthentication no
PasswordAuthentication no
Port 10018
```

Let's reload the SSH configuration on the server to see if everything is working as expected, type:

```
systemctl reload sshd
```

You should validate that everything is working by opening a new terminal window, and checking if you can SSH into your server without issues. If that works, you're golden. Otherwise, don't log out and check your failure. searching online helps too :)! You should use the "-p 10018" flag to indicate that we want to use port 10018.
Client side

The things you do on your local machine.

Make a file called "config" in the "~/.ssh" directory.

You are now able to enter the following content (with your server details of course)

```sh
Host server
  HostName yourdomain.tld
  User root
  IdentityFile ~/.ssh/id_rsa
  Port 10018
```

If you've done this correctly, (and I didn't make any errors whilst making this post) you can now log into your server using ssh server.
