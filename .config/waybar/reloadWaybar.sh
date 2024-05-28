#! /bin/bash
killall waybar
sleep 0.2
waybar --config ~/.config/waybar/config.jsonc &
