#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "../profiles.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    dotfiles_parse_profile_arguments "$@" || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_purple "\n * Preferences\n"

    # https://macos-defaults.com/
    if dotfiles_profile_is_enabled "workstation"; then
        "./$(get_os)/main.sh" "$@"
    elif dotfiles_profile_is_enabled "agent-host"; then
        "./$(get_os)/agent_host.sh"
    fi

}

# Pass '-y' to script to skip questions
main "$@"
