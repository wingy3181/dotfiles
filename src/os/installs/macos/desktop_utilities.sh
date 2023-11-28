#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Desktop Utilities\n\n"

brew_install_with_confirmation "AppCleaner" "appcleaner" "--cask"
brew_install_with_confirmation "Cheatsheet" "cheatsheet" "--cask"
brew_install_with_confirmation "DisplayLink USB Graphics Software" "displaylink" "--cask"
brew_install_with_confirmation "Raycast" "raycast" "--cask"
brew_install_with_confirmation "Retina Display Menu" "avibrazil-rdm" "--cask"
brew_install_with_confirmation "Unarchiver" "the-unarchiver" "--cask"

# xtrafinder seems to be have removed from cask. Have to install manually via https://www.trankynam.com/xtrafinder/
# brew_install_with_confirmation "XtraFinder" "xtrafinder" "--cask"

