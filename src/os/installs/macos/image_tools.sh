#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Image Tools\n\n"

brew_install_with_confirmation "GIMP" "gimp" "--cask"
brew_install_with_confirmation "ImageMagick" "imagemagick"
brew_install_with_confirmation "ImageOptim" "imageoptim" "--cask"


