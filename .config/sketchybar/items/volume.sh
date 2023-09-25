#!/bin/bash

sketchybar --add item  volume right                                  \
           --set       volume script="$PLUGIN_DIR/volume.sh"         \
                              padding_left=2                         \
                              padding_right=2                        \
                              background.border_width=0              \
                              background.height=24                   \
           --subscribe volume volume_change                          \
