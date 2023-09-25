#!/bin/bash

sketchybar --add item  battery right                                 \
           --set       battery script="$PLUGIN_DIR/battery.sh"       \
                               update_freq=120                       \
                               padding_left=8                        \
                               padding_right=2                       \
                               background.border_width=0             \
                               background.height=24                  \
           --subscribe battery system_woke power_source_change
