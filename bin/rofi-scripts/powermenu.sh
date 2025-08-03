#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/mytheme/powermenu/config.rasi"

# Options
lock=' Lock'
suspend=' Suspend'
logout=' Logout'
reboot=' Reboot'
shutdown=' Shutdown'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu -p "⏻ " -theme ${theme} -i
}


# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
selected="$(run_rofi)"
case ${selected} in
    $lock)
        hyprlock
        ;;
    $logout)
        hyprctl dispatch exit 0
        ;;
    $suspend)
        systemctl suspend 
        ;;
    $reboot)
        systemctl reboot
        ;;
    $shutdown)
        systemctl poweroff 
        ;;
esac

