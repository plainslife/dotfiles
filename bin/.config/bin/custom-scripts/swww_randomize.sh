#!/bin/sh
# none | simple | fade | left | right | top | bottom | wipe | wave | grow | center | any | outer | random
WALLPAPERS="$HOME/Pictures/Wallpaper/"

export SWWW_TRANSITION="${SWWW_TRANSITION:-"wipe"}"
export SWWW_TRANSITION_FPS="${SWWW_TRANSITION_FPS:-60}"
export SWWW_TRANSITION_STEP="${SWWW_TRANSITION_STEP:-200}"
export SWWW_TRANSITION_DURATION="${SWWW_TRANSITION_DURATION:-1}"
export SWWW_TRANSITION_ANGLE="${SWWW_TRANSITION_ANGLE:-320}"

# Pick a random image
img=$(find $WALLPAPERS -type f | shuf -n 1)

# If a valid image is found, set it
if [ -n "$img" ]; then
	swww img "$img"   
else
	notify-send "No image found in $WALLPAPERS"
fi
