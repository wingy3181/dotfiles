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

    print_in_purple "\n * Preferences\n"

    # https://macos-defaults.com/
    if $skipQuestions; then
        "./$(get_os)/main.sh" -y
    else
        "./$(get_os)/main.sh"
    fi

}

# Pass '-y' to script to skip questions
main "$@"
