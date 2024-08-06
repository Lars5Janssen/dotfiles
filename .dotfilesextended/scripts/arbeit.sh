#! /bin/bash
ndnd
sleep 2

WIFISSID="$(iwctl station wlan0 show | grep "Connected network" | awk '{ print $3 }')"

if [[ "$WIFISSID" != "Science-Hotspot" ]]; then
    echo "Not at work"
    exit
fi

echo "At work; Executing work routine"

hyprctl dispatch workspace 10
hyprctl dispatch exec /opt/cisco/secureclient/bin/vpnui
sleep 1
hyprctl dispatch focuswindow title:privat.kdbx
sleep 12
hyprctl dispatch workspace 1
hyprctl dispatch workspace 2
sleep 2
hyprctl dispatch exec "flatpak run org.mozilla.Thunderbird"
xdg-open ~/Documents/desyZeit/Untitled\ spreadsheet.ods
