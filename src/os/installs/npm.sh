#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_npm_package() {

    execute \
        ". $HOME/.bash.local \
            && npm install --global --silent $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   npm\n\n"

    install_npm_package "Update npm" "npm"
    #printf "\n"
    # Install the specified `npm` packages
    # [!]: IMPORTANT - These only get installed on the default version of node set by nvm
    #       and have to get re-installed when switching node versions via nvm
    #       However, can use the `reinstall-packages-from` option of nvm
    #       (See https://github.com/creationix/nvm/issues/668 and 'Usage' section within README.md at https://github.com/creationix/nvm)
    # install_npm_package "<label>" "<npm-package-name>"
    # e.g.) install_npm_package "SVGO" "svgo"

}

main
