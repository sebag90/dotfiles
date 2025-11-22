function box_name
    if test -f ~/.box-name
        cat ~/.box-name
    else
        echo $hostname
    end
end

function prompt_char
    if test (id -u) -eq 0
        echo "#"
    else
        echo "\$"
    end
end

function virtualenv_prompt_info
    if set -q VIRTUAL_ENV
        set name (basename $VIRTUAL_ENV)
        echo -n (set_color red)"($name)"(set_color normal)" "
    end
end

function git_info
    set branch (git rev-parse --abbrev-ref HEAD ^/dev/null 2>/dev/null)
    or return

    if not git diff --quiet --ignore-submodules --cached; or not git diff --quiet --ignore-submodules
        set state " ✗"
        set color_state (set_color red)
    else
        set state " ✔︎"
        set color_state (set_color green)
    end

    echo -n " "(set_color white)"on "(set_color cyan)"git:"(set_color magenta)"$branch"$color_state"$state"(set_color normal)
end

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_prompt
    set venv (virtualenv_prompt_info)
    set user (set_color cyan)$USER(set_color normal)
    set machine (set_color green)(box_name)(set_color normal)
    set dir (set_color yellow --bold)"["(prompt_pwd)"]"(set_color normal)
    set git (git_info)

    echo -n "$venv$user"(set_color white)"@"(set_color normal)"$machine $dir$git"
    echo -n (set_color magenta --bold) (prompt_char)(set_color normal)" "
end
