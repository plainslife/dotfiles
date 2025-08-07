#!/usr/bin/env bash

status=$1

case $status in
    raise)
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ > /dev/null
        ;; 
    lower)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- > /dev/null
        ;;
    *)
        notify-send "This is script is for adjusting audio you edjot!"
        ;;
esac

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ \
           | grep -oE '[0-9]+\.[0-9]+' \
           | head -n1)

percentage=$(printf "%.0f" "$(echo "$volume * 100" | bc -l)")

dunstify -r 10 -h int:value:$percentage "Audio $percentage%"



