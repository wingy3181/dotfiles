#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  Finder\n\n"

execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && \
         defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && \
         defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
    "Use full POSIX path as window title"

execute "defaults write com.apple.finder DisableAllAnimations -bool true" \
    "Disable all animations"

# Finder -> Preferences -> Advanced -> Show warning before emptying the Trash
execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
    "Disable the warning before emptying the Trash"

# Finder -> Preferences -> Advanced -> When performing a search
# SCev : Search This Mac
# SCcf : Search the Current Folder
# SCsp : Use the Previous Search Scope
execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
    "Search the current directory by default"

# Finder -> Preferences -> Advanced -> Show warning before changing an extension
execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
    "Disable warning when changing a file extension"

# Finder -> View
# icnv : As Icons
# Nlsv : As List
# clmv : As Columns
# Flwv : As Cover Flow
execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
    "Use list view in all Finder windows by default"

# Finder -> View -> Show Status Bar
execute "defaults write com.apple.finder ShowStatusBar -bool true" \
    "Show status bar"

# Finder -> View -> Show Path Bar
execute "defaults write com.apple.finder ShowPathbar -bool true" \
    "Show path bar"

# Set Desktop as the default location for new Finder windows
# For Desktop, use 'PfDe' and 'file://$HOME/Desktop/'
# For Home, use 'PfHm' and 'file://$HOME//'
# For other paths, use `PfLo` and `file:///full/path/here/`
execute "defaults write com.apple.finder NewWindowTarget -string 'PfHm' && \
         defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/'" \
    "Set 'Desktop' as the default location for new Finder windows"

# Finder -> Preferences -> General -> Show these items on the desktop
execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
         defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" \
    "Show icons for hard drives, servers, and removable media on the desktop"

# Finder -> Preferences -> Sidebar -> Tags
execute "defaults write com.apple.finder ShowRecentTags -bool true" \
    "Show recent tags"

# Finder -> Preferences -> Advanced -> Show all filename extensions
execute "defaults write NSGlobalDomain AppleShowAllExtensions -bool true" \
    "Show all filename extensions"

# Finder -> Preferences -> View -> Show View Options -> Icon Size
execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon size"

# Finder -> Preferences -> View -> Show View Options -> Grid Spacing
execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon grid spacing size"

# Finder -> Preferences -> View -> Show View Options -> Text Size
execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 10' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 10' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label text size"

# Finder -> Preferences -> View -> Show View Options -> Label position
execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label position"

# Finder -> Preferences -> View -> Show View Options -> Show item info
execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist" \
    "Show item info"

# Finder -> Preferences -> View -> Show View Options -> Arrange By
execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist" \
    "Set arrange by method"

killall "Finder" &> /dev/null

# Starting with Mac OS X Mavericks preferences are cached,
# so in order for things to get properly set using `PlistBuddy`,
# the `cfprefsd` process also needs to be killed
#
# https://github.com/alrra/dotfiles/commit/035dda057ddc6013ba21db3d2c30eeb51ba8f200

killall "cfprefsd" &> /dev/null
