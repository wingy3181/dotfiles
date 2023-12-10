#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Keyboard\n\n"

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

execute "defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false" \
    "Disable automatic capitalization"

execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
    "Disable automatic correction"

execute "defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false" \
    "Disable automatic period substitution"

execute "defaults write -g NSAutomaticDashSubstitutionEnabled -bool false" \
    "Disable smart dashes"

execute "defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false" \
    "Disable smart quotes"

execute "defaults write com.apple.HIToolbox AppleFnUsageType -int 2" \
    "Remap the emoji picker to the Fn key"

# https://github.com/diimdeep/dotfiles/blob/master/osx/configure/hotkeys.sh
# http://krypted.com/mac-os-x/defaults-symbolichotkeys/
# http://stackoverflow.com/questions/21878482/what-do-the-parameter-values-in-applesymbolichotkeys-plist-dict-represent
# System Preferences -> Keyboard -> Shortcuts -> Launchpad & Dock -> Show Launchpad (alt-command-l)
execute "defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 160 \" \
      <dict> \
        <key>false</key><true/> \
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
    "Disable keyboard shortcut <alt-command-l> to 'Show Launchpad'"

# System Preferences -> Keyboard -> Keyboard Shortcuts -> Services -> Text -> Open man Page in Terminal (alt-command-m) => Un-check
execute "defaults write pbs NSServicesStatus -dict-add 'com.apple.Terminal - Open man Page in Terminal - openManPage' \" \
      <dict> \
        <key>enabled_context_menu</key><false/> \
        <key>enabled_services_menu</key><false/> \
        <key>presentation_modes</key> \
        <dict> \
          <key>ContextMenu</key><false/> \
          <key>ServicesMenu</key><false/> \
        </dict> \
      </dict> \
    \"" \
    "Disable keyboard shortcut <alt-command-m> to 'Open man Page in Terminal'"

# System Preferences -> Keyboard -> Keyboard Shortcuts -> Services -> Text -> Search man Page in Terminal (alt-command-a) => Un-check
execute "defaults write pbs NSServicesStatus -dict-add 'com.apple.Terminal - Search man Page Index in Terminal - searchManPages' \" \
      <dict> \
        <key>enabled_context_menu</key><false/> \
        <key>enabled_services_menu</key><false/> \
        <key>presentation_modes</key> \
        <dict> \
          <key>ContextMenu</key><false/> \
          <key>ServicesMenu</key><false/> \
        </dict> \
      </dict> \
    \"" \
    "Disable keyboard shortcut <alt-command-a> to 'Search man Page Index in Terminal'"

# System Preferences -> Keyboard -> Keyboard Shortcuts -> Services -> Searching -> Search With Google (shift-command-l) => Un-check
execute "defaults write pbs NSServicesStatus -dict-add 'com.apple.Safari - Search With %WebSearchProvider@ - searchWithWebSearchProvider' \" \
      <dict> \
        <key>enabled_context_menu</key><false/> \
        <key>enabled_services_menu</key><false/> \
        <key>presentation_modes</key> \
        <dict> \
          <key>ContextMenu</key><false/> \
          <key>ServicesMenu</key><false/> \
        </dict> \
      </dict> \
    \"" \
    "Disable keyboard shortcut <shift-command-l> to 'Search with Google'"

# System Preferences -> Keyboard -> Keyboard Shortcuts -> Function Keys -> Use F1, F2, etc. keys as standard function keys => Toggled on
execute "defaults write -g com.apple.keyboard.fnState -int 1" \
    "Enable keyboard shortcut <fn> to 'Use F1, F2, etc. keys as standard function keys'"
