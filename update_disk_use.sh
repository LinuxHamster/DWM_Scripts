function disk_use_update {
	root_use="$(df -h /dev/sda1 | grep -oP "\d+(?=%)%")"
	home_use="$(df -h /dev/sda2 | grep -oP "\d+(?=%)%")"
	disk_use_string="$(echo -e :$root_use :$home_use )"
	echo $disk_use_string | tee ~/.scripts/dwm/savedata/disk_use_string.txt
	"/home/john/.scripts/dwm/update_all.sh"
}

disk_use_update
