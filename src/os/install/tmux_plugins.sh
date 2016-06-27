#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    declare -r TPM_DIR="$HOME/.tmux/plugins/tpm"
    declare -r TPM_GIT_REPO_URL="https://github.com/tmux-plugins/tpm.git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! cmd_exists "tmux"; then
        exit 1
    fi

    # # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Git` is installed

    if ! cmd_exists "git"; then
        print_error "Git is required, please install it!\n"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install / Update tmux plugins

    execute \
        "rm -rf '$TPM_DIR' \
            && git clone --quiet '$TPM_GIT_REPO_URL' '$TPM_DIR' \
            && $TPM_DIR/bin/install_plugins \
            && $TPM_DIR/bin/update_plugins all" \
        "Install tmux plugins"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"

}

main
