function _devc_mounts
    for d in .pi/agent .aws .gitconfig .ssh .netrc
        set -l source "$HOME/$d"

        if test -e "$source"
            printf '%s\n' \
                -v \
                "$source:/home/dev/$d:Z"
        end
    end

    if test -n "$XDG_RUNTIME_DIR"
        and test -n "$WAYLAND_DISPLAY"
        and test -S "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY"

        printf '%s\n' \
            -v \
            "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/wayland-0" \
            -e \
            "WAYLAND_DISPLAY=/tmp/wayland-0"
    end
end
