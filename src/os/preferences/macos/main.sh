#!/usr/bin/env bash

# See https://github.com/herrbischoff/awesome-osx-command-line for more options

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

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

    ./app_store.sh
    ./chrome.sh
    if $skipQuestions; then
        ./computer_name.sh -y
    else
        ./computer_name.sh
    fi
    ./dashboard.sh
    ./dock.sh
    ./finder.sh
    ./firefox.sh
    ./keyboard.sh
    ./language_and_region.sh
    ./maps.sh
    ./photos.sh
    ./safari.sh
    ./terminal.sh
    ./textedit.sh
    ./trackpad.sh
    ./transmission.sh
    ./ui_and_ux.sh
    ./xtrafinder.sh

}

# Pass '-y' to script to skip questions
main "$@"
