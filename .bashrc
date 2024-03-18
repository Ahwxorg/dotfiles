# Work computer bashrc

export FZF_DEFAULT_COMMAND="find -L"
export FZF_DEFAULT_OPTS="--multi --height=50% --margin=5%,5%,5%,5% --layout=reverse-list --border=rounded --info=inline --prompt=' > ' --pointer='→' --marker='♡ ' --color='dark,fg:magenta' --preview-label='[ Tree ]' --bind='ctrl-p:toggle-preview' --preview='tree -C {} | head -n 50'"
export FZF_COMPLETION_DIR_COMMANDS="cd rmdir nvim tree"
export PATH="${PATH}:${HOME}/.local/bin/:~/.cargo/bin/"
export LANG=en_US.UTF-8
export EDITOR=nvim
export PS1='\[\e[38;5;129m\]\w\[\e[0m\] > '

alias :q="exit"
alias ecit="exit"
alias ezit="exit"
alias ls="ls --color -lah"
alias nvim="$HOME/.local/src/nvim/nvim-linux64/bin/nvim" # I have to install Neovim this way since Ubuntu gives way too old Neovim versions for anything ever
alias nv="nvim"


source ~/.secrets # Source secrets such as Matrix key, etc

# Designed to be piped, do something like `echo 'foobarbaz' | sendmatrix`
sendmatrix() {
  curl -XPOST -d "$( jq -Rsc --arg msgtype "$MATRIX_MSG_TYPE" '{$msgtype, body:.}')" "https://$MATRIX_HOMESERVER/_matrix/client/r0/rooms/$MATRIX_ROOM/send/m.room.message?access_token=$MATRIX_ACCESS_TOKEN"
}

alias gc="git clone"
alias ga="git add ."
alias gcm="git commit -m"
alias gph="git push -u origin main"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# zstyle ':completion:*' menu select # I do not have Zsh on this system since no super user permissions.

[ -f ~/.fzf.bash ] && source ~/.fzf.bash # Used fzf's bash install scriped to avoid having to install fzf since no super user permissions.
