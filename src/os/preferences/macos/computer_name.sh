#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

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

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_purple "\n  UI & UX\n\n"

    declare -r netBiosName=$(defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName 2> /dev/null)
    declare -r computerName=$(scutil --get ComputerName 2> /dev/null)
    declare -r hostName=$(scutil --get HostName 2> /dev/null)
    declare -r localHostName=$(scutil --get LocalHostName 2> /dev/null)

    print_in_yellow "\
      Current NetBIOS name:     $netBiosName\n\
      Current Computer name:    $computerName\n\
      Current Host name:        $hostName\n\
      Current Local Host name:  $localHostName\n\n"

    if ! $skipQuestions; then
        ask_for_confirmation "Do you want to set the computer name?"
    fi

    if $skipQuestions || answer_is_yes; then

        $skipQuestions && newComputerName="laptop" || newComputerName=""

        while [ -z "$newComputerName" ]; do # -z : True if the length of string is zero.

            ask "Please specify a computer name: "
            newComputerName="$(get_answer)"

        done

        # System Preferences -> Sharing -> Computer Name
        # http://osxdaily.com/2012/10/24/set-the-hostname-computer-name-and-bonjour-name-separately-in-os-x/
        execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string '$newComputerName' && \
                 sudo scutil --set ComputerName '$newComputerName' && \
                 sudo scutil --set HostName '$newComputerName' && \
                 sudo scutil --set LocalHostName '$newComputerName'" \
            "Set computer name to $newComputerName"

        printf "\n"

        killall "SystemUIServer" &> /dev/null

    fi
}

# Pass '-y' to script to skip questions
main "$@"
