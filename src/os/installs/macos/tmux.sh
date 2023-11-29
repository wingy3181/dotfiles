#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "tmux" "tmux"
brew_install_with_confirmation "tmux (pasteboard)" "reattach-to-user-namespace"
brew_install_with_confirmation "tmuxinator" "tmuxinator"
