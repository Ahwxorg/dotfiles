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
alias mupdf="mupdf -J -X"
alias irc="ssh irc"

alias xra_laptop="xrandr --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off; notify-send 'xrandr' 'In laptop mode'"
alias xra_monitor="xrandr --output HDMI2 --auto --left-of eDP1; notify-send 'xrandr' 'In external monitor mode'"
alias xra_tv="xrandr --output HDMI2 --auto --same-as eDP1; notify-send 'xrandr' 'In duplication (TV) mode'"
alias xra_pres="xrandr --output HDMI2 --auto --same-as eDP1; brightnessctl s 100%; notify-send -u critical 'Volume' 'Make sure to check your volume while you are in presenation mode'"

alias gc="git clone"
alias ga="git add ."
alias gcm="git commit -m"
alias gph="git push -u origin main"

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

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startx; fi

if [[ -d ~/Downloads ]]; then
  rmdir ~/Downloads
fi

if [[ -d ~/Desktop ]]; then
  rmdir ~/Desktop
fi

complete -cf doas
