#!/bin/bash

LOW_BATTERY_LEVEL=12

BATTERY_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

PERCENT=$(echo "$BATTERY_INFO" | grep "percentage" | awk '{print $2}' | sed 's/%//')
STATE=$(echo "$BATTERY_INFO" | grep "state" | awk '{print $2}')

if [ "$PERCENT" -le "$LOW_BATTERY_LEVEL" ] && [ "$STATE" = "discharging" ]; then
    notify-send -u critical "Battery Low" "Battery is at $PERCENT%"
    mpv --no-video --volume=150 --loop=2 "$HOME/Music/sound/quack-reverb.mp3"
fi
