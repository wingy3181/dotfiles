#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Core Tools\n\n"

# `brew uninstall icu4c@76`
# Required by apktool, boost, edencommon, fb303, fbthrift, ffmpeg, fizz, folly, ghostscript, harfbuzz, imagemagick, libass, openjdk, pango, scrcpy, tesseract, wangle and watchman, which are currently installed.
brew_install_with_confirmation "icu4c@76" "icu4c@76"

