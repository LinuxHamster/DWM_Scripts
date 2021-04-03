function cpu_update {
	#get the latest cpu usage stats
	cpu_use="$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \
<(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))"
	echo CPU:$cpu_use | tee ~/.scripts/dwm/savedata/cpu_string.txt
    "/home/john/.scripts/dwm/update_all.sh"
}

cpu_update
