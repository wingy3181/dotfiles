#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_npm_package() {
    execute "npm install --silent --global $1" "${2:-$1}"
}

install_npm_packages() {
    # Install the specified `npm` packages
    # NOTE: IMPORTANT - These only get installed on the default version of node set by nvm
    #       and have to get re-installed when switching node versions via nvm
    #       However, can use the `reinstall-packages-from` option of nvm
    #       (See https://github.com/creationix/nvm/issues/668 and 'Usage' section within README.md at https://github.com/creationix/nvm)
    declare -r -a NPM_PACKAGES=()

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${NPM_PACKAGES[@]}"; do
        install_npm_package "$i"
    done

}

update_npm() {
    install_npm_package "npm" "npm (update)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Check if `NVM_DIR` is set, and if it's not, it's because
    # `~/.bash.local` was not sourced (this happens when the
    # `dotfiles` are set up for the first time)

    if [ -z "$NVM_DIR" ] || ! cmd_exists "npm"; then # -z : True if the length of string is zero.
        . "$HOME/.bash.local"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info " npm"
    update_npm

    printf "\n"
    install_npm_packages

}

main
