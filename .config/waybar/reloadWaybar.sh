#! /bin/bash
killall waybar
sleep 1
waybar --config ~/.config/waybar/config.jsonc &
