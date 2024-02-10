alias l='ls --color -l'
alias la='l -A'

alias reStow='stow ~/dotfiles/.'

alias nf='neofetch'

alias bashrc='nano /home/lars/.bashrc'

alias gay='lolcat'

alias setBtAudio="pactl set-default-sink $(pactl list short sinks | tail -n1 | cut -d'b' -f1)"
