#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Android Tools\n\n"

brew_install_with_confirmation "Android File Transfer" "android-file-transfer" "--cask"
brew_install_with_confirmation "Android Platform Tools" "android-platform-tools" "--cask"
brew_install_with_confirmation "apktool" "apktool"




