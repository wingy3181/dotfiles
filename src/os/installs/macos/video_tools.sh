#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Video Tools\n\n"

brew_install_with_confirmation "VLC" "vlc" "--cask"

brew_install_with_confirmation "FFmpeg" "ffmpeg"
# https://gopro.com/en/au/shop/quik-app-video-photo-editor
# https://gopro.com/en/au/info/gopro-player
mas_install_with_confirmation  "GoPro Player + ReelSteady" "1460836908"
brew_install_with_confirmation "Handbrake" "handbrake" "--cask"




