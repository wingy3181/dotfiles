#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Gaming\n\n"

brew_install_with_confirmation "Dolphin Beta (GameCube Emulator)" "dolphin@beta" "--cask"
brew_install_with_confirmation "SideQuest" "sidequest" "--cask"
brew_install_with_confirmation "VR Virtual Desktop Streamer" "virtual-desktop-streamer" "--cask"




