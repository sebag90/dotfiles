function ssh --wraps ssh
    printf '\e]11;#26233a\e\\' # subtle remote tint (rose-pine surface)
    printf '\e]0;ssh: %s\e\\' (string join ' ' $argv) # best-effort title, remote usually overwrites
    command ssh $argv
    printf '\e]111\e\\' # back to [colors-dark] background
    printf '\e]0;foot\e\\' # back to default title
end
