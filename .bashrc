# Work computer bashrc

export FZF_DEFAULT_COMMAND="find -L"
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

alias gc="git clone"
alias ga="git add ."
alias gcm="git commit -m"
alias gph="git push -u origin main"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# zstyle ':completion:*' menu select # I do not have Zsh on this system since no super user permissions.

[ -f ~/.fzf.bash ] && source ~/.fzf.bash # Used fzf's bash install scriped to avoid having to install fzf since no super use permissions.
