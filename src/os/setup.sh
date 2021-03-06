#!/usr/bin/env bash

# ----------------------------------------------------------------------
# | Declare read-only variables/constants                              |
# ----------------------------------------------------------------------

declare -r GITHUB_REPOSITORY="wingy3181/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/master"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/src/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ----------------------------------------------------------------------
# | Declare variables                                                  |
# ----------------------------------------------------------------------
declare dotfilesDirectory="$HOME/.dotfiles"
declare skipQuestions=false

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

download() {
    # $1 : url to download
    # $2 : file location to download to
    local url="$1"
    local output="$2"

    # Try using curl first if it exists
    if command -v "curl" &> /dev/null; then

        curl -LsSo "$output" "$url" &> /dev/null
        #     │││└─ write output to file
        #     ││└─ show error messages
        #     │└─ don't show the progress meter
        #     └─ follow redirects

        return $? # exit status of curl

    # Otherwise try use wget if it exists
    elif command -v "wget" &> /dev/null; then

        wget -qO "$output" "$url" &> /dev/null
        #     │└─ write output to file
        #     └─ don't show output

        return $? # exit status of wget
    fi

    return 1

}

download_dotfiles() {

    print_info "Download and extract archive"

    local tmpFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_TARBALL_URL" "$tmpFile"
    print_result $? "Download archive" "true"
    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! $skipQuestions; then

        ask_for_confirmation "Do you want to store the dotfiles in '$dotfilesDirectory'?"

        if ! answer_is_yes; then
            dotfilesDirectory=""
            while [ -z "$dotfilesDirectory" ]; do # -z : True if the length of string is zero.
                ask "Please specify another location for the dotfiles (path): "
                dotfilesDirectory="$(get_answer)"
            done
        fi

        # Ensure the `dotfiles` directory is available

        while [ -e "$dotfilesDirectory" ]; do # -e : True if file exists (regardless of type).
            ask_for_confirmation "'$dotfilesDirectory' already exists, do you want to overwrite it?"
            if answer_is_yes; then
                rm -rf "$dotfilesDirectory"
                break
            else
                dotfilesDirectory=""
                while [ -z "$dotfilesDirectory" ]; do # -z : True if the length of string is zero.
                    ask "Please specify another location for the dotfiles (path): "
                    dotfilesDirectory="$(get_answer)"
                done
            fi
        done

        printf "\n"

    else

        rm -rf "$dotfilesDirectory" &> /dev/null

    fi

    mkdir -p "$dotfilesDirectory"
    print_result $? "Create '$dotfilesDirectory'" "true"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Extract archive in the `dotfiles` directory

    extract "$tmpFile" "$dotfilesDirectory"
    print_result $? "Extract archive" "true"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Remove archive

    rm -rf "$tmpFile"
    print_result $? "Remove archive"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    cd "$dotfilesDirectory/src/os" \
        || return 1

}

download_utils() {

    local tmpFile=""

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0

   return 1

}

extract() {

    local archive="$1"
    local outputDir="$2"

    if command -v "tar" &> /dev/null; then
        tar -zxf "$archive" --strip-components 1 -C "$outputDir"
        #    │││                  │            │  └─ change to directory (i.e. $outputDir)
        #    │││                  │            └─ number of leading components from file names to strip
        #    │││                  └─ strip NUMBER leading components from file names on extraction.
        #    │││                     That is, the root folder
        #    ││└─ use archive file (i.e. $archive)
        #    │└─ extract files from an archive
        #    └─ filter the archive through gzip
        # See http://linux.die.net/man/1/tar
        return $?
    fi

    return 1

}

