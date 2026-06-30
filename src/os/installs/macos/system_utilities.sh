#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Utilities\n\n"

# Disk Inventory X is no longer supported and maintained.
# Look at grandperspective as an alternative
#brew_install_with_confirmation "GrandPerspective" "grandperspective" "--cask"
# https://github.com/alinradut/Disk-Inventory-X
# https://grandperspectiv.sourceforge.net/
brew_install_with_confirmation "Disk Inventory X" "disk-inventory-x" "--cask"
# https://github.com/tw93/mole
# https://mole.fit/
brew_install_with_confirmation "Mole" "mole"
brew_install_with_confirmation "htop" "htop"

