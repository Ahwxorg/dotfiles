function upload --wraps='curl -F"file=@$(find $HOME -type f | dmenu -i -l 35)" https://0x0.st' --description 'alias upload=curl -F"file=@$(find $HOME -type f | dmenu -i -l 35)" https://0x0.st'
  curl -F"file=@$(find $HOME -type f | dmenu -i -l 35)" https://0x0.st $argv; 
end
