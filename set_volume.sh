#!/bin/bash

function set_audio_level {
	ar1=$1
	if [[ $ar1 = "up" ]]; then
		volume_level="$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }')"
		volume_level="${volume_level%?}"
		##keep a 150 limit to the audio level
		if ((volume_level < 150)); then
			pactl set-sink-volume 0 +5%
		fi
	elif [[ $ar1 = "down" ]]; then
		pactl set-sink-volume 0 -5%
	elif [[ $ar1 = "mute" ]]; then
		pactl set-sink-mute 0 toggle
	fi
	"/home/john/.scripts/dwm/update_volume.sh"
}

set_audio_level $1
