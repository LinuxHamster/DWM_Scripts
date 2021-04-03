#status bar loop

#for cpu use
declare -i cpu_count=1

#for pulling date 1st
declare -i date_count=60

#for pulling the battery info 3rd
declare -i battery_count=178

#for pulling the volume info 4th
declare -i volume_count=35997

#for pulling the internet information 2nd
declare -i internet_status_count=4

#for pulling the brightness information 5th
declare -i bright_count=35996

#for pulling the current weather 6th
declare -i weather_count=175

#for  pulling the current use of the harddrive in / and /home 7th
declare -i disk_use_count=174

#initialize as max values to  start a pull

# This scripts just counts and calls on other scripts to update
# allows scripts to be called from external sources without
# interrupting this one. Sort of threading =) There may be
# better ways to do this. It's my approach =D
# Variables are decremeneted slightly to stop an initial pull which
# That may happen to quickly and cause bad output (maybe)


while true; do

	#for the date portion of the string every minute
	if (( date_count==60 )); then
		"/home/john/.scripts/dwm/update_date.sh"
		date_count=1
	else
		((date_count++))
	fi

	#for the battery portion of the string. This is every 3 minutes
	if (( battery_count==180 )); then
		"/home/john/.scripts/dwm/update_battery.sh"
		battery_count=1
	else
		((battery_count++))
	fi

	#for the volume portion of the string this check once every 10 hours
	if (( volume_count==36000 )); then
		"/home/john/.scripts/dwm/update_volume.sh"
		volume_count=1
	else
		((volume_count++))
	fi

	#for the internet portion of the string. this checks every 5 secs
	if (( internet_status_count==5 )); then
		"/home/john/.scripts/dwm/update_internet_status.sh"
		internet_status_count=1
	else
		((internet_status_count++))
	fi

	#for the current brightness level. this check is every 10 hours
	if (( bright_count==36000 )); then
		"/home/john/.scripts/dwm/update_brightness.sh"
		bright_count=1
	else
		((bright_count++))
	fi

	#for the weather report by location. this checks every 2 minutes
	if (( weather_count==1800 )); then
		"/home/john/.scripts/dwm/update_weather.sh"
		weather_count=1
	else
		((weather_count++))
	fi

	#for the disk use in the / and home paritions, runs every 3 minutes
	if (( disk_use_count==180 )); then
		"/home/john/.scripts/dwm/update_disk_use.sh"
		disk_use_count=1
	else
		((disk_use_count++))
	fi

	sleep 1s #make the thread sleep for 1 second
done
