#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "utils.sh"

declare -a DIRECTORIES=(
    "$HOME/Desktop/Screenshots"
    "$HOME/Development/code/bitbucket"
    "$HOME/Development/code/github"
    "$HOME/Development/code/playground"
    "$HOME/Documents/ebook"
    "$HOME/Downloads/torrents/complete"
    "$HOME/Downloads/torrents/incomplete"
    "$HOME/Videos/_to-organise"
    "$HOME/Videos/_to-watch-later"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

main
