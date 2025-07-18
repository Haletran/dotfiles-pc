#!/bin/sh

bat0_path="/sys/class/power_supply/BAT0"
bat1_path="/sys/class/power_supply/BAT1"

# Check if both exist
if [ ! -d "$bat0_path" ] && [ ! -d "$bat1_path" ]; then
    echo "󰂑 N/A"
    exit 0
fi

# Get individual battery percentages and statuses
get_bat_info() {
    local bat_path="$1"
    if [ -d "$bat_path" ]; then
        cap=$(cat "$bat_path/capacity")
        status=$(cat "$bat_path/status")
    else
        cap=0
        status="Unknown"
    fi
    echo "$cap $status"
}

bat0_info=$(get_bat_info "$bat0_path")
bat1_info=$(get_bat_info "$bat1_path")

bat0_cap=$(echo $bat0_info | awk '{print $1}')
bat0_status=$(echo $bat0_info | awk '{print $2}')
bat1_cap=$(echo $bat1_info | awk '{print $1}')
bat1_status=$(echo $bat1_info | awk '{print $2}')

# Combine capacities (average or sum)
# Here we'll average them
total_cap=$(( (bat0_cap + bat1_cap) / 2 ))

# Determine status — if either is Charging, consider system Charging
if [ "$bat0_status" = "Charging" ] || [ "$bat1_status" = "Charging" ]; then
    icon="󰂄"
elif [ "$total_cap" -ge 90 ]; then
    icon="󰂂"
elif [ "$total_cap" -ge 70 ]; then
    icon="󰂀"
elif [ "$total_cap" -ge 50 ]; then
    icon="󰁾"
elif [ "$total_cap" -ge 30 ]; then
    icon="󰁼"
elif [ "$total_cap" -ge 15 ]; then
    icon="󰁺"
else
    icon="󰂃"
fi

echo "$icon $total_cap%"
