# wrap fish's cd: it parses dirs like `--workspace-ski--` as options (upstream bug)
functions --copy cd __cd_orig
function cd --wraps cd --description "cd + venv hint, tolerates dirs starting with -"
    if set -q argv[1]; and test "$argv[1]" != -
        __cd_orig -- $argv
    else
        __cd_orig $argv
    end
    or return

    if test -d .venv
        echo -n ".venv found, activate with: "
        set_color green
        echo "source .venv/bin/activate.fish"
        set_color normal
    end
end
