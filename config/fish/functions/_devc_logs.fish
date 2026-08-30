function _devc_logs
    set -l name (_devc_name)

    if not podman container exists $name
        echo "devc: no persistent container" >&2
        return 1
    end

    podman logs -f $name
end
