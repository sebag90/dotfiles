function _devc_down
    set -l name (_devc_name)
    set -l dir (pwd)

    if not podman container exists $name
        echo "devc: no persistent container for $dir" >&2
        return 1
    end

    set -l running (podman inspect -f '{{.State.Running}}' $name 2>/dev/null)

    if test "$running" != true
        echo "devc: container already stopped"
        return 0
    end

    echo "devc: stopping $name"
    podman stop $name
end
