#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dock\n\n"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

# http://www.engadget.com/2008/09/24/terminal-tips-make-the-dock-spring-loaded/
execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

# System Preferences -> Mission Control -> Group windows by application
#   http://osxdaily.com/2012/07/30/expose-mac-os-x-mountain-lion/
execute "defaults write com.apple.dock expose-group-by-app -bool false" \
    "Do not group windows by application in Mission Control"

execute "defaults write com.apple.dock mineffect -string 'genie'" \
    "Change minimize/maximize window effect"

# System Preferences -> Dock -> Minimize windows into application icon
#   http://osxdaily.com/2013/04/20/minimize-windows-into-application-icons-dock-mac-os-x/
execute "defaults write com.apple.dock minimize-to-application -bool true" \
    "Reduce clutter by minimizing windows into their application icons"

# System Preferences -> Mission Control -> Automatically rearrange spaces based on most recent use
execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

#execute "defaults write com.apple.dock persistent-apps -array && \
#         defaults write com.apple.dock persistent-others -array " \
#    "Wipe all app icons"

# System Preferences -> Dock -> Show indicators for open applications
execute "defaults write com.apple.dock show-process-indicators -bool true" \
    "Show indicator lights for open applications"

# System Preferences -> Dock -> Show suggested and recent apps in Dock
execute "defaults write com.apple.dock show-recents -bool false" \
    "Do not show recent applications in Dock"

# System Preferences -> Dock -> Automatically hide and show the Dock
#   http://osxdaily.com/2010/06/22/make-hidden-application-icons-translucent-in-the-dock/
execute "defaults write com.apple.dock showhidden -bool true" \
    "Make icons of hidden applications translucent"

# System Preferences -> Dock -> Size
execute "defaults write com.apple.dock tilesize -int 40" \
    "Set icon size"

# System Preferences -> Desktop & Screen Saver -> Hot Corners...
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top right screen corner → no-op
execute "defaults write com.apple.dock wvous-tr-corner -int 11 && \
         defaults write com.apple.dock wvous-tr-modifier -int 0" \
    "Set Hot Corner - Top right to 'Show Launchpad'"

# Top left screen corner → no-op
execute "defaults write com.apple.dock wvous-tl-corner -int 0 && \
         defaults write com.apple.dock wvous-tl-modifier -int 0" \
    "Set Hot Corner - Top left to 'no-op'"

# Bottom right screen corner → Desktop
execute "defaults write com.apple.dock wvous-br-corner -int 4 && \
         defaults write com.apple.dock wvous-br-modifier -int 0" \
    "Set Hot Corner - Bottom right to 'Show Desktop'"

# Bottom left screen corner → Start screen saver
execute "defaults write com.apple.dock wvous-bl-corner -int 5 && \
         defaults write com.apple.dock wvous-bl-modifier -int 0" \
    "Set Hot Corner - Bottom left to 'Start screen saver'"

killall "Dock" &> /dev/null
