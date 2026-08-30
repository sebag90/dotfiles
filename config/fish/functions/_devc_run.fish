function _devc_run
    set -l image (_devc_image $argv[1])
    set -l mounts (_devc_mounts)
    set -l common (_devc_common_args)

    podman run -it --rm \
        $common \
        $mounts \
        $image
end
