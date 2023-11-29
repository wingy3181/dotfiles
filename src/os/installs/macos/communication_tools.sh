#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Communication Tools\n\n"

brew_install_with_confirmation "Discord" "discord" "--cask"
brew_install_with_confirmation "WhatsApp - Native desktop client for WhatsApp" "whatsapp" "--cask"




