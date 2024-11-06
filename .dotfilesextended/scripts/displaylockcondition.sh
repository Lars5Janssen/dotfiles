#!/bin/bash
MONITORCOUNT="$(hyprctl monitors | grep Monitor -c)"

if [[ "$MONITORCOUNT" == "1" ]]; then
    hyprlock & sleep 2 && systemctl suspend
fi


if [[ "$MONITORCOUNT" != "1" ]]; then
    hyprctl keyword monitor "desc:Chimei Innolux Corporation 0x14E7,disable"
fi
