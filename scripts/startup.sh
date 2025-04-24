#! /bin/bash
# A script that activates when the computer is connected to the wifi of my workplace
# it then executes my "morning work routine" whatever that my be

send-notification ()
{
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "$1" "$2" $3 $4 
}
switch-workspace ()
{
    hyprctl dispatch workspace $1
}

# WIFISSID="$(iwctl station wlan0 show | grep "Connected network" | awk '{ print $3 }')"
WIFISSID="$(nmcli device show | grep "GENERAL.CONNECTION" | awk '{ print $2}' | head --lines=1)"

ndnd
sleep 2
switch-workspace 9
hyprctl dispatch exec signal-desktop
sleep 5
./firstWorkspaces.sh

if [[ "$WIFISSID" != "Science-Hotspot" ]]; then
    echo "Not at work"
    send-notification "Not at Work"
    exit
fi

echo "At work; Executing work routine"
send-notification "At Work" "Executing work routine"

sleep 2

hyprctl dispatch closewindow "title:KDE Connect"
switch-workspace 10
nmcli connection up "DESY VPN" & sleep 0.5 && hyprctl dispatch focuswindow "initialtitle:privat.kdbx \[Locked\] - KeePassXC"

switch-workspace 2
switch-workspace 1
switch-workspace 10

# switch-workspace 1
