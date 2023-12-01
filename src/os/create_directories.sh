#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRECTORIES=(
        "$HOME/Desktop/Screenshots"
        "$HOME/Development/code/bitbucket"
        "$HOME/Development/code/github"
        "$HOME/Development/code/playground"
        "$HOME/Documents/ebook/_to-organise"
        "$HOME/Documents/ebook/_to-read-later"
        "$HOME/Documents/ebook/_read"
        "$HOME/Downloads/nzb/complete"
        "$HOME/Downloads/nzb/incomplete"
        "$HOME/Downloads/torrents/complete"
        "$HOME/Downloads/torrents/incomplete"
        "$HOME/Videos/_to-organise"
        "$HOME/Videos/_to-watch-later"
        "$HOME/Videos/_watched"
    )

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n * Create directories\n\n"

    create_directories

}

main
