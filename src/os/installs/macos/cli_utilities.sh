#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   CLI Utilities\n\n"

brew_install_with_confirmation "Amazon Q" "amazon-q" "--cask"
brew_install_with_confirmation "bat" "bat"
brew_install_with_confirmation "delta" "delta"
brew_install_with_confirmation "jq" "jq"
# zoxide is optionally dependent on fzf
brew_install_with_confirmation "fzf" "fzf"
brew_install_with_confirmation "ripgrep" "ripgrep"
brew_install_with_confirmation "tree" "tree"
brew_install_with_confirmation "zoxide" "zoxide"
