#!/usr/bin/env bash

answer_is_no() {
    # $REPLY is default variable assigned to after a 'read' command (See http://ss64.com/bash/read.html)
    # check $REPLY content against regular expression of a single character 'y' or 'Y' (starting and ending with)
    # See http://stackoverflow.com/questions/19441521/bash-regex-operator
    # and http://www.gnu.org/software/bash/manual/bashref.html#Conditional-Constructs
    [[ "$REPLY" =~ ^[Nn]$ ]] \
        && return 0 \
        || return 1

}

answer_is_skip_all() {
    # $REPLY is default variable assigned to after a 'read' command (See http://ss64.com/bash/read.html)
    # check $REPLY content against regular expression of a single character 'y' or 'Y' (starting and ending with)
    # See http://stackoverflow.com/questions/19441521/bash-regex-operator
    # and http://www.gnu.org/software/bash/manual/bashref.html#Conditional-Constructs
    [[ "$REPLY" =~ ^[Ss]$ ]] \
        && return 0 \
        || return 1

}

answer_is_yes() {
    # $REPLY is default variable assigned to after a 'read' command (See http://ss64.com/bash/read.html)
    # check $REPLY content against regular expression of a single character 'y' or 'Y' (starting and ending with)
    # See http://stackoverflow.com/questions/19441521/bash-regex-operator
    # and http://www.gnu.org/software/bash/manual/bashref.html#Conditional-Constructs
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1

}

answer_is_yes_to_all() {
    # $REPLY is default variable assigned to after a 'read' command (See http://ss64.com/bash/read.html)
    # check $REPLY content against regular expression of a single character 'y' or 'Y' (starting and ending with)
    # See http://stackoverflow.com/questions/19441521/bash-regex-operator
    # and http://www.gnu.org/software/bash/manual/bashref.html#Conditional-Constructs
    [[ "$REPLY" =~ ^[Aa]$ ]] \
        && return 0 \
        || return 1

}

ask() {
    # $1 : question text
    print_question "$1"
    read -r
}

ask_for_confirmation() {
    # $1 : confirmation text
    print_question "$1 (y/n) "
    read -r -n 1 # See http://ss64.com/bash/read.html
    #     |  └─ read returns after reading 'n' rather than waiting for a complete line of input
    #     └──── To not treat backslash as an escape character
    printf "\n"
}

ask_for_install_application_confirmation() {
    # $1 : install application confirmation text
    print_question "$1 (y)es / (n)o / install (a)ll / (s)kip all? "
    read -r -n 1 # See http://ss64.com/bash/read.html
    #     |  └─ read returns after reading 'n' rather than waiting for a complete line of input
    #     └──── To not treat backslash as an escape character
    printf "\n"
}

ask_for_sudo() {

    # Ask for the administrator password upfront
    sudo -v &> /dev/null

    # Update existing `sudo` time stamp until this script has finished
    # https://gist.github.com/cowboy/3118588
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    #      |            |           |            |           |            |       └─ execute this command in the background in a sub-shell
    #      |            |           |            |           |            └─ suppress any error from stderr
    #      |            |           |            |           └─ If script has already finished, exit loop
    #      │            │           │            └─ Send `success`(0) signal to current script process ($$ = current script process id)
    #      │            │           └─ Sleep 60 seconds
    #      │            └─ Update `sudo` time stamp in non-interactive mode
    #      └─ Loop indefinitely

}

cmd_exists() {
    # $1 : command
    command -v "$1" &> /dev/null
}

kill_all_subprocesses() {

    local i=""

    for i in $(jobs -p); do
        kill "$i"
        wait "$i" &> /dev/null
    done

}

execute() {

    local -r CMDS="$1"
    # See http://unix.stackexchange.com/questions/122845/using-a-b-for-variable-assignment-in-scripts
    # ${parameter:-word}
    #   If parameter is unset or null, the expansion of word is substituted.
    #   Otherwise, the value of parameter is substituted.
    local -r MSG="${2:-$1}"
    local -r TMP_FILE="$(mktemp /tmp/XXXXX)"

    local exitCode=0
    local cmdsPID=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If the current process is ended,
    # also end all its subprocesses

    set_trap "EXIT" "kill_all_subprocesses"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Execute commands in background
    # http://ss64.com/bash/eval.html
    # The arguments are concatenated together into a single command, which is then read and executed,
    # and its exit status returned as the exit status of eval. If there are no arguments or only empty
    # arguments, the return status is zero.
    if [[ $DOTFILES_DEBUG_MODE = "true" ]]; then
        eval "$CMDS" &
    else
        # shellcheck disable=SC2261
        eval "$CMDS" \
            &> /dev/null \
            2> "$TMP_FILE" &
    fi

    cmdsPID=$!

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Show a spinner if the commands
    # require more time to complete

    show_spinner "$cmdsPID" "$CMDS" "$MSG"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait for the commands to no longer be executing
    # in the background, and then get their exit code

    wait "$cmdsPID" &> /dev/null
    exitCode=$?

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Print output based on what happened

    print_result $exitCode "$MSG"

    if [ $exitCode -ne 0 ]; then
        print_error_stream < "$TMP_FILE"
    fi

    rm -rf "$TMP_FILE"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    return $exitCode

}

