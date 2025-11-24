# go
set -U fish_user_paths $HOME/go/bin $fish_user_paths

# npm
set -U fish_user_paths $HOME/.cache/npm/global/bin $fish_user_paths

# rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# nix
set -U fish_user_paths /etc/profiles/per-user/sebastiano/bin $fish_user_paths
set -U fish_user_paths /run/current-system/sw/bin $fish_user_paths
set -U fish_user_paths /nix/var/nix/profiles/default/bin $fish_user_paths
