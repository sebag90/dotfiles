function _devc_image
    set -l image $argv[1]
    test -z "$image" && set image ghcr.io/sebag90/devenv:latest
    echo $image
end
