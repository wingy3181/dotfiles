#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://github.com/Homebrew/homebrew-core/blob/master/Formula/v/vim.rb
brew_install_with_confirmation "Vim" "vim"
