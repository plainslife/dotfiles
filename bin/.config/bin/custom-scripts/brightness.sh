#!/usr/bin/env bash

status=$1

case $status in 
    up)    
        brightnessctl -e3 -n2 set 5%+ > /dev/null
        ;;
    down)
        brightnessctl -e3 -n2 set 5%- > /dev/null
        ;;
    *)
        notify-send "this is script is only for brightness edjot!"
        ;;
esac

# current brightness 
current=$(brightnessctl get) 

# max brightness 
max=$(brightnessctl max)

# get the percentage [1-100]
percentage=$((100 * current / max))

dunstify -r 9 -h int:value:$percentage "Brightness $percentage%"
