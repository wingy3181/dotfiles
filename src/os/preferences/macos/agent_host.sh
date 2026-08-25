#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

print_in_purple "\n   Remote Agent Host\n\n"

execute "defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true" \
    "Enable automatic update checks"
execute "defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1" \
    "Download updates in the background"
execute "defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1" \
    "Install security and system data updates"
