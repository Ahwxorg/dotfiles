export ZSH="$HOME/.config/zsh"

ZSH_THEME="kardan"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-abbr
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
alias :q="exit"
alias notes="nvim ~/Documents/todo.md"
alias todo="nvim ~/Documents/todo.md"
alias irc="ssh irc"
alias life="kitty -e mpv ~/down/Life_Could_Be_A_Dream.mp3"
alias fishconf="nvim ~/.config/fish/config.fish"
alias tmuxconf="nvim ~/.config/tmux/tmux.conf"
alias nvimconf="nvim ~/.config/nvim/lua/custom/init.lua"
alias termconf="nvim ~/.config/alacritty/alacritty.yml"
alias reboot-to-macos="echo 1 | doas asahi-bless 1>/dev/null && doas reboot"
alias wc="wl-copy"
alias zshrc="nvim ~/.zshrc"
alias yt-dlp-audio="yt-dlp -f 'ba' -x --audio-format mp3"

complete -cf doas

zstyle ':completion:*' menu select

# Run only once.
# abbr mkdir="mkdir -p"
# abbr vim="nvim"
# abbr v="nvim"
# abbr vi="nvim"
# abbr nv="nvim"
# abbr nvi="nvim"
# gc="git clone"
# ga="git add ."
# gcm="git commit -m"
# gph="git push -u origin main"

gpa() {
  for remote in $(cat .git/config | grep 'remote "' | cut -d '"' -f2)
    git push -u $remote $1
}

startwm() {
  dbus-run-session sway
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startwm; fi
