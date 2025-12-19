# Steps

## Activate flake and nix command
Add the following line to `/etc/nix/nix.conf`
```
experimental-features = nix-command flakes
```

## Generic install

`nix run .#homeConfigurations.generic.activationPackage`


## NIX secret file
inside the directory of the host, create a `secrets.nix` (`dotfiles/nix/hosts/nixos/secrets.nix`):
```
{
  userEmail = "myemail@secrets.com";
}
```

and make sure to add the variable `DOTFILES_SECRETS` to your zsh config (`nixos/hosts/nixos/modules/zsh.nix`):
```
sessionVariables = {
  ZSH_CUSTOM = "${config.home.homeDirectory}/.config/zsh";
  NIX_BUILD_EXEC = "nixos-rebuild";
  DOTFILES_SECRETS = "${config.home.homeDirectory}/code/dotfiles/nixos/hosts/nixos/secrets.nix";
};
```

# Post Install

## Gnome Extensions:
* https://extensions.gnome.org/extension/2639/hide-minimized/
* https://github.com/ubuntu/gnome-shell-extension-appindicator

## ZSH
* add zsh to the shells: `command -v zsh | sudo tee -a /etc/shells`
* set zsh as default shell: `chsh -s $(which zsh)`

## Podman
On non nixos machines:
* Checked the status of podman-restart.service: `$ systemctl status podman-restart.service`
* Enable service: `$ systemctl enable podman-restart.service`
* Enable for rootless: `$ systemctl --user enable podman-restart.service`
* Enable lingering `$ sudo loginctl enable-linger $USER`

On nixos:
```
systemctl --user enable podman-restart.service
loginctl enable-linger $USER
```
