#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info " Language & Region"

# System Preferences -> Language & Region
execute "defaults write -g AppleLanguages -array 'en'" \
    "Set language"

execute "defaults write -g AppleLocale -string 'en_AU'" \
    "Set locale"

execute "defaults write -g AppleMeasurementUnits -string 'Centimeters'" \
    "Set measurement units"

execute "defaults write -g AppleMetricUnits -int 1" \
    "Set metric units"
