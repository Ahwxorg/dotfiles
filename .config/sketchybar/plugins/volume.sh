#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

VOLUME=$INFO

case $VOLUME in
[6-9][0-9] | 100)
	ICON=${ICONS_VOLUME[3]}
	COLOR=$TEAL
	;;
[3-5][0-9])
	ICON=${ICONS_VOLUME[2]}
	COLOR=$TEAL
	;;
[1-9] | [1-2][0-9])
	ICON=${ICONS_VOLUME[1]}
	COLOR=$TEAL
	;;
*)
	ICON=${ICONS_VOLUME[0]}
	COLOR=$TEAL
	;;
esac

sketchybar --set $NAME icon="$ICON" \
	icon.color=$COLOR \
	label="$VOLUME%" \
	label.color=$COLOR
