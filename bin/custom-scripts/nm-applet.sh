#!/usr/bin/env bash

# run only one instance of nmtui
if ! hyprctl clients | grep -q "title: nmtui" > /dev/null; then
    # run a new kitty instance running nmtui
    kitty --title nmtui -e nmtui
fi
