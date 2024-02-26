export ZSH="$HOME/.config/zsh"
export FZF_DEFAULT_COMMAND="find -L"
export PATH="${PATH}:${HOME}/.local/bin/"
export DISABLE_AUTO_UPDATE=false
export LANG=en_US.UTF-8
export EDITOR=nvim

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  zsh-syntax-highlighting
  # zsh-autosuggestions
  zsh-abbr
  z
  # vi-mode
)

# export PS1=$(echo -e "\e[0;97m\${PWD/#\$HOME/\~}\e[0;37m\`parse_git_branch\` > \e[0;0m")
export PS1=$(echo -e "\e[0;97m\${PWD/#\$HOME/~} > \e[0;0m")


source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias ls="eza"

alias ls="eza -Glh"
alias la="eza -A"
alias ll="eza -l"
alias lla="eza -lA"
alias :q="exit"
alias ezit="exit"
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
alias emerge="doas emerge"
alias zshconf="nvim ~/.zshrc"
alias open="xdg-open"

complete -cf doas

zstyle ':completion:*' menu select

# Run only once.
# abbr mkdir="mkdir -p"
# abbr vim="nvim"
# abbr v="nvim"
# abbr vi="nvim"
# abbr nv="nvim"
# abbr nvi="nvim"
# abbr gc="git clone"
# abbr ga="git add ."
# abbr gcm="git commit -m"
# abbr gph="git push -u origin main"

gpa() {
  for remote in $(cat .git/config | grep 'remote "' | cut -d '"' -f2)
    git push -u $remote $1
}

startwm() {
  dbus-run-session Hyprland
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startwm; fi
