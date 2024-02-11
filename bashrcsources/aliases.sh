# ls alias
alias l='ls --color -l'
alias la='l -A'

# ~/dotfiles/ related aliases
alias reStow='cd ~/dotfiles && stow -R . && cd -'
alias dotpush='cd ~/dotfiles && git status && git commit -a && git push && cd -'

alias nf='neofetch'

# edits for .bashrc files
alias editbashrc='nvim ~/.bashrc'
alias editalias='nvim ~/bashrcsources/aliases.sh'

alias gay='lolcat'

alias setBtAudio="pactl set-default-sink $(pactl list short sinks | tail -n1 | cut -d'b' -f1)"

alias realias='source ~/bashrcsources/aliases.sh'
