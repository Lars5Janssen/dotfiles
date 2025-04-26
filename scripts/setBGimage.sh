#! /bin/bash

NXTCLD_BG_DIR="/home/l/Nextcloud/Pictures/backgrounds/"
FALLBACK="~/Pictures/irithyll.jpg"

SWWW_ARGS="--transition-type=wipe --transition-angle=45"
change-bg ()
{
    hyprctl --instance 0 "dispatch exec swww img \"$1\" --transition-type=wipe --transition-angle=45 --transition-bezier=0,0.5,1,0.5 --transition-fps=60 --transition-duration=7 --transition-step=1"
}

if ! pidof swww-daemon
then
    hyprctl --instance 0 "dispatch exec swww-daemon"
fi

if [ -d "$NXTCLD_BG_DIR" ]; then
    BG_IMG="$(ls "$NXTCLD_BG_DIR" | sort -R | tail --lines=1)"
    change-bg "$NXTCLD_BG_DIR$BG_IMG"
else
    change-bg $FALLBACK
fi
