#!/bin/bash
ttyNumber="$(tty)"
if [ $ttyNumber = "/dev/tty1" ]; then
    hyprland && kill -9 -1
fi
