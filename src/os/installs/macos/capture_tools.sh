#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Capture Tools\n\n"

brew_install_with_confirmation "Gifox" "gifox" "--cask"
brew_install_with_confirmation "ScanSnap Home" "fujitsu-scansnap-home" "--cask"
brew_install_with_confirmation "Snagit" "snagit" "--cask"



