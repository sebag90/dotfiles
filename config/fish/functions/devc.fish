function devc
    if command -q toolbox
        set -x SHELL /nix/profile/bin/fish
        toolbox enter devbox
        return
    end

    for candidate in podman docker
        if command -q $candidate
            $candidate run -it -v (pwd):/workspace:Z ghcr.io/sebag90/devenv:latest
            return
        end
    end

    echo "Toolbox, podman or docker is not available"
    return 1
end
