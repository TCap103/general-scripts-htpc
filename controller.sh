#!/bin/bash
# ABANDONED THIS APPROACH IN FAVOR OF USING SEPARATE CONFIGS
# FOR EACH APPLICATION
wmctrl -l | grep -v 'N/A' | while read PROGRAM; do
    PROGRAM="$(echo $PROGRAM | sed -e "s/\s\+/ /g")"
    WINDOWID="$(echo $PROGRAM | cut -d " " -f 1)"
    if [ ! -z "$(xprop -id $WINDOWID _NET_WM_STATE | grep FOCUSED)" ]; then
        PROGRAMNAME="$(echo $PROGRAM | cut -d " " -f 4-)"
        break
    fi
done

CUSTOMCONF=(firefox)
for PROGRAM in ${CUSTOMCONF[@]}; do
    if [ "$(echo $PROGRAMNAME | grep)" ]; then
        
    else
        echo "ERROR: no config" 
    fi
done
