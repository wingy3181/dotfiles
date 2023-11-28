#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {

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
        "Install plugins"

}

main() {

    print_in_purple "\n   Tmux\n\n"

    "./$(get_os)/tmux.sh"
    install_plugins

}

main
