#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n * Optional items & reminders\n\n"

    print_in_purple "\n   -- Customisations --\n\n"

    print_optional_info "Add favourite locations (home & Development) to Finder sidebar"
    print_optional_info "Symlink ebook folder ('ln -s ~/Library/CloudStorage/OneDrive/Documents/Study/ebooks ~/Documents/ebooks')"
    print_optional_info "Set wallpaper" # http://osxdaily.com/2015/08/28/set-wallpaper-command-line-macosx/
    print_optional_info "Set user profile picture"

    print_in_purple "\n   -- Account setup + licensing --\n\n"

    print_optional_info "Login to Google account via Chrome"
    print_optional_info "Login Microsoft account via Microsoft Office"
    print_optional_info "Login to Whatsapp"
    print_optional_info "Login to Discord"
    print_optional_info "Login to Authy"
    print_optional_info "Login to Ledger Live"

    print_optional_info "Set Jetbrains IDE settings via IDE Settings Sync and Jetbrains account (https://plugins.jetbrains.com/plugin/15525-ide-settings-sync and https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync)"
    print_optional_info "Set VS Code settings via Settings Sync (https://code.visualstudio.com/docs/editor/settings-sync)"
    print_optional_info "Activate licenses for 4kdownloader, beyond compare, gifox, jetbrains, synergy"
    print_optional_info "Set GPG key used for Keybase"

    print_in_purple "\n   -- Applications --\n\n"

    print_in_purple "\n   Development Tools\n\n"
    print_optional_info "Install JetBrains products (WebStorm, IntelliJ, DataGrip via JetBrains Toolbox"
    print_optional_info "Install Beyond Compare"
    print_optional_info "Install Chrome Apps - excalidraw, devdocs"
    print_optional_info "Assess Fig (https://fig.io/)"
    print_optional_info "Assess Warp (https://www.warp.dev/)"
    print_optional_info "Assess Unity (https://unity.com/)"

    print_in_purple "\n   Desktop Utilities\n\n"
    print_optional_info "Install Magnet from App Store (https://itunes.apple.com/au/app/magnet/id441258766?mt=12)"
    print_optional_info "Install Bandwidth+ from App Store (https://itunes.apple.com/au/app/bandwidth/id490461369?mt=12)"
    print_optional_info "Install Be Focused from App Store (https://apps.apple.com/au/app/be-focused-pomodoro-timer/id973134470?mt=12 | https://xwavesoft.com/be-focused-pro-for-iphone-ipad-mac-os-x.html)"
    print_optional_info "Install Presentify from App Store (https://apps.apple.com/app/id1507246666 and https://presentify.compzets.com/)"
    print_optional_info "Install EasyRes from App Store (https://itunes.apple.com/au/app/easyres/id688211836?mt=12)"
    print_optional_info "Install XtraFinder (http://www.trankynam.com/xtrafinder/) + setup preferences at src/os/preferences/macos/xtrafinder.sh"

    print_in_purple "\n   Miscellaneous Tools\n\n"
    print_optional_info "Install Keybase"
    print_optional_info "Install Ledger Live (https://www.ledger.com/pages/ledger-live or 'brew install --cask ledger-live')"
    print_optional_info "Install Telephone - VoIP SIP softphone (https://apps.apple.com/us/app/telephone/id406825478 and https://www.64characters.com/telephone/ and https://github.com/64characters/Telephone)"
    print_optional_info "Install Itemido: Manage Home Inventory from App Store (https://apps.apple.com/us/app/itemido-manage-home-inventory/id1552953842 and https://www.itemido.com/en/index.html)"
    print_optional_info "Assess Rewind (https://www.rewind.ai/)"

    print_in_purple "\n   Remote Access Tools\n\n"
    print_optional_info "Install Synergy (https://symless.com/synergy)"
    print_optional_info "Assess TeamViewer (https://www.teamviewer.com/)"

    print_in_purple "\n   Office Tools\n\n"
    print_optional_info "Install Kindle from App Store (https://apps.apple.com/us/app/amazon-kindle/id302584613) and rename registered device within Amazon https://www.amazon.com.au/hz/mycd/digital-console/alldevices"
    print_optional_info "Install Evernote (archive of old notes - use webapp)"
    print_optional_info "Assess Liquitext (https://www.liquidtext.net/)"
    print_optional_info "Assess Logseq (https://logseq.com/)"

    print_in_purple "\n   Video Tools\n\n"
    print_optional_info "Install Spatial Media Metadata Injector (https://github.com/google/spatial-media/releases and https://github.com/google/spatial-media/issues/261#issuecomment-1590148367)"
    print_optional_info "Install GoPro Player + ReelSteady from App Store (https://apps.apple.com/us/app/gopro-player/id1460836908?ls=1&mt=12 and https://gopro.com/en/au/info/gopro-player)"
    print_optional_info "Install Blackvue Viewer for Mac (https://www.blackvue.com/download/blackvue-mac-viewer-cloud/)"

    print_in_purple "\n   Virtualisation Tools\n\n"
    print_optional_info "Assess Parallels (https://www.parallels.com/products/desktop/)"

}

main
