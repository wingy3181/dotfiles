#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Networking Tools\n\n"

brew_install_with_confirmation "Gas Mask" "gas-mask" "--cask"
brew_install_with_confirmation "NordVPN" "nordvpn" "--cask"
brew_install_with_confirmation "Squidman" "squidman" "--cask"
brew_install_with_confirmation "Tunnelblick" "tunnelblick" "--cask"
brew_install_with_confirmation "Wireshark" "wireshark-app" "--cask"




