function copy --description "Copy stdin to clipboard"
    if test "$hostname" = mac
        pbcopy
    else
        wl-copy
    end
end
