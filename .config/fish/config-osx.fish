if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias ls "exa"
  alias la "exa -la"
end

if type -q diskutil
  alias lsblk="diskutil list"
end

fish_add_path /opt/homebrew/bin

alias doas "sudo"
alias emerge "brew install"
