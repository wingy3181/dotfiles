#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Downloaders\n\n"

brew_install_with_confirmation "4K Video Downloader" "4k-video-downloader" "--cask"
brew_install_with_confirmation "Transmission" "transmission" "--cask"
brew_install_with_confirmation "sabnzbd" "sabnzbd" "--cask"
brew_install_with_confirmation "yt-dlp" "yt-dlp"






