#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  Dashboard\n\n"

# dashboard-enabled-state: 1=off, 2=space, 3=overlay
execute "defaults write com.apple.dashboard mcx-disabled -bool true && \
         defaults write com.apple.dashboard dashboard-enabled-state -int 1" \
    "Disable Dashboard"

# 'killall Dashboard' doesn't actually do anything. To apply
# the changes for Dashboard, 'killall Dock' is enough as `Dock`
# is `Dashboard`'s parent process.

killall "Dock" &> /dev/null
