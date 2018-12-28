#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Alfred" "alfred" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Android File Transfer" "android-file-transfer" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "AppCleaner" "appcleaner" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Bartender 2" "bartender" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Cheatsheet" "cheatsheet" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Chrome" "google-chrome" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Chrome Canary" "google-chrome-canary" "caskroom/versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Disk Inventory X" "disk-inventory-x" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Docker for Mac" "docker" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Dropbox" "dropbox" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "FFmpeg" "ffmpeg"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Firefox" "firefox" "caskroom/cask" "cask"
brew_install_with_confirmation "Firefox Developer" "firefox-developer-edition" "caskroom/versions" "cask"
brew_install_with_confirmation "Firefox Nightly" "firefox-nightly" "caskroom/versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Gas Mask" "gas-mask" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "GIMP" "lisanet-gimp" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Git" "git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Git Large File Storage" "git-lfs"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "GPG Suite" "gpg-suite" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Handbrake" "handbrake" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Helium by Jaden Geller" "jadengeller-helium" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "htop" "htop"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "ImageAlpha" "imagealpha" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "ImageMagick" "imagemagick --with-webp"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "ImageOptim" "imageoptim" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Intellij IDEA" "intellij-idea" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "iTerm2" "iterm2" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# brew_install_with_confirmation "Keybase" "keybase" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Java 6" "java6" "caskroom/versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# java7 removed. See https://github.com/caskroom/homebrew-versions/pull/3914
# Alternative use zulu or install manually
#brew_install_with_confirmation "Java 7" "java7" "caskroom/versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Java 8" "java8" "caskroom/versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Java (latest - 10)" "java" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "jq" "jq"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "LICEcap" "licecap" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "NordVPN" "nordvpn" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "nvm-auto-switch" "https://raw.githubusercontent.com/lalitkapoor/nvm-auto-switch/master/homebrew/nvm-auto-switch.rb"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Opera" "opera" "caskroom/cask" "cask"
brew_install_with_confirmation "Opera Beta" "opera-beta" "caskroom/versions" "cask"
brew_install_with_confirmation "Opera Developer" "opera-developer" "caskroom/versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Postman" "postman" "caskroom/versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#https://github.com/sindresorhus/quick-look-plugins
brew_install_with_confirmation "Quick Look plugins" "qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Retina Display Menu" "avibrazil-rdm" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "sabnzbd" "sabnzbd" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# `Safari Technology Preview` requires macOS X 10.11.4 or later
# https://github.com/alrra/dotfiles/issues/26

if is_supported_version "$(get_os_version)" "10.11.4"; then
    brew_install_with_confirmation "Safari Technology Preview" "safari-technology-preview" "caskroom/versions" "cask"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "ShellCheck" "shellcheck"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Snagit" "snagit" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "socat" "socat"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Spectacle" "spectacle" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Spotify" "spotify" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Squidman" "squidman" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "sshrc" "sshrc"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "TeamViewer" "teamviewer" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "The Silver Searcher (ag)" "the_silver_searcher"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "tmux" "tmux"
brew_install_with_confirmation "tmux (pasteboard)" "reattach-to-user-namespace"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Tor Browser" "torbrowser" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "tree" "tree"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Transmission" "transmission" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Tunnelblick" "tunnelblick" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Unarchiver" "the-unarchiver" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://github.com/Homebrew/homebrew-core/blob/master/Formula/vim.rb
brew_install_with_confirmation "Vim" "vim --with-override-system-vi"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "VLC" "vlc" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "VS Code" "visual-studio-code" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "bramstein/webfonttools"
brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "bramstein/webfonttools"
brew_install_with_confirmation "Web Font Tools: WOFF2" "woff2" "bramstein/webfonttools"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "WebStorm" "webstorm" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# xtrafinder seems to be have removed from cask. Have to install manually via https://www.trankynam.com/xtrafinder/
# brew_install_with_confirmation "XtraFinder" "xtrafinder" "caskroom/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "yarn" "yarn"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "z" "z"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "Zopfli" "zopfli"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation "4K Video Downloader" "4k-video-downloader" "caskroom/cask" "cask"