execute_without_spinner() {

    local tmpFile="$(mktemp /tmp/XXXXX)"
    local exitCode=0

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Execute commands in background
    # http://ss64.com/bash/eval.html
    # The arguments are concatenated together into a single command, which is then read and executed,
    # and its exit status returned as the exit status of eval. If there are no arguments or only empty
    # arguments, the return status is zero.
    if [[ $DOTFILES_DEBUG_MODE = "true" ]]; then
        eval "$1"
    else
        # shellcheck disable=SC2261
        eval "$1" \
            &> /dev/null \
            2> "$tmpFile"
    fi

    print_result $? "${2:-$1}"
    # See http://unix.stackexchange.com/questions/122845/using-a-b-for-variable-assignment-in-scripts
    # ${parameter:-word}
    #   If parameter is unset or null, the expansion of word is substituted.
    #   Otherwise, the value of parameter is substituted.
    exitCode=$?

    if [ $exitCode -ne 0 ]; then
        print_error_stream "↳ ERROR:" < "$tmpFile"
    fi

    rm -rf "$tmpFile"

    return $exitCode

}

get_answer() {
    # $REPLY is default variable assigned to after a 'read' command (See http://ss64.com/bash/read.html)
    printf "%s" "$REPLY"
}

get_os() {

    local os=""
    local kernelName=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    kernelName="$(uname -s)"

    if [ "$kernelName" == "Darwin" ]; then
        os="macos"
    elif [ "$kernelName" == "Linux" ] && [ -e "/etc/lsb-release" ]; then
        os="ubuntu"
    else
        os="$kernelName"
    fi

    printf "%s" "$os"

}

get_os_version() {

    local os=""
    local version=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    os="$(get_os)"

    if [ "$os" == "macos" ]; then
        version="$(sw_vers -productVersion)"
    elif [ "$os" == "ubuntu" ]; then
        version="$(lsb_release -d | cut -f2 | cut -d' ' -f2)"
    fi

    printf "%s" "$version"

}

is_git_repository() {
    git rev-parse &> /dev/null
}

