#!/bin/bash
ttyNumber="$(tty)"
if [ $ttyNumber = "/dev/tty1" ]; then
    hyprland
elif
 [ $ttyNumber = "/dev/tty2" ]; then
    gnome-shell --wayland
fi
