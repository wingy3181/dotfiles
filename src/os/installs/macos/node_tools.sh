#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Node Development\n\n"

brew_install "pnpm" "pnpm"
brew_install "watchman" "watchman"
brew_install "yarn" "yarn"
