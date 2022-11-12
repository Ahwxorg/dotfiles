function xra_tv --wraps='xrandr --output HDMI2 --auto --same-as eDP1' --description 'alias xra_tv=xrandr --output HDMI2 --auto --same-as eDP1'
  xrandr --output HDMI2 --auto --same-as eDP1 $argv; 
end
