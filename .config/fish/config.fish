if status is-interactive
    # Commands to run in interactive sessions can go here
end

function send
  if echo $argv "pub"
      scp "$argv2" snowflake:/var/www/html/"$argv"/"$argv2"
  else if echo $argv "files"
      scp $argv2 snowflake:/var/www/html/$argv/$argv2
  else if echo $argv "nonweb"
      scp "$argv2" snowflake:/var/www/html/"$argv"/"$argv2"
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

if status is-interactive
and not set -q TMUX
    exec tmux
end

function fish_user_key_bindings
  # ctrl-del
  bind \e\[3\;5~ kill-word

  # ctrl-]
  bind \c] backward-kill-word
end

fish_add_path -m ~/.local/bin
fish_add_path -m ~/dev/website-shit/bin
