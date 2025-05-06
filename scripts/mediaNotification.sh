#! /bin/bash
# Displays Album and Title as a Notification
source ~/scripts/abstractions/send-user-notification.sh

ALBUM="$(playerctl metadata | grep album | head --lines 1 | awk '{$1=$2="";print $0}')"
TITLE="$(playerctl metadata | grep title | awk '{$1=$2="";print $0}')"
send-notification "$ALBUM" "$TITLE"
