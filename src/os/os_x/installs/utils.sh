#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install_with_confirmation() {

    declare -r FORMULA_READABLE_NAME="$1"
    
    # Install application if previous confirmation reply was 'install all'
    if [[ "$previousInstallApplicationConfirmationReply" =~ ^[aA]$ ]]; then
        brew_install "$@"
    # DON'T install application if previous confirmation reply was 'skip all'
    elif [[ "$previousInstallApplicationConfirmationReply" =~ ^[sS]$ ]]; then
        print_warning "$FORMULA_READABLE_NAME (not installed)"
    # Otherwise, prompt user and install application based on reply
    else
        local installApplicationConfirmationReply=""
        # Until a valid reply has been entered, keep prompting user
        while [[ -z "$installApplicationConfirmationReply" || "$installApplicationConfirmationReply" =~ ^[^yYnNaAsS]$ ]]; do
            ask_for_install_application_confirmation "Do you want to install $FORMULA_READABLE_NAME?"
            installApplicationConfirmationReply="$(get_answer)"
        done

        if answer_is_yes || answer_is_yes_to_all; then
            brew_install "$@"
        elif answer_is_no || answer_is_skip_all; then
            print_warning "$FORMULA_READABLE_NAME (not installed)"
        fi

        previousInstallApplicationConfirmationReply="$(get_answer)"
    fi

}

brew_install() {

    declare -r FORMULA_READABLE_NAME="$1"
    declare -r FORMULA="$2"
    declare -r TAP_VALUE="$3"
    declare -r CMD="$4"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Homebrew` is installed

    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('brew' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If `brew tap` needs to be executed, check if it executed correctly

    if [ -n "$TAP_VALUE" ]; then # -n : True if the length of string is nonzero.
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
            return 1
        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula

    if brew "$CMD" list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA" \
            "$FORMULA_READABLE_NAME"
    fi

}

brew_tap() {
    brew tap "$1" &> /dev/null
}
