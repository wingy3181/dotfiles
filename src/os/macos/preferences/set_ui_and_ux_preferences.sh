#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  UI & UX\n\n"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
    "Avoid creating '.DS_Store' files on network volumes"

execute "defaults write com.apple.menuextra.battery ShowPercent -string 'YES'" \
    "Show battery percentage from the menu bar"

execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    "Disable 'Are you sure you want to open this application?' dialog"

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

# https://tidbits.com/article/15616
execute "defaults write com.apple.screencapture disable-shadow -bool true" \
    "Disable shadow in screenshots"

execute "defaults write com.apple.screencapture location -string '$HOME/Desktop/Screenshots'" \
    "Save screenshots to the Desktop"

execute "defaults write com.apple.screencapture type -string 'png'" \
    "Save screenshots as PNGs"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
    "Require password immediately after into sleep or screen saver mode"

# System Preferences -> Mission Control -> Displays have separate Spaces (requires logout)
execute "defaults write com.apple.spaces spans-displays -bool false" \
    "Enable 'Displays have separate Spaces'"

# System Preferences -> General -> Use dark menu bar and Dock
execute "defaults write NSGlobalDomain AppleInterfaceStyle -string 'Dark'" \
    "Use dark menu bar and Dock"

# http://osxdaily.com/2014/10/27/change-font-smoothing-text-os-x-yosemite/
execute "defaults write NSGlobalDomain AppleFontSmoothing -int 2" \
    "Enable subpixel font rendering on non-Apple LCDs"

# System Preferences -> General -> Show scrollsbars -> Automatically based on mouse or trackpad
execute "defaults write NSGlobalDomain AppleShowScrollBars -string 'Automatic'" \
    "Show scrollbars automatically based on mouse or trackpad"

# http://osxdaily.com/2012/05/15/disable-automatic-termination-of-apps-in-mac-os-x/
execute "defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

# https://www.tekrevue.com/tip/expanded-save-dialog-os-x/
execute "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

# System Preferences -> General -> Sidebar icon size -> 1=Small, 2=Medium, 3=Large
#   http://www.macobserver.com/tmo/article/os_x_lion_changing_sidebar_icon_sizes
execute "defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1" \
    "Set sidebar icon size to small"

# Occurs when tabbing between fields in dialogs
#   http://arstechnica.com/apple/2014/10/os-x-10-10/5/
execute "defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false" \
    "Disable the over-the-top focus ring animation"

# System Preferences -> General -> Close windows when quiting an app
#   https://support.apple.com/en-us/HT204005
#   http://osxdaily.com/2011/07/18/disable-mac-os-x-lion-resume-window-restore/
execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

execute "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

# http://osxdaily.com/2011/07/19/automatically-restart-your-mac-if-it-freezes-in-os-x-lion/
execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

execute "sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 1 && \
         sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist && \
         sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist" \
    "Turn Bluetooth on"

# Below loop doesn't seem to do anything and actually the command afterwards actually removes the icons.
# Have left it here in case, it was something to do with my machine.
execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
            sudo defaults write \"\${domain}\" dontAutoLoad -array \
                '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
                '/System/Library/CoreServices/Menu Extras/Volume.menu'
         done
        " \
    "Hide Time Machine and Volume icons from the menu bar"

execute "defaults write com.apple.systemuiserver menuExtras -array \
                '/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu' \
                '/System/Library/CoreServices/Menu Extras/AirPort.menu' \
                '/System/Library/CoreServices/Menu Extras/Battery.menu' \
                '/System/Library/CoreServices/Menu Extras/Clock.menu'
        " \
    "Show Keychain, AirPort, Battery and Clock icons on the menu bar"

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
# Bottom right screen corner → Desktop
execute "defaults write com.apple.dock wvous-br-corner -int 4 && \
         defaults write com.apple.dock wvous-br-modifier -int 0" \
    "Set Hot Corner - Bottom right to 'Show Desktop'"
# Bottom left screen corner → Start screen saver
execute "defaults write com.apple.dock wvous-bl-corner -int 5 && \
         defaults write com.apple.dock wvous-bl-modifier -int 0" \
    "Set Hot Corner - Bottom left to 'Start screen saver'"

killall "SystemUIServer" &> /dev/null
