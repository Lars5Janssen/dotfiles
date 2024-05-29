#! /bin/bash
find ~ -type f 2>/dev/null | fzf | xargs hyprctl dispatch exec xdg-open --
