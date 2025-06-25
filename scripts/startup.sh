#! /bin/bash
sleep 3

source ~/scripts/abstractions/wm.sh
source ~/scripts/abstractions/send-user-notification.sh
source ~/scripts/abstractions/check_git.sh

ndnd

exec-programm blueman-applet
exec-programm fnott
exec-programm kdeconnect-app
exec-programm "keepassxc ~/KPXCDB/privat.kdbx"
exec-programm nextcloud
exec-programm nm-applet
exec-programm protonmail-bridge
exec-programm "flatpak run org.mozilla.Thunderbird"
exec-programm steam
exec-programm signal-desktop
exec-programm "flatpak run com.discordapp.Discord"
./setVol.sh sink default

rm /home/lars/.var/app/com.jetbrains.IntelliJ-IDEA-Ultimate/config/JetBrains/IntelliJIdea2024.1/.lock

sleep 5
checkgitrepo "/home/l/dotfiles/"
sleep 1
checkgitrepo "/home/l/Projects/private/ansible/"
