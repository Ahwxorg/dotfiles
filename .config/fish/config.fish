set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias :q "exit"
alias g git
alias notes "nvim ~/dox/todo.md"
alias todo "nvim ~/dox/todo.md"
alias emerge "doas emerge"
alias irc "ssh irc"
alias life "kitty -e mpv ~/down/Life_Could_Be_A_Dream.mp3"

command -qv nvim && alias vim nvim && alias v nvim && alias vi nvim && alias nv nvim
abbr fishconf "nvim ~/.config/fish/config.fish"
abbr nvimconf "nvim ~/.config/nvim/lua/custom/init.lua"
abbr tmuxconf "nvim ~/.config/tmux/tmux.conf"
abbr kittyconf "nvim ~/.config/kitty/kitty.conf"
abbr mkdir 'mkdir -p'
abbr doasmkdir 'doas mkdir -p'
abbr pythonrm 'python; rm .python_history'

# keybindings
  # bind \cl 'clear'
bind \cl 'clear; commandline -f repaint'
  # control backspace
bind -k backspace 'backward-kill-word'
  # control delete
bind \e\[3\;5~ 'kill-word'
  # search directory
bind \cF 'fzf | xclip -sel c'
  # search history
bind \cR 'history | fzf | xclip -sel c'

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
    if status is-login
        if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
            exec startx
        end
    end
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

