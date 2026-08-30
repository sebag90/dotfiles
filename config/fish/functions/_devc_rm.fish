function _devc_rm
    set -l name (_devc_name)
    set -l dir (pwd)

    if not podman container exists $name
        echo "devc: no persistent container for $dir" >&2
        return 1
    end

    echo "devc: removing $name"
    podman rm -f $name
end
