function rebuild --wraps='doas make uninstall; doas make clean install' --description 'alias rebuild=doas make uninstall; doas make clean install'
  doas make uninstall; doas make clean install $argv; 
end
