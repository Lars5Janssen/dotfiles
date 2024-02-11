# ls alias
alias l='ls --color -l'
alias la='l -A'

# ~/dotfiles/ related aliases
alias todotdir='cd ~/dotfiles'
alias reStow='todotdir && stow -R . && cd -'
alias dotpush='todotdir && git status && git commit -a && git push && cd -'
alias dotstatus='todotdir && git status && cd -'
alias dotaddall='todotdir && git add . && cd -'
alias realias='source ~/bashrcsources/aliases.sh'

# edits for .bashrc files
alias editb='nvim ~/.bashrc'
alias edita='nvim ~/bashrcsources/aliases.sh'

# audio
alias setBtAudio="pactl set-default-sink \$(pactl list short sinks | tail -n1 | cut -d'b' -f1)"

# display
alias setlaporientation='xrandr --output DP-2 --left-of eDP-1'
# uncategorized aliases
alias n='nvim'
alias r='ranger'

alias gay='lolcat'

alias nf='neofetch'
