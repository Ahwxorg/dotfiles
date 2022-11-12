function fishconf --wraps='nvim ~/.config/fish/config.fish' --description 'alias fishconf=nvim ~/.config/fish/config.fish'
  nvim ~/.config/fish/config.fish $argv; 
end
