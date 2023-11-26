#!/usr/bin/env bash

# See https://github.com/herrbischoff/awesome-osx-command-line for more options

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Close any open `System Preferences` panes in order to
    # avoid overriding the preferences that are being changed.
    
    ./close_system_preferences_panes.applescript
    
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./app_store.sh
    ./chrome.sh
    if $skipQuestions; then
        ./computer_name.sh -y
    else
        ./computer_name.sh
    fi
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
