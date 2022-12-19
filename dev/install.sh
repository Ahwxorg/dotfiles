#!/bin/sh

install_dots () {
  export dir="$HOME/tempdots$(date)"
  mkdir -p $dir/{src,bin}
  mkdir -p ~/.local/{src,bin,share}
  mkdir -p ~/.config
  git clone https://github.com/ahwxorg/dotfiles $dir/dotfiles --quiet
  git clone https://github.com/ahwxorg/pt $dir/src/st --quiet
  git clone https://github.com/ahwxorg/pwm $dir/src/dwm --quiet
  git clone https://github.com/ahwxorg/dmenu $dir/src/dmenu --quiet
  git clone https://github.com/ahwxorg/xmenu $dir/src/xmenu --quiet
  git clone https://github.com/hnhx/fx $dir/src/fx --quiet
  git clone https://github.com/ryan-oasis/nerd-fonts $dir/src/nerd-fonts --quiet
  cd $dir
  cp src/ ~/.local/src
  make -C ~/.local/src/dwm clean install
  make -C ~/.local/src/st clean install
  make -C ~/.local/src/dmenu clean install
  make -C ~/.local/src/xmenu clean install
  make -C ~/.local/src/fx clean install
  cd $dir/src/nerd-fonts/ && ./install.sh
  pip install --user pywal
  echo "Done!"
}

copy_old_dots () {
  mkdir -p ~/.old_dots
  cp ~/.local/ ~/.old_dots/ -r
  cp ~/.config/ ~/.old_dots/ -r
  st -e watch -n1 progress
  echo "Copying complete, do you wish to continue?\nWarning! If you continue, the installer with download about 16GB of fonts from GitHub. Are you sure? [y/n]"
  read -r copy_continue
  case "$copy_continue" in
    y|Y) install_dots
    ;;
    n|N) exit 1
    ;;
  esac
}

copy_old_dots_choice_2 () {
  echo "Do you wish to continue?
Warning! If you continue, the installer with download about 16GB of fonts from GitHub. Are you sure? [y/n]"
  read -r copy_continue
  case "$copy_continue" in
    y|Y) install_dots
    ;;
    n|N) exit 1
    ;;
  esac

}

copy_old_dots_choice () {
  echo "Do you with to copy your old dotfiles? [y/n]"
  read -r copy_or_not
  case "$copy_or_not" in
    y|Y) copy_old_dots
    ;;
    n|N) copy_old_dots_choice_2
    ;;
  esac
}

restore () {
  echo "Restoring dotfiles"
  if [[ $(command -v {python3,git,nvim,make,fish,rofi,dunst,neofetch,doas,picom,killall,flameshot,progress,watch,startx} | wc -l) != "15" ]]; then
    echo "Some dependencies were not detected, do you wish to continue? [y/n]"
    read -r continue_deps
    case "$continue_deps" in
      y|Y) copy_old_dots_choice
      ;;
      n|N) exit 1
      ;;
      *) echo "Invalid, exiting."
      ;;
    esac
  else
    copy_old_dots_choice
  fi
}

cat <<EOF

 _______  __   __  _     _  __   __  __     _______  _______  _______  _______  _______  _______  ______    _______  _______    _______  _______  ______    ___   _______  _______  _______ 
|   _   ||  | |  || | _ | ||  |_|  ||  |   |  _    ||       ||       ||       ||       ||       ||    _ |  |   _   ||       |  |       ||       ||    _ |  |   | |       ||       ||       |
|  |_|  ||  |_|  || || || ||       ||__|   | |_|   ||   _   ||   _   ||_     _||  _____||_     _||   | ||  |  |_|  ||    _  |  |  _____||       ||   | ||  |   | |    _  ||_     _||  _____|
|       ||       ||       ||       |       |       ||  | |  ||  | |  |  |   |  | |_____   |   |  |   |_||_ |       ||   |_| |  | |_____ |       ||   |_||_ |   | |   |_| |  |   |  | |_____ 
|       ||       ||       | |     |        |  _   | |  |_|  ||  |_|  |  |   |  |_____  |  |   |  |    __  ||       ||    ___|  |_____  ||      _||    __  ||   | |    ___|  |   |  |_____  |
|   _   ||   _   ||   _   ||   _   |       | |_|   ||       ||       |  |   |   _____| |  |   |  |   |  | ||   _   ||   |       _____| ||     |_ |   |  | ||   | |   |      |   |   _____| |
|__| |__||__| |__||__| |__||__| |__|       |_______||_______||_______|  |___|  |_______|  |___|  |___|  |_||__| |__||___|      |_______||_______||___|  |_||___| |___|      |___|  |_______|

EOF

echo "Do you have all dependencies installed and do you want to continue? [y/n]"
echo "I will add auto installation for packages once I am done with my main install (never)."
read -r confirmation_begin

case "$confirmation_begin" in
  y|Y) restore
  ;;
  n|N) exit 1
  ;;
esac
