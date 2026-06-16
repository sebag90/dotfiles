fish_add_path -m /usr/bin
# go
fish_add_path -a $HOME/go/bin

# npm
fish_add_path -a $HOME/.cache/npm/global/bin

# rust
fish_add_path -a $HOME/.cargo/bin
fish_add_path -a $HOME/.local/bin

# nix
fish_add_path /run/wrappers/bin
fish_add_path /etc/profiles/per-user/$USER/bin
fish_add_path /run/current-system/sw/bin
fish_add_path /nix/var/nix/profiles/default/bin
fish_add_path -a /nix/profile/bin
fish_add_path -a $HOME/.nix-profile/bin
