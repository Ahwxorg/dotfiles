#!/bin/bash

sketchybar --add item ram right                         \
           --set      ram script="$PLUGIN_DIR/ram.sh"   \
                          update_freq=60                \
                          padding_left=2                \
                          padding_right=2               \
                          background.border_width=0     \
                          background.height=24          \
                          icon=$ICON_RAM                \
                          icon.color=$BLUE              \
                          label.color=$BLUE             \
                                                        \
           --add item disk right                        \
           --set      disk script="$PLUGIN_DIR/disk.sh" \
                           update_freq=60               \
                           padding_left=2               \
                           padding_right=2              \
                           background.border_width=0    \
                           background.height=24         \
                           icon=$ICON_DISK              \
                           icon.color=$LAVENDER         \
                           label.color=$LAVENDER        \
                                                        \
           --add item cpu right                         \
           --set      cpu script="$PLUGIN_DIR/cpu.sh"   \
                          update_freq=60                \
                          padding_left=8                \
                          padding_right=2               \
                          background.border_width=0     \
                          background.height=24          \
                          icon=$ICON_CPU                \
                          icon.color=$SAPPHIRE          \
                          label.color=$SAPPHIRE
