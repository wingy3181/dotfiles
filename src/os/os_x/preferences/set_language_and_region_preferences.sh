#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  Language & Region\n\n"

# System Preferences -> Language & Region
execute "defaults write NSGlobalDomain AppleLanguages -array 'en'" \
    "Set language"

execute "defaults write NSGlobalDomain AppleLocale -string 'en_AU'" \
    "Set locale"

execute "defaults write NSGlobalDomain AppleMeasurementUnits -string 'Centimeters'" \
    "Set measurement units"

execute "defaults write NSGlobalDomain AppleMetricUnits -int 1" \
    "Set metric units"
