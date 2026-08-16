function devc
    podman run -it --rm --userns=keep-id --user $(id -u):$(id -g) -v $(pwd):/workspace:Z -w /workspace -v $XDG_RUNTIME_DIR/podman/podman.sock:/run/podman/podman.sock -e CONTAINER_HOST=unix:///run/podman/podman.sock --security-opt label=disable ghcr.io/sebag90/devenv:latest
    return
end
