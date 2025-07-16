#! /bin/bash
# A script that activates when the computer is connected to the wifi of my workplace
# it then executes my "morning work routine" whatever that my be

source ~/scripts/abstractions/send-user-notification.sh
source ~/scripts/abstractions/wm.sh
source ~/scripts/abstractions/check_git.sh

switch-workspace 10
switch-workspace 2
switch-workspace 1
switch-workspace 10
switch-workspace 2
switch-workspace 1

if [[ "$HOST" == "archlaptop" ]]; then
elif [[ "$HOST" == "archPC" ]]; then
else
fi
sleep 15
send-notification "now"
hyprctl dispatch moveworkspacetomonitor 7 +1
hyprctl dispatch moveworkspacetomonitor 9 +1
hyprctl dispatch moveworkspacetomonitor 10 +1
switch-workspace 2
switch-workspace 1

# WIFISSID="$(nmcli device show | grep "GENERAL.CONNECTION" | awk '{ print $2}' | head --lines=1)"
#
# if [[ "$WIFISSID" != "Science-Hotspot" ]]; then
#     exit
# fi
#
# echo "At work; Executing work routine"
# send-notification "At Work" "Executing work routine"
#
# sleep 2
#
# hyprctl dispatch closewindow "title:KDE Connect"
# switch-workspace 10
# nmcli connection up "DESY VPN" & sleep 0.5 && hyprctl dispatch focuswindow "initialtitle:privat.kdbx \[Locked\] - KeePassXC"
#
# switch-workspace 2
# switch-workspace 1
# switch-workspace 10
