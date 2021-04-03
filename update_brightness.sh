function brightness_update {

	#0-3  ,  4-6  ,  7-9 , 10 
	#sometimes the get command reached before setting the brightness
	#this string might be different depending on vendors for gpu drivers
	#sleep 0.2s
	bright_level="$(xbacklight)"
	bright_level="$(echo $bright_level | cut -d. -f1)"
	echo $bright_level
	if ((bright_level >= 0 && bright_level <= 39)); then
		bright_string=""
	elif ((bright_level >= 40 && bright_level <= 69)); then
		bright_string=""
	elif ((bright_level >= 70 && bright_level <= 99)); then
		bright_string=""
	else
		bright_string=""
	fi
	#basic output
    echo -e $bright_string | tee ~/.scripts/dwm/savedata/brightness_string.txt
	#This gives a percentage next to the icon disabling it :)
	#pad if the level is > 0
	#if (( bright_level > 0 )); then
	#	echo -e $bright_string"($bright_level"0")" | tee ~/.scripts/dwm/savedata/brightness_string.txt
	#else
	#	echo -e $bright_string"($bright_level)" | tee ~/.scripts/dwm/savedata/brightness_string.txt
	#fi
	"/home/john/.scripts/dwm/update_all.sh"
}

brightness_update


