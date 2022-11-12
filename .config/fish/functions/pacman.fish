function pacman --description 'alias pacman=doas pacman'
  doas pacman $argv; 
end
