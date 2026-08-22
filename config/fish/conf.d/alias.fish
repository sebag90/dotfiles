if command -q lsd
    alias ls="lsd"
end

if command -q bat
    alias cat="bat"
end
if set -q TOOLBOX_PATH
    alias podman="flatpak-spawn --host podman"
end
