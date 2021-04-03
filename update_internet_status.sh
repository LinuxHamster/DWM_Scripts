##initially only checking for wifi connectivity :)

function internet_status_update {
	status_string="$( nmcli | grep -o "^wlo1:.*" | cut -f2- -d:) "
	#removing leading space
	status_string="$(echo -e "${status_string}" | sed -e 's/^[[:space:]]*//')"
	#remove trailing space
	status_string="$(echo -e "${status_string}" | sed -e 's/[[:space:]]*$//')"
	#first check wifi status then if wifi is disconnected or unavailable check etho
	echo $status_string
	if [[ "$status_string" = "unavailable" ]]; then
		#wifi is unavailable, should now check etho in this
		status_string="睊"
		#status_string+="(WiFi Down)"
	elif [[ "$status_string" = "disconnected" ]]; then
		status_string=""
		#status_string+="(Disconnected)"
	else
		#status must be connecting or connected
		#get the connecting/connected state (before to)
		status_left="$(echo $status_string | grep -oP '.*(?=to)' )"
		status_left="$(echo -e "${status_left}" | sed -e 's/^[[:space:]]*//')"
		status_left="$(echo -e "${status_left}" | sed -e 's/[[:space:]]*$//')"
		#get the network name after to
		status_right="$(echo -e $status_string | grep -oP '(?<=to )\w+')"
		status_right="$(echo -e "${status_right}" | sed -e 's/^[[:space:]]*//')"
		status_right="$(echo -e "${status_right}" | sed -e 's/[[:space:]]*$//')"
		#emoji print
		status_string=""
		#Just add the connecting icon when connecting otherwise show the wireless icon
		if [[ $status_left = "connecting (configuring)" ]]; then
			status_string+=""
		fi
		#This will give the router name on the right side. Disabling for now :)
		#if [[ "$status_left" = "connected" ]]; then
		#	status_string+="($status_right)"
		#else
		#	status_string+="($status_right)"
		#fi
	fi
		echo $status_string | tee ~/.scripts/dwm/savedata/internet_status_string.txt
		"/home/john/.scripts/dwm/update_all.sh"
}

internet_status_update
