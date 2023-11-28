#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Web Font Tools\n\n"

brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "" "bramstein/webfonttools"
brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "" "bramstein/webfonttools"
brew_install_with_confirmation "Web Font Tools: WOFF2" "woff2" "" "bramstein/webfonttools"
