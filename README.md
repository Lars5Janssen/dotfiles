# Dotfiles Repo
This is a dotfiles repo. It is intended to be cloned into ~ (as for example ~/dotfiles/\<contents of repo>) and then be used with GNU Stow.

## ~/bashrcsources/
To better manage the .bashrc, it has been split up into multiple.
Every file in ~/bashrcsources/ will be sources.

# Everything this dotfiles repo contains:
- .bashrc
- .fonts
- .env & env.sh for managing env vars
- i3 config
- ranger config
- alacritty config
- starship config
- nvim config with packer.nvim 
- polybar config and launchscript

# TODO
- [ ] polybar launchscript needs chmod +x, this will not be auto replicated on a new system
- [ ] Do fonts work on new Computer?
