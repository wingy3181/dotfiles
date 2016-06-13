#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  Dock\n\n"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

# http://www.engadget.com/2008/09/24/terminal-tips-make-the-dock-spring-loaded/
execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

execute "defaults write com.apple.dock expose-animation-duration -float 0.2" \
    "Speed up Mission Control animations (control up)"

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

# System Preferences -> Dock -> Automatically hide and show the Dock
#   http://osxdaily.com/2010/06/22/make-hidden-application-icons-translucent-in-the-dock/
execute "defaults write com.apple.dock showhidden -bool true" \
    "Make icons of hidden applications translucent"

# System Preferences -> Dock -> Size
execute "defaults write com.apple.dock tilesize -int 40" \
    "Set icon size"

killall "Dock" &> /dev/null
