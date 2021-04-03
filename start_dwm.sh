# relaunch DWM if the binary changes, otherwise bail
# stops x from being killed just relaunch
while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done

