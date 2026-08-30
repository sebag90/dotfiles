function _devc_name
    # The absolute working directory is the identity of a persistent devc.
    #
    # We hash it rather than putting the directory directly into the
    # container name, since paths can contain characters that are awkward
    # in container names.
    set -l dir (realpath (pwd))
    set -l hash (printf '%s' "$dir" | sha256sum | cut -c1-12)

    echo "devc-$hash"
end
