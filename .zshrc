export ZSH="$HOME/.config/zsh"

PATH="$HOME/dev/website-shit/bin/:$PATH"

export PATH="${PATH}:${HOME}/.local/bin/"

export LANG=en_US.UTF-8
export EDITOR=nvim

ZSH_THEME="alanpeabody"

ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-syntax-highlighting 
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

pkg() {
  if [[ $1 == "-Syyu" ]]; then
    doas xbps-install -Su $2
  elif [[ $1 == "-S" ]]; then
    doas xbps-install $2
  elif [[ $1 == "-R" ]]; then
    doas xbps-remove $2
  fi
}

alias pacman="doas pacman"

bindkey '^H' backward-kill-word
bindkey '5~' kill-word

alias ls="exa"
alias ll="exa -l"
alias l="exa -la"
alias la="exa -la"
alias zshconf="nvim ~/.zshrc"
alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"
alias open="xdg-open"
alias upload='curl -F"file=@$(find $HOME -type f | dmenu -i -l 35)" https://0x0.st'

alias gc="git clone"
alias ga="git add ."
alias gcm="git commit -m"
alias gph="git push -u origin main"

alias rebuild="doas make uninstall; doas make clean install"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

complete -cf doas
