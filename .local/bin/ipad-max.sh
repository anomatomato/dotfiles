#!/bin/bash
# Standalone script for keyboard shortcut

ipad_info=$(xdpyinfo -ext XINERAMA 2>/dev/null | grep "head #1" | grep -oP '\d+x\d+ @ \d+,\d+')

if [[ -z "$ipad_info" ]]; then
    notify-send "iPad display not found"
    exit 1
fi

width=$(echo "$ipad_info" | grep -oP '^\d+')
height=$(echo "$ipad_info" | grep -oP 'x\K\d+')
x_offset=$(echo "$ipad_info" | grep -oP '@ \K\d+')
y_offset=$(echo "$ipad_info" | grep -oP ',\K\d+$')

wmctrl -r : ACTIVE: -b remove,maximized_vert,maximized_horz
xdotool getactivewindow windowmove "$x_offset" "$y_offset"
xdotool getactivewindow windowsize "$width" "$height"

notify-send "Window moved to iPad" "${width}x${height}"