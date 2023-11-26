#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_apps() {

    brew_install_with_confirmation "Android File Transfer" "android-file-transfer" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Android Platform Tools" "android-platform-tools" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "apktool" "apktool"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "AppCleaner" "appcleaner" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Arc" "arc" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Arduino IDE" "arduino-ide" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "bat" "bat"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Brave Browser" "brave-browser" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Calibre" "calibre" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Cheatsheet" "cheatsheet" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Chrome" "google-chrome" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Chrome Canary" "google-chrome-canary" "homebrew/cask-versions" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Discord" "discord" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Disk Inventory X is no longer supported and maintained.
    # Look at grandperspective as an alternative
    #brew_install_with_confirmation "GrandPerspective" "grandperspective" "homebrew/cask" "cask"
    # https://github.com/alinradut/Disk-Inventory-X
    # https://grandperspectiv.sourceforge.net/
    brew_install_with_confirmation "Disk Inventory X" "disk-inventory-x" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "DisplayLink USB Graphics Software" "displaylink" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "direnv" "direnv"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "dive (Docker Image Explorer)" "dive"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Docker for Mac" "docker" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Dolphin Beta (GameCube Emulator)" "dolphin-beta" "homebrew/cask-versions" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Dropbox" "dropbox" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Microsoft Edge" "microsoft-edge" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Microsoft Office" "microsoft-office" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "FFmpeg" "ffmpeg"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Firefox" "firefox" "homebrew/cask" "cask"
    brew_install_with_confirmation "Firefox Developer" "firefox-developer-edition" "homebrew/cask-versions" "cask"
    brew_install_with_confirmation "Firefox Nightly" "firefox-nightly" "homebrew/cask-versions" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # zoxide is optionally dependent on fzf
    brew_install_with_confirmation "fzf" "fzf"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ScanSnap Home" "fujitsu-scansnap-home" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Gas Mask" "gas-mask" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "GIMP" "gimp" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Gifox" "gifox" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Git" "git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Git Large File Storage" "git-lfs"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Handbrake" "handbrake" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "htop" "htop"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ImageMagick" "imagemagick"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ImageOptim" "imageoptim" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # brew_install_with_confirmation "Keybase" "keybase" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Jetbrains Toolbox" "jetbrains-toolbox" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "jq" "jq"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Lens (Kubernetes IDE)" "lens" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "NordVPN" "nordvpn" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Notion" "notion" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "PDF Expert" "pdf-expert" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Postman" "postman" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Raycast" "raycast" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Responsively" "responsively˚" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Retina Display Menu" "avibrazil-rdm" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ripgrep" "ripgrep"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "sabnzbd" "sabnzbd" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # `Safari Technology Preview` requires macOS X 10.11.4 or later
    # https://github.com/alrra/dotfiles/issues/26

    if is_supported_version "$(get_os_version)" "10.11.4"; then
        brew_install_with_confirmation "Safari Technology Preview" "safari-technology-preview" "homebrew/cask-versions" "cask"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # https://github.com/Genymobile/scrcpy
    # https://developer.android.com/studio/command-line/adb.html#wireless
    brew_install_with_confirmation "scrcpy" "scrcpy"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ShellCheck" "shellcheck"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "SideQuest" "sidequest" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Snagit" "snagit" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Spotify" "spotify" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Squidman" "squidman" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # https://github.com/Homebrew/homebrew-core/issues/50444
    # https://github.com/ikuwow/homebrew-ikuwow-sshrc
    # https://github.com/ikuwow/sshrc
    brew_install_with_confirmation "sshrc" "ikuwow/ikuwow-sshrc/sshrc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Re-assess later
    #brew_install_with_confirmation "TeamViewer" "teamviewer" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "tmux" "tmux"
    brew_install_with_confirmation "tmux (pasteboard)" "reattach-to-user-namespace"
    brew_install_with_confirmation "tmuxinator" "tmuxinator"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Tor Browser" "tor-browser" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "tree" "tree"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Transmission" "transmission" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Tunnelblick" "tunnelblick" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Unarchiver" "the-unarchiver" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "UTM - Virtual machines UI using QEMU" "utm" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # https://github.com/Homebrew/homebrew-core/blob/master/Formula/vim.rb
    brew_install_with_confirmation "Vim" "vim"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "VR Virtual Desktop Streamer" "virtual-desktop-streamer" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "VLC" "vlc" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "VS Code" "visual-studio-code" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "vysor.io" "vysor" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "bramstein/webfonttools"
    brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "bramstein/webfonttools"
    brew_install_with_confirmation "Web Font Tools: WOFF2" "woff2" "bramstein/webfonttools"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Wireshark" "wireshark" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "WhatsApp - Native desktop client for WhatsApp" "whatsapp" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # xtrafinder seems to be have removed from cask. Have to install manually via https://www.trankynam.com/xtrafinder/
    # brew_install_with_confirmation "XtraFinder" "xtrafinder" "homebrew/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "yarn" "yarn"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "yt-dlp" "yt-dlp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Zopfli" "zopfli"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "zoxide" "zoxide"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "4K Video Downloader" "4k-video-downloader" "homebrew/cask" "cask"

}

main() {

    print_in_purple "\n Applications\n\n"

    install_apps

    printf "\n"

}

main
