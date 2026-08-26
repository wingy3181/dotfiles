#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

print_in_purple "\n   Remote Agent Host\n\n"

# Keep the host available while it is connected to power without changing its
# battery settings. The display can still sleep and the lock screen stays on.
execute "sudo pmset -c sleep 0" \
    "Prevent system sleep while connected to power"
execute "sudo pmset -c displaysleep 10" \
    "Turn the display off after 10 minutes while connected to power"
execute "sudo pmset -c womp 1" \
    "Enable wake for network access while connected to power"
execute "sudo pmset -c powernap 1" \
    "Enable Power Nap while connected to power"
execute "sudo pmset -c autorestart 1" \
    "Restart automatically after power loss while connected to power"
