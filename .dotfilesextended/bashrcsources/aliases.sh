alias sudo='sudo '
alias openFileWithNvim='~/.dotfilesextended/scripts/opennvim/openrightdir.sh'
alias openDirWithNvim='~/.dotfilesextended/scripts/opennvim/opendir.sh'
alias o='xdg-open'

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
alias rmvOrphans='pacman -Qdtq | sudo pacman -Rns -'
alias browsePackages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)"

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
alias moveAndRename='android-file-transfer && randomRename && android-file-transfer'
alias useRNDRENAME='./rndRename.sh source/ && ./rndRename.sh source/ && ./rndRename.sh source/'
alias randomRename='cd ~/Projects/rndrename/ && fdupes -dN ./source/ && useRNDRENAME && useRNDRENAME && cd -'

# edits for conf files
alias editbr='openDirWithNvim ~/.dotfilesextended/bashrcsources/'
alias editn='openDirWithNvim ~/.config/nvim/'

alias editaa='openFileWithNvim ~/.dotfilesextended/bashrcsources/aliases.sh && realias'
alias editss='openFileWithNvim ~/.config/starship.toml'
alias editac='openFileWithNvim ~/.config/alacritty/alacritty.toml'
alias edithl='openFileWithNvim ~/.config/hypr/hyprland.conf'
alias editwb='openFileWithNvim ~/.config/waybar/config.jsonc && reloadwaybar'
alias edittf='n ~/.config/tofi/config'

# ranger gotos
alias gotodotfiles='ranger ~/dotfiles/'
alias gotodotconfig='ranger ~/dotfiles/.config/'

# brightnessctl
alias kbBacklightToggle='~/.dotfilesextended/scripts/toggleKbBacklight.sh'
alias displayBrightness='brightnessctl set'
alias bctl='brightnessctl'

# reload waybar
alias reloadwaybar='~/.config/waybar/reloadWaybar.sh'

# audio
alias setBtAudio="pactl set-default-sink \$(pactl list short sinks | tail -n1 | cut -d'b' -f1)"
alias listsinks='pactl list short sinks'
alias setdefsink='pactl set-default-sink'

# Wifi
alias wificon='nmtui-connect'
alias obwifi='nmtui-connect Osterberg'

# uncategorized aliases
alias n='nvim'
alias r='ranger'

alias checkbat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias gay='lolcat'

alias nf='neofetch'
