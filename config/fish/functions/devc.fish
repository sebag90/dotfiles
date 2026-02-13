function devc
    # $argv[1] is the first argument, $argv[2..-1] are the rest
    devcontainer $argv[1] --workspace-folder . $argv[2..-1]
end
