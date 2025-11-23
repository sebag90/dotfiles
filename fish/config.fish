if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR hx
set -x VISUAL hx
set -x PIP_REQUIRE_VIRTUALENV=true

alias ls="eza"
alias cat="bat"

set -U fish_user_paths $HOME/go/bin $fish_user_paths
set -U fish_user_paths $HOME/.cache/npm/global/bin $fish_user_paths

fish_config theme choose rose-pine
