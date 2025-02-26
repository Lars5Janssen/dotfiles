#! /bin/bash
# A script that flashes the screen and keyboard backlight like a strobelight
while [[ true ]]; do

    keyboardBacklightDevice='intel_backlight'

    currentBrightness="$(brightnessctl --device $keyboardBacklightDevice get)"
    if [  $currentBrightness = '0' ]; then
        brightnessctl --quiet --device $keyboardBacklightDevice set 100%
    else
        brightnessctl --quiet --device $keyboardBacklightDevice set 0
    fi
   ./toggleKbBacklight.sh
done
