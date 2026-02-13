function uvr
    # Check if .env file exists
    if test -f .env
        uv run --env-file .env $argv
    else
        uv run $argv
    end
end
