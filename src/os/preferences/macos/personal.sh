#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

main() {

    local skipQuestions=false

    skip_questions "$@" \
        && skipQuestions=true

    print_in_purple "\n   Personal Preferences\n\n"

    ./app_store.sh
    ./chrome.sh
    if $skipQuestions; then
        ./computer_name.sh -y
    else
        ./computer_name.sh
    fi
    ./dock.sh
    ./finder.sh
    ./keyboard.sh
    ./language_and_region.sh
    ./security_and_privacy.sh
    ./terminal.sh
    ./textedit.sh
    ./trackpad.sh
    ./ui_and_ux.sh

}

# Pass '-y' to script to skip questions
main "$@"
