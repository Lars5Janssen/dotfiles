#!/bin/bash

EDPACTIVE="$(hyprctl monitors | grep eDP -c)"
HASEDP="$(hyprctl monitors all | grep eDP -c)"
MONITORCOUNT="$(hyprctl monitors | grep Monitor -c)"
SWITCHSTATE="$(cat /proc/acpi/button/lid/LID0/state | awk '{ print $2 }')"

if [[ "$HASEDP" == 1 && "$MONITORCOUNT" != "1" && "$SWITCHSTATE" == "closed" ]]; then
    hyprctl keyword monitor "desc:Chimei Innolux Corporation 0x14E7,disable"
    exit
fi

systemctl suspend
