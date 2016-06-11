#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local os=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    while :; do
        case $1 in
            -y|--yes) skipQuestions=true; break;;
                   *) break;;
        esac
        shift 1
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    os="$(get_os)" \
        || print_error "failed to get the kernel name"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ "$os" == "osx" ]; then
        if $skipQuestions; then
            ./os_x/preferences/main.sh -y
        else
            ./os_x/preferences/main.sh
        fi
    elif [ "$os" == "ubuntu" ]; then
        ./ubuntu/preferences/main.sh
    fi

}

# Pass '-y' to script to skip questions
main "$@"
