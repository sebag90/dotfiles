function _devc_up
    set -l image (_devc_image $argv[1])
    set -l name (_devc_name)
    set -l dir (pwd)
    set -l mounts (_devc_mounts)
    set -l common (_devc_common_args)

    # Does a container already exist for this directory?
    if podman container exists $name
        set -l running (podman inspect -f '{{.State.Running}}' $name 2>/dev/null)

        if test "$running" = true
            echo "devc: container already running"
            echo "devc: $name"
            echo "devc: $dir"
            return 1
        end

        # Existing stopped containers may have been created with an
        # older image/command/configuration. Recreate them.
        echo "devc: removing stopped container $name"
        podman rm $name
        or return $status
    end

    echo "devc: starting $name"
    echo "devc: $dir"

    podman run -d \
        --name $name \
        --label "devc.dir=$dir" \
        --label "devc.image=$image" \
        --entrypoint=tail \
        $common \
        $mounts \
        $image \
        -f /dev/null

    if test $status -eq 0
        echo
        echo "devc: container started"
        echo "devc: use 'devc ssh' to enter it"
    end
end
