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

exec-programm signal-desktop
exec-programm steam
exec-programm "flatpak run com.discordapp.Discord"
hyprctl dispatch focuswindow class:proton-bridge
hyprctl dispatch killactive

sleep 15
hyprctl dispatch moveworkspacetomonitor 7 +1
hyprctl dispatch moveworkspacetomonitor 9 +1
hyprctl dispatch moveworkspacetomonitor 10 +1
switch-workspace 2
switch-workspace 1

WIFISSID="$(nmcli device show | grep "GENERAL.CONNECTION" | awk '{ print $2}' | head --lines=1)"

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
