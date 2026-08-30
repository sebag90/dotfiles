function _devc_restart
    set -l name (_devc_name)
    set -l dir (pwd)

    if not podman container exists $name
        echo "devc: no persistent container for $dir" >&2
        echo "devc: run 'devc up' first" >&2
        return 1
    end

    echo "devc: restarting $name"
    podman restart $name
end
