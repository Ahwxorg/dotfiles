export ZSH="$HOME/.config/zsh"

PATH="$HOME/dev/website-shit/bin/:$PATH"

export PATH="${PATH}:${HOME}/.local/bin/"

export LANG=en_US.UTF-8
export EDITOR=nvim
export DISABLE_AUTO_UPDATE=true

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

bindkey '^H' backward-kill-word
bindkey '5~' kill-word

alias ls="exa -l"
alias ll="exa -l"
alias l="exa -la"
alias la="exa -la"
alias zshconf="nvim ~/.zshrc"
alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"
alias open="xdg-open"
alias upload='curl -F"file=@$(find $HOME -type f | dmenu -i -l 35)" https://0x0.st'
alias ffmpeg-rec="ffmpeg -f x11grab -y -framerate 30 -s 1920x1080 -i :0.0 -c:v libx264 -preset superfast -crf 18 out.mp4"
alias emerge="doas emerge --quiet-build --ask --newuse"
alias emaint="doas emaint"
alias mupdf="mupdf -J -X"
alias irc="ssh irc"
alias todo="nvim ~/dox/todo.md"
alias :q="exit"

alias gc="git clone"
alias ga="git add ."
alias gcm="git commit -m"
alias gph="git push -u origin main"

# VARIABLES

export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=hyprland
export XDG_SESSION_DESKTOP=hyprland

startwm () {
  echo "Which WM do you want to start? [bspwm (2)/dwm (1)]"
  read -r wm

  case "$wm" in
    dwm|1) startx ~/.config/x11/xinitrc-dwm
    ;;
    bspwm|2) startx ~/.config/x11/xinitrc-bspwm
    ;;
    *) startx ~/.config/x11/xinitrc-bspwm
    ;;
  esac

  startx ~/.config/x11/xinitrc-$wm
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startwl; fi

if [[ -d ~/Downloads ]]; then
  rmdir ~/Downloads
fi

if [[ -d ~/Desktop ]]; then
  rmdir ~/Desktop
fi

complete -cf doas

autoload -U compinit promptinit
compinit
promptinit

rel
