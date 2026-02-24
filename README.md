personal dotfiles for nix

# Helix editor
Additional language servers [here](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations)


# Post Install

## Gnome
### Extensions:
* https://extensions.gnome.org/extension/2639/hide-minimized/
* https://github.com/ubuntu/gnome-shell-extension-appindicator

### Settings
* additional fractal scaling: `$ gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"`

### Fonts
Download [CaskaydiaCove Nerd Font](https://www.nerdfonts.com/font-downloads) and unzip to `~/.local/share/fonts` and run `fc-cache ~/.local/share/fonts`

## FISH
* add fish to the shells: `command -v fish | sudo tee -a /etc/shells`
* set zsh as default shell: `chsh -s $(which fish)`

Alternative: if chsh does not work: `sudo lchsh $(whoami)`

# using stow
run: `stow --no-folding -t $HOME/.config/ config` to create system links to config files
