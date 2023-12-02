#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Video Tools\n\n"

brew_install_with_confirmation "VLC" "vlc" "--cask"

brew_install_with_confirmation "FFmpeg" "ffmpeg"
brew_install_with_confirmation "Handbrake" "handbrake" "--cask"



