#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_purple "\n * Installs\n"
    print_warning "This may take awhile, so please be patient!\n"

    if $skipQuestions; then
        "./$(get_os)/main.sh" -y
    else
        "./$(get_os)/main.sh"
    fi
}

# Pass '-y' to script to skip questions
main "$@"
