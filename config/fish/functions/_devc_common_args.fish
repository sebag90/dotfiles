function _devc_common_args
    set -l dir (pwd)
    set -l uid (id -u)
    set -l gid (id -g)

    printf '%s\n' \
        --userns=keep-id \
        --user "$uid:$gid" \
        --passwd-entry "dev:*:$uid:$gid::/home/dev:/nix/profile/bin/fish" \
        -w "$dir" \
        -v "$dir:$dir:Z" \
        -v "$XDG_RUNTIME_DIR/podman/podman.sock:/run/podman/podman.sock" \
        -e CONTAINER_HOST=unix:///run/podman/podman.sock \
        -e COLORTERM=$COLORTERM \
        --network host \
        --security-opt label=disable
end
