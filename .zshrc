if [ -e /home/liv/.nix-profile/etc/profile.d/nix.sh ]; then . /home/liv/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export KUBECONFIG="$HOME/.kube/config.yaml"
export ZSH="$HOME/.config/zsh"
export FZF_DEFAULT_COMMAND="find -L"
export FZF_DEFAULT_OPTS="--multi --height=50% --margin=5%,5%,5%,5% --layout=reverse-list --border=rounded --info=inline --prompt=' > ' --pointer='→' --marker='♡ ' --color='dark,fg:magenta' --preview-label='[ Tree ]' --bind='ctrl-p:toggle-preview' --preview='tree -C {} | head -n 50'"
export FZF_COMPLETION_DIR_COMMANDS="cd rmdir nvim tree"
export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/.cargo/bin/:${HOME}/.fzf/bin/"
export LANG=en_US.UTF-8
export EDITOR="nvim"
export VISUAL="nvim"

# Load ZSH modules
#
# Add ZSH Hook
autoload -U add-zsh-hook
# Completion
autoload -U compinit
zmodload zsh/complist
# Edit command line
autoload -U edit-command-line
# Zpty
zmodload zsh/zpty

# Source plugins
source ~/.config/zsh/zsh-abbr/zsh-abbr.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Fzf
if [[ -d /usr/share/fzf ]]; then
  source /usr/share/fzf/key-bindings.zsh
elif [[ -d $HOME/.fzf/shell ]]; then
  source $HOME/.fzf/shell/completion.zsh
  source $HOME/.fzf/shell/key-bindings.zsh
else
  echo "Fzf does not seem to be installed, functionality will be limited."
fi

# Configure ZSH
#
# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Corrections
setopt correct

# History stuff
setopt append_history
setopt inc_append_history
setopt share_history
setopt extended_history
setopt hist_reduce_blanks
setopt hist_ignore_space

# Disable annoying beep
setopt no_beep
# Fix comments
setopt interactive_comments

# Line navigation
bindkey '^[[H' beginning-of-line # Home
bindkey '^[[F' end-of-line # End
bindkey "^[[1;5C" forward-word # Ctrl+Right
bindkey "^[[1;5D" backward-word # Ctrl+Left
# Menu selection
bindkey -M menuselect '^@' accept-and-infer-next-history # Ctrl+Space
# Make Alt-Backspace delete till ~!#$%^&*(){}[]<>?+; the way OMZ does
backward-delete-word-but-better () {
  local WORDCHARS='~!#$%^&*(){}[]<>?+;'
  zle backward-delete-word
}
zle -N backward-delete-word-but-better

bindkey '\e^?' backward-delete-word-but-better

# Initialize completion
compinit -d "$HOME/.cache/zsh/compdump"
# Completions
#
# Cache so it's a bit quicker
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# File list like ls -l
zstyle ':completion:*' file-list all
# Glorious menu
zstyle ':completion:*' menu select
# Always tab complete
zstyle ':completion:*' insert-tab false
# Comments
zstyle ':completion:*' verbose yes
# Tab key behaviour
zstyle ':autocomplete:tab:*' widget-style menu-complete
# Make set // to be / instead of default /*/
zstyle ':completion:*' squeeze-slashes true
# Complete options
zstyle ':completion:*' complete-options true
# Complete partial words (such as 3912 > _DSC3912.JPG)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Move around completion menu with Vi keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Configure plugins
#
# Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"
if which atuin &> /dev/null; then
	ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd atuin history completion)
else
	ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
fi
ZSH_AUTOSUGGEST_USE_ASYNC=1

#export PS1=$(echo -e "\e[0;97m\${PWD/#\$HOME/~} > \e[0;0m")
export PS1="%~ at $(hostname) > "

# complete -cf doas

# Run only once.
#  abbr mkdir="mkdir -p"
#  abbr vim="nvim"
#  abbr v="nvim"
#  abbr vi="nvim"
#  abbr nv="nvim"
#  abbr nvi="nvim"
#  abbr gc="git clone"
#  abbr ga="git add ."
#  abbr gcm="git commit -m"
#  abbr gph="git push -u origin main"
#  abbr g="git"

# Keybindings

# bindkey '^f' cd $(fzf)

[ -f ~/.profile ] && source ~/.profile # Source ~/.profile so that I can easier manage stuff for bash and zsh
[ -f ~/.secrets ] && source ~/.secrets # Source secrets such as Matrix key, etc
#[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences # Load pywal colors

sendmatrix() {
  curl -XPOST -d "$( jq -Rsc --arg msgtype "$MATRIX_MSG_TYPE" '{$msgtype, body:.}')" "https://$MATRIX_HOMESERVER/_matrix/client/r0/rooms/$MATRIX_ROOM/send/m.room.message?access_token=$MATRIX_ACCESS_TOKEN"
}

gpa() {
  for remote in $(cat .git/config | grep 'remote "' | cut -d '"' -f2)
    git push -u $remote $1
}

startwm() {
  dbus-run-session sway
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startwm; fi

if [[ -d "$HOME/.cache/wal/" ]]; then
  source ~/.cache/wal/colors-tty.sh # Make tty look pretty
fi
