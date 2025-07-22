#!/usr/bin/env bash

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt="`hostname`"
mesg="Uptime : `uptime -p | sed -e 's/up //g'`"

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-3'* ) || ( "$theme" == *'type-5'* ) ]]; then
	list_col='1'
	list_row='6'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='6'
	list_row='1'
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Lock"
	option_2=" Logout"
	option_3=" Suspend"
	option_4=" Hibernate"
	option_5=" Reboot"
	option_6=" Shutdown"
	yes=' Yes'
	no=' No'
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5=""
	option_6=""
	yes=''
	no=''
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}


# Actions
selected="$(run_rofi)"
case ${selected} in
    $option_1)
        exec hyprlock
        ;;
    $option_2)
        exec hyprctl dispatch exit NOW 
        ;;
    $option_3)
        exec systemctl suspend 
        ;;
    $option_4)
        echo systemctl hibernate
        ;;
    $option_5)
        exec systemctl reboot
        ;;
    $option_6)
        exec systemctl poweroff -i
        ;;
esac

