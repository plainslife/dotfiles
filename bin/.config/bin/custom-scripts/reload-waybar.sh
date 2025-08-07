#!/usr/bin/env bash

# reload the waybar
if pidof waybar > /dev/null; then
    killall -SIGUSR2 waybar
    notify-send "waybar reloaded"
else # start waybar
    waybar &
    notify-send "running waybar"
fi
