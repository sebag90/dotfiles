function _devc_ssh
    set -l name (_devc_name)
    set -l dir (pwd)

    if not podman container exists $name
        echo "devc: no persistent container for $dir" >&2
        echo "devc: run 'devc up' first" >&2
        return 1
    end

    set -l running (podman inspect -f '{{.State.Running}}' $name 2>/dev/null)

    if test "$running" != true
        echo "devc: container is stopped" >&2
        echo "devc: run 'devc up' first" >&2
        return 1
    end

    podman exec -it $name fish
end
