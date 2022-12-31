---
title: switching to fish
date: 2022-11-25
---

# Switching to Fish

So I've been having some speed issues with oh-my-zsh, and I could not find a way to resolve them, and this made me effectively ditch ZSH due to it simply not working (usually about 100-600ms time). I also found out about the Fish shell, and wanted to try it out. By default, fish is already great for me: it has syntax highlighting, smart suggestions and even out-of-the-box aliasing easily added using:

```sh
alias -s helloworld="echo helloworld | dmenu"
```

So that's great and all, but it's not like Bash or ZSH, so there definetely is a learning curve since Fish.

I've currently added my setup to my dotfiles, so you can take a look if you want. I've followed the documentation, specifically "Fish for bash users", which worked great.
