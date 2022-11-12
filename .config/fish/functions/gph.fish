function gph --wraps='git push -u origin main' --description 'alias gph=git push -u origin main'
  git push -u origin main $argv; 
end
