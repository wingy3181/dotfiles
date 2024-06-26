#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_bash_it() {

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
        "Bash-it"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Re-source ~/.bash_profile to pick bash-it in current terminal

    execute_without_spinner \
        ". '$HOME/.bash_profile'" \
        "Bash-it (Re-source ~/.bash_profile)"

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
         && bash-it enable completion docker \
         && bash-it enable completion docker-compose \
         && bash-it enable completion git \
         && bash-it enable completion npm \
         && bash-it enable completion tmux" \
        "Bash-it (enable completions)"

    execute \
        "bash-it enable plugin alias-completion \
         && bash-it enable plugin base \
         && bash-it enable plugin battery \
         && bash-it enable plugin docker-compose \
         && bash-it enable plugin docker \
         && bash-it enable plugin explain \
         && bash-it enable plugin history \
         && bash-it enable plugin less-pretty-cat \
         && bash-it enable plugin proxy" \
        "Bash-it (enable plugins)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Bash\n\n"

    "./$(get_os)/bash.sh"
    install_bash_it

}

main
