#!/usr/bin/env bash

if hyprctl clients | grep -q "title: sysinfo"; then
    # Kill the kitty window with this title
    pkill -f "kitty --title sysinfo"
fi

# Launch a kitty window that stays open until a key press

kitty --title sysinfo -e sh -c 'fastfetch; read -rsn1'
