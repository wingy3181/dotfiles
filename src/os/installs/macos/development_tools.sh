#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Development Tools\n\n"

brew_install_with_confirmation "Arduino IDE" "arduino-ide" "--cask"
brew_install_with_confirmation "direnv" "direnv"
brew_install_with_confirmation "Jetbrains Toolbox" "jetbrains-toolbox" "--cask"
brew_install_with_confirmation "Postman" "postman" "--cask"
brew_install_with_confirmation "Responsively" "responsively˚" "--cask"
brew_install_with_confirmation "ShellCheck" "shellcheck"
brew_install_with_confirmation "VS Code" "visual-studio-code" "--cask"
brew_install_with_confirmation "yarn" "yarn"




