#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   CLI Utilities\n\n"

brew_install_with_confirmation "bat" "bat"
brew_install_with_confirmation "delta" "delta"
brew_install_with_confirmation "jq" "jq"
brew_install_with_confirmation "Kiro CLI" "kiro-cli" "--cask"
brew_install_with_confirmation "ripgrep" "ripgrep"
brew_install_with_confirmation "wget" "wget"
brew_install_with_confirmation "zoxide" "zoxide"
