#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "tmux" "tmux"
brew_install "tmux (pasteboard)" "reattach-to-user-namespace"
brew_install "tmuxinator" "tmuxinator"
