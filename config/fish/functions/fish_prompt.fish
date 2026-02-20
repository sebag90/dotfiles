function in_toolbox
    if set -q TOOLBOX_PATH
        return 0
    end
    return 1
end

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
    command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    or return

    set branch (command git symbolic-ref --short HEAD 2>/dev/null)
    if test -z "$branch"
        set branch (command git rev-parse --short HEAD 2>/dev/null)
    end

    command git diff --quiet --ignore-submodules --cached
    set staged_dirty $status

    command git diff --quiet --ignore-submodules
    set unstaged_dirty $status

    set set_dirty ""
    if test $staged_dirty -ne 0 -o $unstaged_dirty -ne 0
        set set_dirty (set_color red)" ✗"(set_color normal)
    else
        set set_dirty (set_color green)" ✔︎"(set_color normal)
    end

    echo -n " "(set_color magenta)" $branch$set_dirty"(set_color normal)
end

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_prompt
    set venv (virtualenv_prompt_info)
    set user (set_color cyan)$USER(set_color normal)

    if in_toolbox
        set machine (set_color brblack)(box_name)(set_color normal)
    else
        set machine (set_color blue)(box_name)(set_color normal)
    end

    set dir (set_color yellow --bold)"["(prompt_pwd)"]"(set_color normal)
    set git (git_info)

    echo -n "$venv$user"(set_color white)"@"(set_color normal)"$machine $dir$git"
    echo -n (set_color magenta --bold) (prompt_char)(set_color normal)" "
end
