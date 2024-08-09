#! /bin/bash
# A script that searches through your home and lets you find files
find ~ -type f 2>/dev/null | fzf | xargs hyprctl dispatch exec xdg-open --
