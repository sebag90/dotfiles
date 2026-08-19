function devc
    set -l image $argv[1]
    test -z "$image" && set image ghcr.io/sebag90/devenv:latest
    set -l mounts
    for d in .pi/agent .aws .gitconfig .ssh
        test -e ~/$d && set -a mounts -v ~/$d:/home/dev/$d:Z
    end
    podman run -it --rm \
        --userns=keep-id --user $(id -u):$(id -g) \
        -w /workspace \
        -v $(pwd):/workspace:Z \
        -v $XDG_RUNTIME_DIR/podman/podman.sock:/run/podman/podman.sock \
        -e CONTAINER_HOST=unix:///run/podman/podman.sock \
        --network host \
        $mounts \
        --security-opt label=disable \
        $image
end
