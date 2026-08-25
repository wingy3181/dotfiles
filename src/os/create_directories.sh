#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && . "profiles.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRECTORIES=(
        "$HOME/Development/code/github"
    )

    if dotfiles_profile_is_enabled "workstation"; then
        DIRECTORIES+=(
            "$HOME/Desktop/Screenshots/Gifox"
            "$HOME/Desktop/Screenshots/Snagit"
            "$HOME/Development/code/bitbucket"
            "$HOME/Development/code/playground/Arduino"
            "$HOME/Downloads/nzb/complete"
            "$HOME/Downloads/nzb/incomplete"
            "$HOME/Downloads/torrents/complete"
            "$HOME/Downloads/torrents/incomplete"
        )
    fi

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    dotfiles_parse_profile_arguments "$@" || exit 1

    print_in_purple "\n * Create directories\n\n"

    create_directories

}

main "$@"
