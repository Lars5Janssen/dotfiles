#! /bin/bash
keyboardBacklightDevice='dell::kbd_backlight'

currentBrightness="$(brightnessctl --device $keyboardBacklightDevice get)"
if [  $currentBrightness = '0' ]; then
    brightnessctl --quiet --device $keyboardBacklightDevice set 2
else
    brightnessctl --quiet --device $keyboardBacklightDevice set 0
fi
