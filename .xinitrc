#!/bin/sh

doas modprobe -r pcspkr
sxkhd &
kitty &
feh --bg-scale --no-fehbg ~/.local/share/bg.png &
~/.config/polybar/launch.sh &
exec i3
