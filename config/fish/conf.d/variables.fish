set -x EDITOR hx
set -x VISUAL hx
set -x PIP_REQUIRE_VIRTUALENV true

# set docker host to podman sock if it exists
if test -S "$XDG_RUNTIME_DIR/podman/podman.sock"
    set -x DOCKER_HOST unix://$XDG_RUNTIME_DIR/podman/podman.sock
end
