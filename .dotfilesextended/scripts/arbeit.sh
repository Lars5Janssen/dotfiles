#! /bin/bash
# A script that activates when the computer is connected to the wifi of my workplace
# it then executes my "morning work routine" whatever that my be

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
sleep 2
hyprctl dispatch focuswindow title:privat.kdbx
sleep 12

hyprctl dispatch workspace 2
hyprctl dispatch workspace 1
hyprctl dispatch workspace 10
hyprctl dispatch workspace 2
sleep 2

hyprctl dispatch exec "flatpak run org.mozilla.Thunderbird"
hyprctl dispatch exec "xdg-open ~/Nextcloud/Documents/Arbeit/DESY/Arbeitszeiterfassung.ods"
sleep 2
hyprctl dispatch workspace 1
hyprctl dispatch exec /usr/bin/intellij-idea-ultimate-edition
