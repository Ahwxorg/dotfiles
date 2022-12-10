function emerge --description 'alias emerge=doas emerge'
  doas emerge $argv; 
end
