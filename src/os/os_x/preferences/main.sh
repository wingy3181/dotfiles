#!/usr/bin/env bash

# See https://github.com/herrbischoff/awesome-osx-command-line for more options

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../../utils.sh"

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

    ./set_app_store_preferences.sh
    ./set_chrome_preferences.sh
    if $skipQuestions; then
        ./set_computer_name.sh -y
    else
        ./set_computer_name.sh
    fi
    ./set_dashboard_preferences.sh
    ./set_dock_preferences.sh
    ./set_finder_preferences.sh
    ./set_firefox_preferences.sh
    ./set_keyboard_preferences.sh
    ./set_language_and_region_preferences.sh
    ./set_maps_preferences.sh
    ./set_photos_preferences.sh
    ./set_safari_preferences.sh
    ./set_terminal_preferences.sh
    ./set_textedit_preferences.sh
    ./set_trackpad_preferences.sh
    ./set_transmission_preferences.sh
    ./set_ui_and_ux_preferences.sh
    ./set_xtrafinder_preferences.sh

}

# Pass '-y' to script to skip questions
main "$@"
