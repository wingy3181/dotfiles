#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# Applications and tools used on every personal Mac. Keep this list small;
# machine-specific software belongs in a role or capability installer.

print_in_purple "\n   Personal Tools\n\n"

./mas-cli.sh
./../vim.sh

brew_install_with_confirmation "Chrome" "google-chrome" "--cask"
brew_install_with_confirmation "Raycast" "raycast" "--cask"
mas_install_with_confirmation "Magnet" "441258766"

# https://github.com/tw93/mole
# https://mole.fit/
brew_install_with_confirmation "Mole" "mole"
