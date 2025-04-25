#! /bin/bash

NXTCLD_BG_DIR="/home/l/Nextcloud/Pictures/backgrounds/"
FALLBACK="~/Pictures/irithyll.jpg"

if ! pidof swww-daemon
then
    swww init
fi

if [ -d "$NXTCLD_BG_DIR" ]; then
    BG_IMG="$(ls "$NXTCLD_BG_DIR" | sort -R | tail --lines=1)"
    swww img "$NXTCLD_BG_DIR$BG_IMG"
else
    swww img $FALLBACK
fi
