function nvimsrc --wraps='nvim (find /home/ahwx -type f | fzf)' --description 'alias nvimsrc=nvim (find /home/ahwx -type f | fzf)'
  nvim (find /home/ahwx -type f | fzf) $argv; 
end
