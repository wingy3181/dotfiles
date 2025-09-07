#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Virtualisation Tools\n\n"

brew_install_with_confirmation "dive (Docker Image Explorer)" "dive"
brew_install_with_confirmation "Docker for Mac" "docker-desktop" "--cask"
brew_install_with_confirmation "Lens (Kubernetes IDE)" "lens" "--cask"
brew_install_with_confirmation "UTM - Virtual machines UI using QEMU" "utm" "--cask"



