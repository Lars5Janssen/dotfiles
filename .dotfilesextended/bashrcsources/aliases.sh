alias sudo='sudo '
alias openFileWithNvim='~/.dotfilesextended/scripts/opennvim/openrightdir.sh'
alias openDirWithNvim='~/.dotfilesextended/scripts/opennvim/opendir.sh'

# ls alias
alias l='ls --color -lA'
alias la='l -Al'
alias lt='tree'

# system controll
alias srb='systemctl soft-reboot'
alias lock='loginctl lock-session'
alias sus='systemctl suspend'
alias off='shutdown 0'

# package managers
alias pacman='~/.dotfilesextended/scripts/pacnanny/pacnanny'
alias pm='pacman'

# starting wm & de
alias h='Hyprland'
alias hypr='Hyprland'
alias sw='swww kill && swww init && swww img ~/Pictures/irithyll.png'

# git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gcp='git commit && git push'
alias gcap='git commit -a && git push'
alias gaacp='git add . && git commit -a && git push'

# ~/dotfiles/ related aliases
alias todotdir='cd ~/dotfiles'
alias restow='todotdir && stow -R . && cd -'
alias dotpush='todotdir && git status && git commit -a && git push && cd -'
alias dotstatus='todotdir && git status && cd -'
alias dotaddall='todotdir && git add . && cd -'
alias realias='source ~/.dotfilesextended/bashrcsources/aliases.sh'
alias updatedotfiles='cd ~/dotfiles && stow -D . && git pull && stow . && cd -'

# Rename pic
alias moveFromePhone='mv /run/user/1000/gvfs/mtp\:host\=Google_Pixel_6_1B131FDF6009GQ/Internal\ shared\ storage/Download/* ~/Projects/rndrename/source/ | pv -lep -s $(ls -1 /run/user/1000/gvfs/mtp\:host\=Google_Pixel_6_1B131FDF6009GQ/Internal\ shared\ storage/Download/ | wc -l) > /dev/null'
alias moveToPhone='mv ~/Projects/rndrename/source/* /run/user/1000/gvfs/mtp\:host\=Google_Pixel_6_1B131FDF6009GQ/Internal\ shared\ storage/Download/ | pv -lep -s $(ls -1 ~/Projects/rndrename/source/ | wc -l) > /dev/null'

alias useRNDRENAME='./rndRename.sh source/ && ./rndRename.sh source/ && ./rndRename.sh source/'
alias randomRename='cd ~/Projects/rndrename/ && fdupes -dN ./source/ && useRNDRENAME && useRNDRENAME && cd -'

alias rndRenamePicsFromPhone='moveFromePhone && randomRename && moveToPhone'

# edits for conf files
alias editbr='openDirWithNvim ~/.dotfilesextended/bashrcsources/'
alias editn='openDirWithNvim ~/.config/nvim/'

alias edita='openFileWithNvim ~/.dotfilesextended/bashrcsources/aliases.sh && realias'
alias edits='openFileWithNvim ~/.config/starship.toml'
alias edital='openFileWithNvim ~/.config/alacritty/alacritty.toml'
alias edith='openFileWithNvim ~/.config/hypr/hyprland.conf'

# ranger gotos
alias gotodotfiles='ranger ~/dotfiles/'
alias gotodotconfig='ranger ~/dotfiles/.config/'

# reload waybar
alias reloadwaybar='~/.config/waybar/reloadWaybar.sh'

# audio
alias setBtAudio="pactl set-default-sink \$(pactl list short sinks | tail -n1 | cut -d'b' -f1)"
alias listsinks='pactl list short sinks'
alias setdefsink='pactl set-default-sink'

# display
alias setlaporientation='xrandr --output DP-2 --left-of eDP-1'

# Wifi
alias wificon='nmtui-connect'
alias obwifi='nmtui-connect Osterberg'

# uncategorized aliases
alias n='nvim'
alias r='ranger'

alias checkbat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias gay='lolcat'

alias nf='neofetch'
