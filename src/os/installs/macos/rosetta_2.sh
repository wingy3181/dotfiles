#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_rosetta_2_installed() {
    # https://apple.stackexchange.com/questions/427970/how-to-tell-if-m1-mac-has-rosetta-installed
    arch -arch x86_64 uname -m &> /dev/null
}

install_rosetta_2() {

    # Install `Rosetta 2`.

    sudo softwareupdate --install-rosetta --agree-to-license &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until `Rosetta 2` is installed.

    execute \
        "until is_rosetta_2_installed; do \
            sleep 5; \
         done" \
        "Install Rosetta 2"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Rosetta 2\n\n"

    install_rosetta_2

}

main
