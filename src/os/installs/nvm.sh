#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r NVM_DIRECTORY="$HOME/.nvm"
declare -r NVM_GIT_REPO_URL="https://github.com/nvm-sh/nvm.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_nvm_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Node Version Manager
export NVM_DIR=\"$NVM_DIRECTORY\"
[ -f \"\$NVM_DIR/nvm.sh\" ] \\
    && . \"\$NVM_DIR/nvm.sh\"
[ -f \"\$NVM_DIR/bash_completion\" ] \\
    && . \"\$NVM_DIR/bash_completion\"
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # '>>' : file to append to
    execute_without_spinner \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "Update '$LOCAL_SHELL_CONFIG_FILE'"

}

install_latest_stable_node() {

    # Install the latest stable version of Node
    # (this will also set it as the default).
    # https://nodejs.org/en/download/releases/

    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && nvm install --lts" \
        "Install Node LTS"

}

install_nvm() {

    # Install `nvm` and add the necessary
    # configs in the local shell config file.

    execute \
        "git clone --quiet $NVM_GIT_REPO_URL $NVM_DIRECTORY" \
        "Install" \
    && add_nvm_configs

}

update_nvm() {

    execute \
        "cd $NVM_DIRECTORY \
            && git fetch --quiet origin \
            && git checkout --quiet \$(git describe --abbrev=0 --tags) \
            && . $NVM_DIRECTORY/nvm.sh" \
        "Upgrade"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   nvm\n\n"

    if [ ! -d "$NVM_DIRECTORY" ]; then # -d : True if file exists and is a directory.
        install_nvm
    else
        # Ensure the latest version of `nvm` is used
        update_nvm
    fi

    install_latest_stable_node

}

main
