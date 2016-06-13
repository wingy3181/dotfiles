#!/usr/bin/env bash

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
        || print_error "Failed to get the kernel name"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_warning "This may take awhile, so please be patient!\n"

    if [ "$os" == "macos" ]; then
        if $skipQuestions; then
            ./macos/installs/main.sh -y
        else
            ./macos/installs/main.sh
        fi
    fi

}

# Pass '-y' to script to skip questions
main "$@"
