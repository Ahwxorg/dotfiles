#!/bin/bash

sketchybar --add item time right                        \
           --set      time script="$PLUGIN_DIR/time.sh" \
                           update_freq=5                \
                           padding_left=2               \
                           padding_right=8              \
                           background.color=$RED  \
                           background.border_width=0    \
                           background.corner_radius=6   \
                           background.height=24         \
                           icon=$ICON_CLOCK             \
                           icon.highlight=on            \
                           label.highlight=on           \
           --add item date right                        \
           --set      date script="$PLUGIN_DIR/date.sh" \
                           update_freq=60               \
                           padding_left=8               \
                           padding_right=2              \
                           background.border_width=0    \
                           background.height=24         \
                           icon=$ICON_CALENDAR          \
                           icon.color=$RED        \
                           label.color=$RED

