#! /bin/bash
ALBUM="$(playerctl metadata | grep album | head --lines 1 | awk '{$1=$2="";print $0}')"
TITLE="$(playerctl metadata | grep title | awk '{$1=$2="";print $0}')"
notify-send "$ALBUM" "$TITLE"
