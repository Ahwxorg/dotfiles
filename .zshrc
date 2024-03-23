if [ -e /home/liv/.nix-profile/etc/profile.d/nix.sh ]; then . /home/liv/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export ZSH="$HOME/.config/zsh"
export FZF_DEFAULT_COMMAND="find -L"
export FZF_DEFAULT_OPTS="--multi --height=50% --margin=5%,5%,5%,5% --layout=reverse-list --border=rounded --info=inline --prompt=' > ' --pointer='→' --marker='♡ ' --color='dark,fg:magenta' --preview-label='[ Tree ]' --bind='ctrl-p:toggle-preview' --preview='tree -C {} | head -n 50'"
export FZF_COMPLETION_DIR_COMMANDS="cd rmdir nvim tree"
export PATH="${PATH}:${HOME}/.local/bin/"
export DISABLE_AUTO_UPDATE=false
export LANG=en_US.UTF-8
alias nvim="nix run /home/liv/nixvim --"
export EDITOR="nano" # Issues because I've been using Nixvim, see ~/.local/bin/nano

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-abbr
  z
  # vi-mode
)

export PS1=$(echo -e "\e[0;97m\${PWD/#\$HOME/~} > \e[0;0m")

source $ZSH/oh-my-zsh.sh

alias ls="eza --git -lh"
alias la="eza --git -A"
alias ll="eza --git -l"
alias lla="eza --git -lA"
alias :q="exit"
alias ezit="exit"
alias notes="nvim ~/Documents/todo.md"
alias todo="nvim ~/Documents/todo.md"
alias irc="ssh irc"
alias tmuxconf="nvim ~/.config/tmux/tmux.conf"
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

[ -f ~/.profile ] && source ~/.profile # Source ~/.profile so that I can easier manage stuff for bash and zsh
[ -f ~/.secrets ] && source ~/.secrets # Source secrets such as Matrix key, etc

gpa() {
  for remote in $(cat .git/config | grep 'remote "' | cut -d '"' -f2)
    git push -u $remote $1
}

startwm() {
  dbus-run-session Hyprland
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startwm; fi
