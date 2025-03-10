#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Video Tools\n\n"

mas_install_with_confirmation  "DaVinci Resolve" "571213070"
brew_install_with_confirmation "FFmpeg" "ffmpeg"
# https://gopro.com/en/au/info/gopro-player
mas_install_with_confirmation  "GoPro Player + ReelSteady" "1460836908"
brew_install_with_confirmation "Handbrake" "handbrake" "--cask"
# https://www.insta360.com/download/app/studio2019
brew_install_with_confirmation "Insta360 Studio" "insta360-studio" "--cask"
brew_install_with_confirmation "VLC" "vlc" "--cask"




