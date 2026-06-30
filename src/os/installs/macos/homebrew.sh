#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_homebrew_to_path() {

    # Check if `brew` is available.

    if command -v brew &> /dev/null; then
        return
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If not, add it to the PATH.

    HARDWARE="$(uname -m)"
    prefix=""

    if [ "$HARDWARE" == "arm64" ]; then
        prefix="/opt/homebrew"
    else
        print_error "Homebrew is only supported on ARM processors!"
    fi

    #PATH="$prefix/bin:$PATH"
    eval "$($prefix/bin/brew shellenv)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Inform the user about the availability of `brew`.

    command -v brew &> /dev/null
    print_result $? "Add to PATH"
}

install() {

    if ! cmd_exists "brew"; then
        ask_for_sudo
        printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    print_result $? "Install"

}

opt_out_of_analytics() {
    execute \
        "brew analytics off" \
        "Opt-out of analytics"
}

update() {
    execute \
        "brew update" \
        "Update"
}

upgrade() {
    execute \
        "brew upgrade --yes" \
        "Upgrade"
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Homebrew\n\n"

    install
    add_homebrew_to_path
    opt_out_of_analytics

    update
    upgrade

}

main
