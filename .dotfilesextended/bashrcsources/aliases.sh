alias sudo='sudo '
# ls alias
alias l='ls --color -l'
alias la='l -A'
alias lt='tree'

# system controll
alias lock='loginctl lock-session'
alias sus='systemctl suspend'
alias off='shutdown 0'

# package managers
alias pacman='~/.dotfilesextended/scripts/pacnanny/pacnanny'
alias pm='pacman'
# starting wm & de
alias h='Hyprland'
alias hypr='Hyprland'

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

# edits for conf files
alias editb='nvim ~/.bashrc'
alias edita='nvim ~/.dotfilesextended/bashrcsources/aliases.sh && realias'
alias edits='nvim ~/.config/starship.toml'
alias editi3='nvim ~/.config/i3/config'
alias edital='nvim ~/.config/alacritty/alacritty.toml'
alias edith='nvim ~/.config/hypr/hyprland.conf'

# ranger gotos
alias gotodotfiles='ranger ~/dotfiles/'
alias gotodotconfig='ranger ~/dotfiles/.config/'

# reload waybar
alias reloadwaybar='killall waybar && waybar --config ~/.config/waybar/config'

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
