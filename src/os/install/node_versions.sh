#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# https://nodejs.org/en/download/releases/
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    declare -r NVM_DIRECTORY="$HOME/.nvm"
    declare -r NVM_GIT_REPO_URL="https://github.com/creationix/nvm.git"

    declare -r NVM_CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Node Version Manager

export NVM_DIR=\"$NVM_DIRECTORY\"

[ -f \"\$NVM_DIR/nvm.sh\" ] \\
    && . \"\$NVM_DIR/nvm.sh\" \\
    && . \"\$HOME/.bash_nvm\"

[ -f \"\$NVM_DIR/bash_completion\" ] \\
    && . \"\$NVM_DIR/bash_completion\"
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Git` is installed

    if ! cmd_exists "git"; then
        print_error "Git is required, please install it!\n"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install `nvm` and add the necessary configs to `~/.bash.local`

    if [ ! -d "$NVM_DIRECTORY" ]; then # -d : True if file exists and is a directory.

        execute \
            "git clone --quiet $NVM_GIT_REPO_URL $NVM_DIRECTORY" \
            "nvm" || return 1

        # '>>' : file to append to
        execute_without_spinner \
            "printf '%s' '$NVM_CONFIGS' >> $HOME/.bash.local \
                && . $HOME/.bash.local" \
            "nvm (update ~/.bash.local)"

    fi

    if [ -d "$NVM_DIRECTORY" ]; then # -d : True if file exists and is a directory.

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Ensure the latest version of `nvm` is used

        execute \
            "cd $NVM_DIRECTORY \
                && git fetch --quiet origin \
                && git checkout --quiet \$(git describe --abbrev=0 --tags) \
                && . $NVM_DIRECTORY/nvm.sh" \
            "nvm (upgrade)"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Install the latest stable version of Node.JS
        # (this will also set it as the default)
        execute \
            "nvm install node" \
            "nvm (install: node)"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        print_in_green "\n  ---\n\n"

    fi

}

main
