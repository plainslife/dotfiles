#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-1"
theme='style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout=' Logout'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
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

