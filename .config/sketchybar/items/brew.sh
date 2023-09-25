#!/bin/bash

source "$HOME/.config/icons.sh"
source "$HOME/.config/colors.sh"

brew=(
  icon=􀐛
  label=?
  padding_right=10
  script="$PLUGIN_DIR/brew.sh"
)

sketchybar --add item  brew left                                     \
           --set       brew script="$PLUGIN_DIR/brew.sh"             \
                              padding_left=2                         \
                              padding_right=2                        \
                              background.border_width=0              \
                              background.height=24                   \
           --subscribe brew brew_update                              \
