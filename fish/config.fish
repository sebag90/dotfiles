if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set variables
set -x EDITOR hx
set -x VISUAL hx
set -x PIP_REQUIRE_VIRTUALENV true

# alias
alias ls="eza"
alias cat="bat"

# paths for:
# go
set -U fish_user_paths $HOME/go/bin $fish_user_paths
# npm
set -U fish_user_paths $HOME/.cache/npm/global/bin $fish_user_paths
# rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# set theme
fish_config theme choose rose-pine
