#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

# https://www.itemido.com/en/index.html
mas_install_with_confirmation  "Itemido: Manage Home Inventory" "1552953842"
# brew_install_with_confirmation "Keybase" "keybase" "--cask"
# https://www.64characters.com/telephone/
# https://github.com/64characters/Telephone
mas_install_with_confirmation  "Telephone - VoIP SIP softphone" "406825478"
