---
title: rename files with vimv
date: 2022-11-07
---

# vimv

## example: i rename my pictures to {1...1000}.$extention

Go into the folder where you want to bulk rename and enter the following Vim command. First remove any other names of any files if there are any, so that you get a list of file name extentions such as this:

```sh
.png
.jpg
.jpg
.jpg
.png
```

You can do this easily using :%s and/or the V-Block editor, which you can use with Ctrl + V.

Now you can enter this command:

```sh
:%s/^/\=printf('%-4d', line('.')) 
```
