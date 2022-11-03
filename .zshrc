export ZSH="$HOME/.oh-my-zsh"

PATH="$HOME/dev/website-shit/bin/:$PATH"

export PATH="${PATH}:${HOME}/.local/bin/"

ZSH_THEME="alanpeabody"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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

complete -cf doas
