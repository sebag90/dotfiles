function devc
    if set -q DEVENV
        echo "devc: already inside devenv" >&2
        return 1
    end
    set -l image $argv[1]
    test -z "$image" && set image ghcr.io/sebag90/devenv:latest
    set -l mounts
    for d in .pi/agent .aws .gitconfig .ssh .netrc
        test -e ~/$d && set -a mounts -v ~/$d:/home/dev/$d:Z
    end
    test -S "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY" && set -a mounts -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/wayland-0 -e WAYLAND_DISPLAY=/tmp/wayland-0
    podman run -it --rm \
        --userns=keep-id --user $(id -u):$(id -g) \
        --passwd-entry 'dev:*:$UID:$GID::/home/dev:/nix/profile/bin/fish' \
        -w $(pwd) \
        -v $(pwd):$(pwd):Z \
        -v $XDG_RUNTIME_DIR/podman/podman.sock:/run/podman/podman.sock \
        -e CONTAINER_HOST=unix:///run/podman/podman.sock \
        --network host \
        $mounts \
        --security-opt label=disable \
        $image
end
