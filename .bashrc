for FILE in ~/.dotfilesextended/bashrcsources/*; do
	source $FILE
done

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/lars/Programms/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/lars/Programms/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/lars/Programms/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/lars/Programms/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#. "$HOME/.cargo/env"
#
## Generated for envman. Do not edit.
#[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
