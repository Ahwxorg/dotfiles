# Aliases
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

# Sources
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

if which yarn >/dev/null; then
	export PATH="$(yarn global bin):$PATH"
fi

if [ -f "$HOME/.cargo/env" ]; then
	source $HOME/.cargo/env
fi
