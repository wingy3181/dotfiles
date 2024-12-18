#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n * Optional items & reminders\n\n"

    print_in_purple "\n   -- Customisations --\n\n"

    print_optional_info "Add favourite locations (home, Development & Videos) to Finder sidebar"
    print_optional_info "Symlink ebooks folder ('ln -s ~/Library/CloudStorage/OneDrive-Personal/Documents/Study/ebooks ~/Documents/ebooks')"
    print_optional_info "Symlink Videos folder ('ln -s ~/Library/CloudStorage/OneDrive-Personal/Videos ~/Videos')"
    print_optional_info "Configure 4Kdownloader+ 'Save to folder' as '~/Library/CloudStorage/OneDrive-Personal/Videos/_to-organise/4Kdownloader+'"
    print_optional_info "Configure Arduino IDE 'Preferences -> Settings -> Sketchbook location:' as '~/Development/code/playground/Arduino'"
    print_optional_info "Configure Gifox 'Preferences -> General -> Output directory:' as '~/Desktop/Screenshots/Gifox'"
    print_optional_info "Configure Snagit 'Settings -> Advanced -> Library Location:' as '~/Desktop/Screenshots/Snagit'"
    print_optional_info "Set wallpaper" # http://osxdaily.com/2015/08/28/set-wallpaper-command-line-macosx/
    print_optional_info "Set user profile picture"
    print_optional_info "Setup ~/.ssh/config"

    print_in_purple "\n   -- Account setup + licensing --\n\n"

    print_optional_info "Login to Google account via Chrome"
    print_optional_info "Login Microsoft account via Microsoft Office"
    print_optional_info "Login to Whatsapp"
    print_optional_info "Login to Discord"
    print_optional_info "Login to Authy"
    print_optional_info "Login to Ledger Live"

    print_optional_info "Configure Jetbrains IDE settings via IDE Settings Sync and Jetbrains account (https://plugins.jetbrains.com/plugin/15525-ide-settings-sync and https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync)"
    print_optional_info "Configure VS Code settings via Settings Sync (https://code.visualstudio.com/docs/editor/settings-sync)"
    print_optional_info "Activate licenses for 4kdownloader, bartender, beyond compare, gifox, jetbrains, synergy"
    print_optional_info "Configure GPG key used for Keybase"
    print_optional_info "Configure sabnzbd (servers + download locations)"
    print_optional_info "Configure 'Telephone - VoIP SIP softphone' with voip account"

    print_in_purple "\n   -- Applications --\n\n"

    print_in_purple "\n   Development Tools\n\n"
    print_optional_info "Install JetBrains products (WebStorm, IntelliJ, DataGrip via JetBrains Toolbox)"
    print_optional_info "Configure Jetbrains products (WebStorm, IntelliJ, DataGrip via JetBrains Toolbox): Tools -> Terminal -> Application Settings -> Shell path -> '/opt/homebrew/bin/bash'"
    print_optional_info "Configure Jetbrains Toolbox: Settings -> Tools -> Generate shell scripts -> Shell scripts location -> '~/Library/Application Support/Jetbrains/Toolbox/scripts' => Add this to PATH in ~/.bash.local"
    print_optional_info "Install Beyond Compare"
    print_optional_info "Install Chrome Apps - excalidraw, devdocs"
    print_optional_info "Install nRF Connect for Desktop (https://www.nordicsemi.com/Products/Development-tools/nrf-connect-for-desktop) for nRF52840 dongles"
    print_optional_info "Assess Fig (https://fig.io/)"
    print_optional_info "Assess Warp (https://www.warp.dev/)"
    print_optional_info "Assess Unity (https://unity.com/)"

    print_in_purple "\n   Desktop Utilities\n\n"
    print_optional_info "Install Homerow (https://www.homerow.app/ OR https://github.com/dexterleng/homerow#user-guide)"
    print_optional_info "[NOT RECOMMENDED as per README!!!] Install XtraFinder (http://www.trankynam.com/xtrafinder/) + setup preferences at src/os/preferences/macos/xtrafinder.sh"

    print_in_purple "\n   Gaming\n\n"
    print_optional_info "Install Meta Quest Remote Desktop (https://www.oculus.com/desktop/)"

    print_in_purple "\n   Miscellaneous Tools\n\n"
    print_optional_info "Install Authy (https://authy.com/download/ or 'brew install --cask authy') on primary laptop only"
    print_optional_info "Install Keybase"
    print_optional_info "Install Ledger Live (https://www.ledger.com/pages/ledger-live or 'brew install --cask ledger-live')"
    # https://github.com/mas-cli/mas/issues/321
    # https://www.itemido.com/en/index.html
    # mas_install_with_confirmation  "Itemido: Manage Home Inventory" "1552953842"
    print_optional_info "Install Itemido: Manage Home Inventory from App Store for iPadOS (https://apps.apple.com/au/app/id1552953842)"
    print_optional_info "Assess Rewind (https://www.rewind.ai/)"

    print_in_purple "\n   Remote Access Tools\n\n"
    print_optional_info "Install Synergy (https://symless.com/synergy)"
    print_optional_info "Assess TeamViewer (https://www.teamviewer.com/)"

    print_in_purple "\n   Office Tools\n\n"
    print_optional_info "Install Evernote (archive of old notes - use webapp)"
    print_optional_info "Rename registered Kindle device within Amazon https://www.amazon.com.au/hz/mycd/digital-console/alldevices"
    print_optional_info "Assess Liquitext (https://www.liquidtext.net/)"
    print_optional_info "Assess Logseq (https://logseq.com/)"

    print_in_purple "\n   Video Tools\n\n"
    print_optional_info "Install Spatial Media Metadata Injector (https://github.com/wingy3181/spatial-media/blob/doc-step-build-run-spatialmedia/dist/Spatial%20Media%20Metadata%20Injector.zip OR https://github.com/wingy3181/spatial-media/blob/doc-step-build-run-spatialmedia/scripts/REFERENCES.md OR https://github.com/google/spatial-media/releases and https://github.com/google/spatial-media/issues/261#issuecomment-1590148367)"
    print_optional_info "Install Blackvue Viewer for Mac (https://www.blackvue.com/download/blackvue-mac-viewer-cloud/)"

    print_in_purple "\n   Virtualisation Tools\n\n"
    print_optional_info "Assess Parallels (https://www.parallels.com/products/desktop/)"

}

main
