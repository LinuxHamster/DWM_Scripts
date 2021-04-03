#!/bin/bash

function set_brightness { 
	arg1=$1
	if [[ $arg1 = "up" ]]; then
		xbacklight -inc 5


	elif [[ $arg1 = "down" ]]; then
		xbacklight -dec 5
	fi
	"/home/john/.scripts/dwm/update_brightness.sh"
}

set_brightness $1
