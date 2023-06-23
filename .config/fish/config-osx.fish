if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

if type -q diskutil
  alias lsblk="diskutil list"
end
