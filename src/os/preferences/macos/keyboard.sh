#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n Keyboard\n\n"

# System Preferences -> Keyboard -> Shortcuts -> 1=Text boxes and lists only, 3=All controls
#   https://github.com/CamHenlin/imessageclient/issues/6
execute "defaults write -g AppleKeyboardUIMode -int 3" \
    "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"

# System Preferences -> Keyboard -> Keyboard
execute "defaults write -g ApplePressAndHoldEnabled -bool false" \
    "Enable press-and-hold in favor of key repeat"

execute "defaults write -g 'InitialKeyRepeat_Level_Saved' -int 10 && \
         defaults write -g InitialKeyRepeat -int 10" \
    "Set delay until repeat"

execute "defaults write -g KeyRepeat -int 1" \
    "Set the key repeat rate to fast"

# System Preferences -> Keyboard -> Text
# https://coolestguidesontheplanet.com/turn-autocorrect-osx-mac-mail-skype-10-9-mavericks/
execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
        "Disable auto-correct"

execute "defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false" \
    "Disable smart quotes"

execute "defaults write -g NSAutomaticDashSubstitutionEnabled -bool false" \
    "Disable smart dashes"

# https://github.com/diimdeep/dotfiles/blob/master/osx/configure/hotkeys.sh
# http://krypted.com/mac-os-x/defaults-symbolichotkeys/
# http://stackoverflow.com/questions/21878482/what-do-the-parameter-values-in-applesymbolichotkeys-plist-dict-represent
# System Preferenes -> Keyboard -> Shortcuts -> Launchpad & Dock -> Show Launchpad (alt-command-l)
execute "defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 160 \" \
      <dict> \
        <key>enabled</key><true/> \
        <key>value</key><dict> \
          <key>type</key><string>standard</string> \
          <key>parameters</key> \
          <array> \
            <integer>108</integer> \
            <integer>37</integer> \
            <integer>1572864</integer> \
          </array> \
        </dict> \
      </dict> \
    \"" \
    "Enable keyboard shortcut <alt-command-l> to 'Show Launchpad'"
