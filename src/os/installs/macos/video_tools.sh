#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Video Tools\n\n"

mas_install_with_confirmation  "DaVinci Resolve" "571213070"
brew_install_with_confirmation "FFmpeg" "ffmpeg"
# https://gopro.com/en/au/shop/quik-app-video-photo-editor
mas_install_with_confirmation  "GoPro Quik Video Photo Editor" "561350520"
# https://gopro.com/en/au/info/gopro-player
mas_install_with_confirmation  "GoPro Player + ReelSteady" "1460836908"
brew_install_with_confirmation "Handbrake" "handbrake" "--cask"
brew_install_with_confirmation "VLC" "vlc" "--cask"




