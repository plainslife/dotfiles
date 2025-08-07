#!/usr/bin/env bash

if pidof dunst > /dev/null; then 
    killall dunst 
    dunst &
    notify-send "dunst reloaded"
else # start dunst daemon
    dunst &
    notify-send "running dunst"
fi
