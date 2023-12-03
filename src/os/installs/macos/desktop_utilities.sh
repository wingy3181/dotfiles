#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Desktop Utilities\n\n"

brew_install_with_confirmation "AppCleaner" "appcleaner" "--cask"
mas_install_with_confirmation  "Bandwidth+" "490461369"
# https://xwavesoft.com/be-focused-pro-for-iphone-ipad-mac-os-x.html
mas_install_with_confirmation  "Be Focused - Pomodoro Timer" "973134470"
brew_install_with_confirmation "Cheatsheet" "cheatsheet" "--cask"
brew_install_with_confirmation "DisplayLink USB Graphics Software" "displaylink" "--cask"
mas_install_with_confirmation  "EasyRes" "688211836"
mas_install_with_confirmation  "Magnet" "441258766"
# https://presentify.compzets.com/
mas_install_with_confirmation  "Presentify - Screen Annotation" "1507246666"
brew_install_with_confirmation "Raycast" "raycast" "--cask"
brew_install_with_confirmation "Silicon" "silicon" "--cask"
brew_install_with_confirmation "Unarchiver" "the-unarchiver" "--cask"

# xtrafinder seems to be have removed from cask. Have to install manually via https://www.trankynam.com/xtrafinder/
# brew_install_with_confirmation "XtraFinder" "xtrafinder" "--cask"

