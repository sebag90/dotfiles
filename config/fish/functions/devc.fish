function devc
    if set -q DEVENV
        echo "devc: already inside devenv" >&2
        return 1
    end

    set -l command $argv[1]

    # No arguments, or first argument is an image name:
    # run an ephemeral interactive container.
    if test -z "$command" || string match -q '*/*' -- "$command" || string match -q '*:*' -- "$command"
        _devc_run $argv
        return $status
    end

    switch $command
        case up
            _devc_up $argv[2..-1]
        case ssh
            _devc_ssh
        case down
            _devc_down
        case restart
            _devc_restart
        case status
            _devc_status
        case logs
            _devc_logs
        case rm
            _devc_rm
        case '*'
            echo "Usage:"
            echo "  devc [IMAGE]          Run an ephemeral container"
            echo "  devc up [IMAGE]       Start a persistent container"
            echo "  devc ssh              Enter the persistent container"
            echo "  devc down             Stop the persistent container"
            echo "  devc restart          Restart the persistent container"
            echo "  devc status           Show persistent container status"
            echo "  devc logs             Show persistent container logs"
            echo "  devc rm                Remove the persistent container"
            return 1
    end
end
