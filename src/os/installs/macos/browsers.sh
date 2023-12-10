#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install_with_confirmation "Arc" "arc" "--cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install_with_confirmation "Brave Browser" "brave-browser" "--cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install_with_confirmation "Chrome" "google-chrome" "--cask"
brew_install_with_confirmation "Chrome Canary" "google-chrome-canary" "--cask" "homebrew/cask-versions"
brew_install_with_confirmation "Chromium" "chromium" "--cask --no-quarantine"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install_with_confirmation "Firefox" "firefox" "--cask"
brew_install_with_confirmation "Firefox Developer" "firefox-developer-edition" "--cask" "homebrew/cask-versions"
brew_install_with_confirmation "Firefox Nightly" "firefox-nightly" "--cask" "homebrew/cask-versions"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install_with_confirmation "Microsoft Edge" "microsoft-edge" "--cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# `Safari Technology Preview` requires macOS X 10.11.4 or later
# https://github.com/alrra/dotfiles/issues/26

if is_supported_version "$(get_os_version)" "10.11.4"; then
    printf "\n"
    brew_install_with_confirmation "Safari Technology Preview" "safari-technology-preview" "--cask" "homebrew/cask-versions"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install_with_confirmation "Tor Browser" "tor-browser" "--cask"

