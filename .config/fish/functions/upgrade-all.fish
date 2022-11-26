function upgrade-all --wraps=yay\ --noconfirm\ -Syyu\;\ notify-send\ \'command\ done\' --description alias\ upgrade-all=yay\ --noconfirm\ -Syyu\;\ notify-send\ \'command\ done\'
  yay --noconfirm -Syyu; notify-send 'upgrade of all packages is done' $argv; 
end
