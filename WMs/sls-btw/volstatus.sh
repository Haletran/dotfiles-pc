#!/bin/sh

vol_info=$(amixer sget Master | awk -F'[][]' '/Left:/ { print $2, $4; exit }')
vol=$(echo "$vol_info" | awk '{print $1}' | tr -d '%')
mute=$(echo "$vol_info" | awk '{print $2}')

if [ "$mute" = "off" ]; then
    icon=""  # Nerd Font mute icon (or 🔇)
else
    if [ "$vol" -ge 70 ]; then
        icon=""  # Loud
    elif [ "$vol" -ge 30 ]; then
        icon=""  # Medium
    elif [ "$vol" -gt 0 ]; then
        icon=""  # Low
    else
        icon=""  # Zero but unmuted
    fi
fi

echo "$icon $vol%"