verify_os() {

    declare -r MINIMUM_MACOS_VERSION="10.10"

    local os_name=""
    local os_version=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if the OS is `macOS` and
    # it's above the required version

    os_name="$(uname -s)"

    if [ "$os_name" == "Darwin" ]; then

        os_version="$(sw_vers -productVersion)"

        if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
            return 0
        else
            printf "Sorry, this script is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
        fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    else
        printf "Sorry, this script is intended only for macOS!"
    fi

    return 1

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    # Ensure that the following actions
    # are made relative to this file's path

    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Load utils

    if [ -x "utils.sh" ]; then # -x = True if file exists and is executable
        . "utils.sh" || exit 1
    else
        download_utils || exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Ensure the OS is supported and
    # it's above the required version

    verify_os \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_for_sudo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if this script was run directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.

    printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
        || download_dotfiles

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "Create directories"

    if ! $skipQuestions; then
        ask_for_confirmation "Do you want the additional directories to be created?"
        printf "\n"
    fi

    if $skipQuestions || answer_is_yes; then
        ./create_directories.sh
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "Create symbolic links"

    if ! $skipQuestions; then
        ./create_symbolic_links.sh
    else
        ./create_symbolic_links.sh -y
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "Create local config files"

    if ! $skipQuestions; then
        ask_for_confirmation "Do you want local config files for bash, git and vim to be created?"
        printf "\n"
    fi

    if $skipQuestions || answer_is_yes; then
        ./create_local_config_files.sh
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "Install applications"

    if ! $skipQuestions; then
        ask_for_confirmation "Do you want to install the applications/command line tools?"
        printf "\n"
    fi

    if $skipQuestions; then
        ./install/setup.sh -y
    elif answer_is_yes; then
        ./install/setup.sh
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "Set preferences"

    if ! $skipQuestions; then
        ask_for_confirmation "Do you want to set the custom preferences?"
        printf "\n"
    fi

    if $skipQuestions; then
        ./preferences/setup.sh -y
    elif answer_is_yes; then
        ./preferences/setup.sh
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if cmd_exists "git"; then

        if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then
            print_info "Initialize Git repository"
            ./initialize_git_repository.sh "$DOTFILES_ORIGIN"
        fi

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        if ! $skipQuestions; then

            print_info "Update content"

            ask_for_confirmation "Do you want to update the content from the 'dotfiles' directory?"
            printf "\n"

            if answer_is_yes; then
                ./update_content.sh
            fi

        fi

    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "Optional items & reminders"

    print_optional_info "Add favourite locations (home & Development) to Finder sidebar"
    print_optional_info "Install Beyond Compare"
    print_optional_info "Install Blackvue Viewer for Mac (https://www.blackvue.com/download/blackvue-mac-viewer-cloud/)"
    print_optional_info "Install DataGrip (JetBrains)"
    print_optional_info "Install DeskDock Server (https://fdmobileinventions.blogspot.com/p/deskdock-server.html)"
    print_optional_info "Install DisplayLink Software for dynadock (https://www.displaylink.com/downloads/macos)"
    print_optional_info "Install Evernote"
    print_optional_info "Install Keybase"
    print_optional_info "Install Ledger Live (https://www.ledger.com/pages/ledger-live or 'brew cask install ledger-live')"
    print_optional_info "Install LibreOffice or Microsoft Office"
    print_optional_info "Install Bandwidth+ from App Store (https://itunes.apple.com/au/app/bandwidth/id490461369?mt=12)"
    print_optional_info "Install Helium by Jaden Geller from App Store (https://itunes.apple.com/us/app/helium/id1054607607?ls=1&mt=12)"
    print_optional_info "Install Magnet from App Store (https://itunes.apple.com/au/app/magnet/id441258766?mt=12)"
    print_optional_info "Install Microsoft Remote Desktop from App Store (https://itunes.apple.com/au/app/microsoft-remote-desktop-10/id1295203466?mt=12)"
    print_optional_info "Install PDF Reader Pro - Lite Edition from App Store (https://itunes.apple.com/au/app/pdf-reader-pro-lite-edition/id919472673?mt=12)"
    print_optional_info "Install pygments: 'sudo easy_install -U Pygments'"
    print_optional_info "Install ScanSnap software for Fujitsu s1300i (http://scansnap.fujitsu.com/global/dl/ and http://scansnap.fujitsu.com/global/dl/mac-1014-s1300i.html)"
    print_optional_info "Install Sketch"
    print_optional_info "Install Soda Player (https://www.sodaplayer.com/)"
    print_optional_info "Install Synergy"
    print_optional_info "Install Java 7, 11 from Oracle (https://www.oracle.com/downloads/ and https://www.oracle.com/technetwork/java/javase/downloads/index.html)"
    print_optional_info "Install XtraFinder (http://www.trankynam.com/xtrafinder/)"
    print_optional_info "Install Office 365 (https://www.office.com/)"
    print_optional_info "Install npm package 'browser-sync' globally (try to avoid and use local project version)"
    print_optional_info "Install npm package 'http-server' globally (try to avoid and use local project version)"
    print_optional_info "Install npm package 'livereload' globally (try to avoid and use local project version)"
    print_optional_info "Install npm package 'localtunnel' globally (try to avoid and use local project version)"
    print_optional_info "Install npm package 'npm-check' globally (try to avoid and use local project version)"
    print_optional_info "Symlink ebook folder ('ln -s ~/Dropbox/Documents/ebook/ ~/Documents/ebook')"
    print_optional_info "Set minimalist menu bar with Bartender 2"
    print_optional_info "Set dotfiles/src/bin to PATH in .bash.local"
    # PATH="/usr/local/bin:/Users/wingy3181/.dotfiles/src/bin:$PATH"
    # export PATH
    print_optional_info "Set wallpaper" # http://osxdaily.com/2015/08/28/set-wallpaper-command-line-macosx/
    print_optional_info "Set user profile picture"
    print_optional_info "Set GPG key used for Keybase and GPG suite"
    print_optional_info "Set Jetbrains IDE settings via IDE Settings Sync and Jetbrains account (https://plugins.jetbrains.com/plugin/9922-ide-settings-sync and https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync)"
    print_optional_info "Set VS Code settings via Settings Sync (https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync and https://gist.github.com/wingy3181/e7b8fde022a14cff76a96b4a1a98ad7f)"

    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    if ! $skipQuestions; then

        print_info "Restart"

        ask_for_confirmation "Do you want to restart?"
        printf "\n"

        if answer_is_yes; then
            ./restart.sh
        fi

    fi

}

# Pass '-y' to script to skip questions
main "$@"
