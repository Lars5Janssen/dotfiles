#! /bin/bash
brightnessctl set $1
currentBrightness="$(brightnessctl get)"
if [ $currentBrightness = '0' ]; then
    brightnessctl set 1
fi
