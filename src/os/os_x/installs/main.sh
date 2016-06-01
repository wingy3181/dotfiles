#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../../utils.sh" \
    && source "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    while :; do
        case $1 in
            -y|--yes) skipQuestions=true; break;;
                   *) break;;
        esac
        shift 1
    done

    # http://stackoverflow.com/questions/3236871/how-to-return-a-string-value-from-a-bash-function
    # - All variables declared inside a function will be shared with the calling environment.
    # - All variables declared local will not be shared.
    # shellcheck disable=SC2034
    if $skipQuestions; then
        previousInstallApplicationConfirmationReply="a"
    else
        previousInstallApplicationConfirmationReply=""
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./install_xcode.sh

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./install_homebrew.sh
    ./update_and_upgrade.sh

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Bash" "bash"
    brew_install_with_confirmation "Bash Completion 2" "bash-completion2" "homebrew/versions"
    ./change_default_bash_version.sh

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Android File Transfer" "android-file-transfer" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "AppCleaner" "appcleaner" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Atom" "atom" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Cheatsheet" "cheatsheet" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Chrome" "google-chrome" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Chrome Canary" "google-chrome-canary" "caskroom/versions" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Chromium" "chromium" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Dropbox" "dropbox" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "FFmpeg" "ffmpeg"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Firefox" "firefox" "caskroom/cask" "cask"
    brew_install_with_confirmation "Firefox Developer" "firefoxdeveloperedition" "caskroom/versions" "cask"
    brew_install_with_confirmation "Firefox Nightly" "firefoxnightly" "caskroom/versions" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "GIMP" "lisanet-gimp" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Git" "git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "GnuPG" "gnugp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ImageAlpha" "imagealpha" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ImageMagick" "imagemagick --with-webp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ImageOptim" "imageoptim" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Intellij IDEA" "intellij-idea" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Java 7" "java7" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Java 8" "java" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "jEnv" "jenv" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "LICEcap" "licecap" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "LibreOffice" "libreoffice" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Opera" "opera" "caskroom/cask" "cask"
    brew_install_with_confirmation "Opera Beta" "opera-beta" "caskroom/versions" "cask"
    brew_install_with_confirmation "Opera Developer" "opera-developer" "caskroom/versions" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # `Safari Technology Preview` requires OS X 10.11.4 or later
    # https://github.com/alrra/dotfiles/issues/26

    if is_supported_version "$(get_os_version)" "10.11.4"; then
        brew_install_with_confirmation "Safari Technology Preview" "safari-technology-preview" "caskroom/versions" "cask"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "ShellCheck" "shellcheck"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Snagit" "snagit" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Spectacle" "spectacle" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Spotify" "spotify" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "TeamViewer" "teamviewer" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "tmux" "tmux"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "tree" "tree"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Transmission" "transmission" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Unarchiver" "the-unarchiver" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Vim" "vim --override-system-vi"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "VirtualBox" "virtualbox" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "VLC" "vlc" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "bramstein/webfonttools"
    brew_install_with_confirmation "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "bramstein/webfonttools"
    brew_install_with_confirmation "Web Font Tools: WOFF2" "woff2" "bramstein/webfonttools"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "WebStorm" "webstorm" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "WebKit" "webkit-nightly" "caskroom/versions" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "z" "z"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install_with_confirmation "Zopfli" "zopfli"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"

    ./cleanup.sh

}

# Pass '-y' to script to skip questions
main "$@"
