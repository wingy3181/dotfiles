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
brew_install_with_confirmation "Docker Desktop" "docker-desktop" "--cask"
brew_install_with_confirmation "Ghostty" "ghostty" "--cask"
brew_install_with_confirmation "Raycast" "raycast" "--cask"
mas_install_with_confirmation "Magnet" "441258766"

# https://herdr.dev/
brew_install_with_confirmation "Herdr" "herdr"

# https://github.com/tw93/mole
# https://mole.fit/
brew_install_with_confirmation "Mole" "mole"

# zoxide can use fzf for interactive directory selection.
brew_install_with_confirmation "fzf" "fzf"
brew_install_with_confirmation "FFmpeg" "ffmpeg"
brew_install_with_confirmation "reattach-to-user-namespace" \
    "reattach-to-user-namespace"
brew_install_with_confirmation "tree" "tree"
brew_install_with_confirmation "tmuxinator" "tmuxinator"
brew_install_with_confirmation "yq" "yq"
brew_install_with_confirmation "yt-dlp" "yt-dlp"
