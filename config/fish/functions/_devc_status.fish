function _devc_status
    set -l name (_devc_name)
    set -l dir (pwd)

    if not podman container exists $name
        echo "devc: no persistent container"
        echo "devc: $dir"
        return 0
    end

    podman inspect \
        --format 'name={{.Name}}
status={{.State.Status}}
image={{.Config.Image}}
directory={{index .Config.Labels "devc.dir"}}' \
        $name
end
