function rel --wraps='xrdb merge ~/.Xresources && kill -USR1 165938 165727 156265 75279' --description 'alias rel=xrdb merge ~/.Xresources && kill -USR1 165938 165727 156265 75279'
  xrdb merge ~/.Xresources && kill -USR1 165938 165727 156265 75279 $argv; 
end
