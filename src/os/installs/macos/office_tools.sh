#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Office Tools\n\n"

brew_install_with_confirmation "Calibre" "calibre" "--cask"
# Rename registered device within Amazon https://www.amazon.com.au/hz/mycd/digital-console/alldevices
mas_install_with_confirmation  "Kindle" "302584613"
brew_install_with_confirmation "Notion" "notion" "--cask"
brew_install_with_confirmation "PDF Expert" "pdf-expert" "--cask"
brew_install_with_confirmation "Microsoft Office" "microsoft-office" "--cask"




