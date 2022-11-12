function fetch --wraps='curl -LO' --description 'alias fetch=curl -LO'
  curl -LO $argv; 
end
