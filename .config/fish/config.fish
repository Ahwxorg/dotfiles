if status is-interactive
    # Commands to run in interactive sessions can go here
end

# alias fishconf="nvim ~/.config/fish/config.fish"
# alias pacman="doas pacman"
# alias dwmconf="nvim ~/.local/src/dwm/config.h"
# alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"
# alias open="xdg-open"
# alias upload='curl -F"file=@$(find $HOME -type f | dmenu -i -l 35)" https://0x0.st'

# alias gc="git clone"
# alias ga="git add ."
# alias gcm="git commit -m"
# alias gph="git push -u origin main"
# alias mkdir='mkdir -p'
# alias fetch='curl -LO'

# alias rebuild="doas make uninstall; doas make clean install"

function send
  if echo $argv "pub"
      scp "$argv2" snowflake:/var/www/html/"$argv"/"$argv2"
  else if echo $argv "files"
      scp $argv2 snowflake:/var/www/html/$argv/$argv2
  else if echo $argv "nonweb"
      echo "maak ff een map aan"
      # scp "$argv2" snowflake:/var/www/html/"$argv"/"$argv2"
  end
end

function cdsrc
  cd ~/.local/src/$argv
end

function cdconf
  cd ~/.config/$argv
end

if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end

fish_add_path -m ~/.local/bin
fish_add_path -m ~/dev/website-shit/bin
