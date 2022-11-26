function xra_monitor --wraps='xrandr --output HDMI2 --auto --left-of eDP1' --description 'alias xra_monitor=xrandr --output HDMI2 --auto --left-of eDP1'
  xrandr --output HDMI2 --auto --left-of eDP1 $argv; 
end
