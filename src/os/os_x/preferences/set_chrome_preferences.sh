#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  Chrome\n\n"

execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
    "Disable backswipe"

execute "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
    "Expand system-native print dialog by default"

execute "defaults write com.google.Chrome DisablePrintPreview -bool false" \
    "Use Chrome print preview first over system-native print preview dialog"

killall "Google Chrome" &> /dev/null
