echo
# Zinit
# Set directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
TMUX_TPM_HOME="${HOME}/.tmux/plugins/tpm/"

# Download zinit, if it's not there yet
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d "$ZINIT_HOME"/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
[ ! -d "$TMUX_TPM_HOME"/.git ] && git clone https://github.com/tmux-plugins/tpm "$TMUX_TPM_HOME"

# Source zinit file
source "${ZINIT_HOME}/zinit.zsh"

# Add in base zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::tldr
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Hotkeys
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^o' clear_screen
zle -N clear_screen
    
function clear_screen ()
{
    zle clear-screen
    zle reset-prompt
}

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' 

# Aliases
alias c='clear'
alias ls='ls --color'
alias l='ls -lA --color'
alias editzsh='nvim ~/.zshrc && source ~/.zshrc'
alias edittmux='nvim ~/.config/tmux/tmux.conf && tmux source ~/.config/tmux/tmux.conf'
alias edithl='cd ~/.config/hypr/ && nvim ~/.config/hypr/hyprland.conf && cd -' 
alias resource='source ~/.zshrc'
alias restow='cd ~/dotfiles/ && stow . && cd -'
alias n='nvim'
alias vi='nvim'
alias vim='nvim'
alias t='tmux new-session -A -s main'
alias tls='tmux ls'
alias sus='systemctl suspend'
alias srb='systemctl soft-reboot'
alias h='Hyprland'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/ohmyposh.toml)"
