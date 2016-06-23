#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r -a NPM_PACKAGES=(
    "babel-cli"
    "bower"
    "eslint"
    "grunt-cli"
    "gulp-cli"
    "http-server"
    "jshint"
    "jscs"
    "karma-cli"
    "localtunnel"
    "npm-check"
    "typescript"
    "webpack"
    "yo"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Check if `NVM_DIR` is set, and if it's not, it's because
    # `~/.bash.local` was not sourced (this happens when the
    # `dotfiles` are set up for the first time)

    if [ -z "$NVM_DIR" ] || ! cmd_exists "npm"; then # -z : True if the length of string is zero.
        . "$HOME/.bash.local"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `npm` is installed

    if ! cmd_exists "npm"; then
        print_error "npm is required, please install it!\n"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Ensure the most recent version of `npm` is installed

    execute \
        "npm install --silent --global npm" \
        "npm (update)"

    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified `npm` packages
    # NOTE: IMPORTANT - These only get installed on the default version of node set by nvm
    #       and have to get re-installed when switching node versions via nvm
    #       However, can use the `reinstall-packages-from` option of nvm
    #       (See https://github.com/creationix/nvm/issues/668 and 'Usage' section within README.md at https://github.com/creationix/nvm)

    for i in "${NPM_PACKAGES[@]}"; do
        execute \
            "npm install --silent --global $i" \
            "$i"
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"

}

main
