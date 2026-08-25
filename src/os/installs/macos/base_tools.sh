#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Base Tools\n\n"

brew_install "direnv" "direnv"
brew_install "GitHub CLI" "gh"
brew_install "jq" "jq"
brew_install "ripgrep" "ripgrep"
brew_install "tmux" "tmux"
