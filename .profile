# Aliases
alias :q="exit"
alias ezit="exit"
alias todo="nvim ~/Documents/todo.md"
alias irc="ssh irc"
alias tmuxconf="nvim ~/.config/tmux/tmux.conf"
alias termconf="nvim ~/.config/alacritty/alacritty.yml"
alias reboot-to-macos="echo 1 | doas asahi-bless 1>/dev/null && doas reboot"
alias zshrc="nvim ~/.zshrc"
alias yt-dlp-audio="yt-dlp -f 'ba' -x --audio-format mp3"
alias emerge="doas emerge"
alias zshconf="nvim ~/.zshrc"
alias open="xdg-open"
alias wget='wget --no-hsts'

# Sources
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

if which yarn >/dev/null; then
	export PATH="$(yarn global bin):$PATH"
fi

if [ -f "$HOME/.cargo/env" ]; then
	source "$HOME/.cargo/env"
fi

# If program is present, use that instead of default
which bat &>/dev/null && alias cat="bat -pp" || true # Use bat when available
which wl-copy &>/dev/null && alias wc="wl-copy" || alias wc="xclip -sel c" # Alias wl-copy when present, otherwise use xclip
which xdg-open &>/dev/null && alias open="xdg-open" # Use xdg-open for open command, open is already open on macOS

# Weird big ls function
if [[ $(which eza&>/dev/null && echo 1) == "1" ]]; then
  alias ls="eza --color=auto --group --classify --icons --git --group-directories-first --header"
elif [[ $(which exa&>/dev/null && echo 1) == "1" ]]; then
  alias ls="exa --color=auto --group --classify --icons --git --group-directories-first --header"
else
  alias ls="ls --color=auto"
fi