is_supported_version() {
    # Convert version number parts into array of parts by finding '.' and replacing with ' '
    declare -a actual_version=("${1//./ }")
    declare -a minimum_version=("${2//./ }")
    local i=""

    # Fill empty positions in actual_version with zeros. Note: ${#array[@]} returns the length of the array
    for (( i=${#actual_version[@]}; i<${#minimum_version[@]}; i++ )); do
        actual_version[i]=0
    done

    for (( i=0; i<${#actual_version[@]}; i++ )); do

        # Fill empty positions in minimum_version with zeros
        if [[ -z ${minimum_version[i]} ]]; then
            minimum_version[i]=0
        fi

        # Treat version part as a decimal (base 10) number.
        # actual version part is less than minimum_version part required, so return error return codeß
        if (( 10#${actual_version[i]} < 10#${minimum_version[i]} )); then
            return 1
        elif (( 10#${actual_version[i]} > 10#${minimum_version[i]} )); then
            return 0
        fi

    done

}

mkd() {
    if [ -n "$1" ]; then # -n : True if the length of string is nonzero. (man test)
        if [ -e "$1" ]; then # -e : True if file exists (regardless of type). (man test)
            if [ ! -d "$1" ]; then # -d : True if file exists and is a directory. (man test)
                print_error "$1 - a file with the same name already exists!"
            else
                print_success "$1"
            fi
        else
            execute_without_spinner "mkdir -p $1" "$1"
            #               └── Create intermediate directories as required.
            #                   If this option is not specified, the full path
            #                   prefix of each operand must already exist.
        fi
    fi
}

print_error() {
    # $1 : error text
    # $2 : more error text (don't see it ever being called with a second argument)
    print_in_red "  [✖] $1 $2\n"
}

print_error_stream() {
    # $1 : error prefix before each line of text
    # $2 : line of text from error output of command (called from 'execute' function)
    while read -r line; do
        print_error "↳ ERROR: $line"
    done
}

print_in_green() {
    # $1 : print text
    printf "\e[0;32m%b\e[0m" "$1"
    #       |  | | ||   └── \e[0m : Return to plain normal mode
    #       |  | | |└────── %b : Characters from the string argument are printed until the end is reached
    #       |  | | |             and intepret character escapes in backslash notation (see 'man printf')
    #       |  | | └─────── m : Terminate escape sequence
    #       |  | └───────── 32 : Foreground colour green (see table in link given below)
    #       |  └─────────── 0 : Normal text
    #       └────────────── \e[ : Begin escape sequence
    # See http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html for more info
    # or see mathiasbynens dotfiles (.bash_prompt) on how he uses tput
}

print_in_purple() {
    # $1 : print text
    printf "\e[0;35m%b\e[0m" "$1"
    #       |  | | ||   └── \e[0m : Return to plain normal mode
    #       |  | | |└────── %b : Characters from the string argument are printed until the end is reached
    #       |  | | |             and intepret character escapes in backslash notation (see 'man printf')
    #       |  | | └─────── m : Terminate escape sequence
    #       |  | └───────── 35 : Foreground colour magenta (see table in link given below)
    #       |  └─────────── 0 : Normal text
    #       └────────────── \e[ : Begin escape sequence
    # See http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html for more info
    # or see mathiasbynens dotfiles (.bash_prompt) on how he uses tput
}

print_in_cyan_bold() {
    # $1 : print text
    printf "\e[1;36m%b\e[0m" "$1"
    #       |  | | ||   └── \e[0m : Return to plain normal mode
    #       |  | | |└────── %b : Characters from the string argument are printed until the end is reached
    #       |  | | |             and intepret character escapes in backslash notation (see 'man printf')
    #       |  | | └─────── m : Terminate escape sequence
    #       |  | └───────── 36 : Foreground colour cyan (see table in link given below)
    #       |  └─────────── 1 : Bold text
    #       └────────────── \e[ : Begin escape sequence
    # See http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html for more info
    # or see mathiasbynens dotfiles (.bash_prompt) on how he uses tput
}

print_in_red() {
    # $1 : print text
    printf "\e[0;31m%b\e[0m" "$1"
    #       |  | | ||   └── \e[0m : Return to plain normal mode
    #       |  | | |└────── %b : Characters from the string argument are printed until the end is reached
    #       |  | | |             and intepret character escapes in backslash notation (see 'man printf')
    #       |  | | └─────── m : Terminate escape sequence
    #       |  | └───────── 31 : Foreground colour red (see table in link given below)
    #       |  └─────────── 0 : Normal text
    #       └────────────── \e[ : Begin escape sequence
    # See http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html for more info
    # or see mathiasbynens dotfiles (.bash_prompt) on how he uses tput
}

print_in_yellow() {
    # $1 : print text
    printf "\e[0;33m%b\e[0m" "$1"
    #       |  | | ||   └── \e[0m : Return to plain normal mode
    #       |  | | |└────── %b : Characters from the string argument are printed until the end is reached
    #       |  | | |             and intepret character escapes in backslash notation (see 'man printf')
    #       |  | | └─────── m : Terminate escape sequence
    #       |  | └───────── 33 : Foreground colour yellow (see table in link given below)
    #       |  └─────────── 0 : Normal text
    #       └────────────── \e[ : Begin escape sequence
    # See http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html for more info
    # or see mathiasbynens dotfiles (.bash_prompt) on how he uses tput
}

print_info() {
    # $1 : info text
    print_in_purple "\n $1\n\n"
}

print_optional_info() {
    # $1 : optional info text
    print_in_cyan_bold "  [ ] $1\n"
}

print_question() {
    # $1 : question text
    print_in_yellow "  [?] $1"
}

print_result() {
    # $1 : result code
    # $2 : result message
    if [ "$1" -eq 0 ]; then
        print_success "$2"
    else
        print_error "$2"
    fi

    return "$1"

}

print_success() {
    # $1 : success text
    print_in_green "  [✔] $1\n"
}

print_warning() {
    # $1 : warning text
    print_in_yellow "  [!] $1\n"
}

set_trap() {

    trap -p "$1" | grep "$2" &> /dev/null \
        || trap '$2' "$1"

}

skip_questions() {

     while :; do
        case $1 in
            -y|--yes) return 0;;
                   *) break;;
        esac
        shift 1
    done

    return 1

}

show_spinner() {

    local -r FRAMES='/-\|'

    # shellcheck disable=SC2034
    local -r NUMBER_OR_FRAMES=${#FRAMES}

    local -r CMDS="$2"
    local -r MSG="$3"
    local -r PID="$1"

    local frameText=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Note: In order for the Travis CI site to display
    # things correctly, it needs special treatment, hence,
    # the "is Travis CI?" checks.

    if [ "$TRAVIS" != "true" ]; then

        # Provide more space so that the text hopefully
        # doesn't reach the bottom line of the terminal window.
        #
        # This is a workaround for escape sequences not tracking
        # the buffer position (accounting for scrolling).
        #
        # See also: https://unix.stackexchange.com/a/278888

        printf "\n\n\n"
        tput cuu 3

        tput sc
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Display spinner while the commands are being executed

    while kill -0 "$PID" &>/dev/null; do

        frameText="  [${FRAMES:i++%NUMBER_OR_FRAMES:1}] $MSG"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Print frame text

        if [ "$TRAVIS" != "true" ]; then
            printf "%s\n" "$frameText"
        else
            printf "%s" "$frameText"
        fi

        sleep 0.2

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Clear frame text

        if [ "$TRAVIS" != "true" ]; then
            tput rc
        else
            printf "\r"
        fi

    done

}
