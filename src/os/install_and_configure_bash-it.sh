#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    declare -r BASHIT_DIR="$HOME/.bash_it"
    declare -r BASHIT_GIT_REPO_URL="https://github.com/Bash-it/bash-it.git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Git` is installed

    if ! cmd_exists "git"; then
        print_error "Git is required, please install it!\n"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install Bash-it

    execute \
        "rm -rf '$BASHIT_DIR' \
            && git clone --quiet '$BASHIT_GIT_REPO_URL' '$BASHIT_DIR'" \
        "Install Bash-it"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Re-source ~/.bash_profile to pick bash-it in current terminal

    execute \
        "source '$HOME/.bash_profile'" \
        "Re-source ~/.bash_profile"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Enable Bash-it alias', completions & plugins
    # See README.md of https://github.com/Bash-it/bash-it for more info
    # or run the following commands:
    # > `bash-it show aliases`
    # > 'bash-it show completions`
    # > `bash-it show plugins`

    execute \
        "bash-it enable alias docker \
         && bash-it enable alias git" \
        "Bash-it (enable aliases)"

    execute \
        "bash-it enable completion bash-it \
         && bash-it enable completion sdkman \
         && bash-it enable completion tmux" \
        "Bash-it (enable completions)"

    execute \
        "bash-it enable plugin base \
         && bash-it enable plugin battery \
         && bash-it enable plugin explain" \
        "Bash-it (enable plugins)"

}

main
