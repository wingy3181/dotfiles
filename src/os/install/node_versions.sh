#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# https://nodejs.org/en/download/releases/
declare -r -a NODE_VERSIONS=(
    "node"
    "10"
    "8"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    declare -r NVM_DIRECTORY="$HOME/.nvm"
    declare -r NVM_GIT_REPO_URL="https://github.com/creationix/nvm.git"

    declare -r NVM_CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Node Version Manager

export NVM_DIR=\"$NVM_DIRECTORY\"

[ -f \"\$NVM_DIR/nvm.sh\" ] \\
    && . \"\$NVM_DIR/nvm.sh\"

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

        # Install the specified `node` versions

        for i in "${NODE_VERSIONS[@]}"; do
            execute \
                "nvm install $i" \
                "nvm (install: $i)"
        done

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # By default, use the latest stable version of `node`

        execute \
            "nvm alias default node" \
            "nvm (set default)"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        local nvmAutoSwitchFilePath=""
        if nvmAutoSwitchFilePath="$(brew --prefix nvm-auto-switch 2> /dev/null)/nvm-auto-switch.sh"; then
            declare -r NVM_AUTO_SWITCH_CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Node Version Manager Auto Switch (https://github.com/lalitkapoor/nvm-auto-switch)

export NVM_AUTOSWITCH_DIR=\"$nvmAutoSwitchFilePath\"

[ -f \"\$NVM_AUTOSWITCH_DIR\" ] \\
    && . \"\$NVM_AUTOSWITCH_DIR\"
"

            # '>>' : file to append to
            execute_without_spinner \
                "printf '%s' '$NVM_AUTO_SWITCH_CONFIGS' >> $HOME/.bash.local \
                    && . $HOME/.bash.local" \
                "nvm-auto-switch (update ~/.bash.local to source $nvmAutoSwitchFilePath)"
        else
            print_in_yellow "nvm-auto-switch not installed (skipping update to ~/.bash.local)"
        fi

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        print_in_green "\n  ---\n\n"

    fi

}

main
