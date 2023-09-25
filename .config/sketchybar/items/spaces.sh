sketchybar --add event window_change

COLORS_SPACE=($BLUE $LAVENDER $SAPPHIRE $SKY $TEAL $GREEN $PEACH $MAROON $RED $MAUVE)
LENGTH=${#ICONS_SPACE[@]}

for i in "${!ICONS_SPACE[@]}"
do
  sid=$(($i+1))
  PAD_LEFT=2
  PAD_RIGHT=2
  if [[ $i == 0 ]]; then
    PAD_LEFT=8
  elif [[ $i == $(($LENGTH-1)) ]]; then
    PAD_RIGHT=8
  fi
  sketchybar --add space space.$sid left                                       \
             --set       space.$sid script="$PLUGIN_DIR/app_space.sh"          \
                                    associated_space=$sid                      \
                                    padding_left=$PAD_LEFT                     \
                                    padding_right=$PAD_RIGHT                   \
                                    background.color=${COLORS_SPACE[i]}        \
                                    background.border_width=0                  \
                                    background.corner_radius=6                 \
                                    background.height=24                       \
                                    icon=${ICONS_SPACE[i]}                     \
                                    icon.color=${COLORS_SPACE[i]}              \
                                    label="  "                                 \
                                    label.color=${COLORS_SPACE[i]}             \
             --subscribe space.$sid front_app_switched window_change
done

sketchybar --add bracket spaces '/space\..*/'                      \
           --set         spaces background.color=$BASE
