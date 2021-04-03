function date_update {
	date_string="$( date +"%B %-d,%Y|%-I:%M%p") "
	echo $date_string | tee ~/.scripts/dwm/savedata/date_string.txt
	"/home/john/.scripts/dwm/update_all.sh"
}

date_update
