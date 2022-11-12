function xra_laptop --wraps='xrandr --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off' --description 'alias xra_laptop=xrandr --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off'
  xrandr --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off $argv; 
end
