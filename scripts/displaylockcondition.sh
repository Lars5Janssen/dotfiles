#!/bin/bash

EDP="$(hyprctl monitors | grep eDP -c)"

if [[ "$EDP" == 1 && "$MONITORCOUNT" != "1" ]]; then
    hyprctl keyword monitor "desc:Chimei Innolux Corporation 0x14E7,disable"
    exit
fi

systemctl suspend
