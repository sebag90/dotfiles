alias ls="lsd"
alias cat="bat"
if set -q TOOLBOX_PATH
    alias podman="flatpak-spawn --host podman"
end
