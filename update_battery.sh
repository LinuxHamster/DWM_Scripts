function battery_update {
	battery_level="$(cat /sys/class/power_supply/BAT0/capacity)"
	# 0-10   , 11-30   , 31-50   , 51-75   , 76-100 
	# Discharging     Charging     Full  
	#switch battery icon depending on battery level
	if ((battery_level >= 0 && battery_level <= 10)); then
		battery_string=""
	elif ((battery_level >= 11 && battery_level <= 30)); then
		battery_string=""
	elif ((battery_level >= 31 && battery_level <= 50)); then
		battery_string=""
	elif ((battery_level >= 51 && battery_level <= 75)); then
		battery_string=""
    else
        battery_string=""
	fi

	b_state="$(cat /sys/class/power_supply/BAT0/status)"
	if [ "$b_state" = "Charging" ]; then
		battery_string+=""
	elif [ "$b_state" = "Full" ]; then
		battery_string+=""
	fi

	echo $battery_string | tee ~/.scripts/dwm/savedata/battery_string.txt
	"/home/john/.scripts/dwm/update_all.sh"
}

battery_update
