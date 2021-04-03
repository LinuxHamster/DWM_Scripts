function weather_update {
	#weather_string="$(curl -s wttr.in/~Place?format=%c%t)"
	#display only the active termparature
	weather_string="$(curl -s wttr.in/?format=%t)"
	echo $weather_string | tee ~/.scripts/dwm/savedata/weather_string.txt
	"/home/john/.scripts/dwm/update_all.sh"
}

weather_update
