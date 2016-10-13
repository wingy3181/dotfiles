#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_cleanup() {

    # By default Homebrew does not uninstall older versions
    # of formulas so, in order to remove them, `brew cleanup`
    # needs to be used:
    #
    # https://github.com/Homebrew/brew/blob/496fff643f352b0943095e2b96dbc5e0f565db61/share/doc/homebrew/FAQ.md#how-do-i-uninstall-old-versions-of-a-formula

    execute \
        "brew cleanup" \
        "brew (cleanup)"

    execute \
        "brew cask cleanup" \
        "brew cask (cask cleanup)"

}

brew_install() {

    declare -r FORMULA_READABLE_NAME="$1"
    declare -r FORMULA="$2"
    declare -r TAP_VALUE="$3"
    declare -r CMD="$4"

    # If environment variable is set and readable name does not match regex, then exit and don't bother installation
    if [[ -n "$INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX" && ! "$FORMULA_READABLE_NAME" =~ $INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX ]]; then
        print_warning "$FORMULA_READABLE_NAME not installed as readable name did not match regex: \"$INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX\""
        return 1
    fi

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

    # shellcheck disable=SC2086
    if brew $CMD list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA" \
            "$FORMULA_READABLE_NAME"
    fi

}

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

brew_prefix() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    path="$(brew --prefix 2> /dev/null)"

    if [ $? -eq 0 ]; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get prefix)"
        return 1
    fi

}

brew_tap() {
    brew tap "$1" &> /dev/null
}

brew_update() {

    execute \
        "brew update" \
        "brew (update)"

}

brew_upgrade() {

    execute \
        "brew upgrade" \
        "brew (upgrade)"

}
