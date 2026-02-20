alias ls="eza"
alias cat="bat"
if set -q TOOLBOX_PATH
    alias podman="flatpak-spawn --host podman"
end
