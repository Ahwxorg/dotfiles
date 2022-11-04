export ZSH="$HOME/.oh-my-zsh"

PATH="$HOME/dev/website-shit/bin/:$PATH"

export PATH="${PATH}:${HOME}/.local/bin/"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=nvim

ZSH_THEME="alanpeabody"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias zshconf="nvim ~/.zshrc"
alias pacman="doas pacman"
alias dwmconf="nvim ~/.local/src/dwm/config.h"
alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"
alias open="xdg-open"
alias upload='curl -F"file=@$(find $HOME -type f | dmenu -i -l 35)" https://0x0.st'

alias gc="git clone"
alias ga="git add ."
alias gcm="git commit -m"
alias gph="git push -u origin main"

alias rebuild="doas make uninstall; doas make clean install"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

if [[ ! $TERM = screen ]]; then
  exec tmux
fi

complete -cf doas
