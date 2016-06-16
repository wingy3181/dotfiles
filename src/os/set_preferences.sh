#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

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

    if $skipQuestions; then
        "./$os/preferences/main.sh" -y
    else
        "./$os/preferences/main.sh"
    fi

}

# Pass '-y' to script to skip questions
main "$@"
