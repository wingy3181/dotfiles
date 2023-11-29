#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Remote Access Tools\n\n"

# https://github.com/Genymobile/scrcpy
# https://developer.android.com/studio/command-line/adb.html#wireless
brew_install_with_confirmation "scrcpy" "scrcpy"
# https://github.com/Homebrew/homebrew-core/issues/50444
# https://github.com/ikuwow/homebrew-ikuwow-sshrc
# https://github.com/ikuwow/sshrc
brew_install_with_confirmation "sshrc" "ikuwow/ikuwow-sshrc/sshrc"
# Re-assess later
#brew_install_with_confirmation "TeamViewer" "teamviewer" "--cask"
brew_install_with_confirmation "vysor.io" "vysor" "--cask"



