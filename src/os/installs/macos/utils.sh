#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install() {

    declare -r FORMULA_READABLE_NAME="$1"
    declare -r FORMULA="$2"
    declare -r ARGUMENTS="$3"
    declare -r TAP_VALUE="$4"

    # If environment variable is set and readable name does not match regex, then exit and don't bother installation
    if [[ -n "$INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX" && ! "$FORMULA_READABLE_NAME" =~ $INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX ]]; then
        print_warning "$FORMULA_READABLE_NAME not installed as readable name did not match regex: \"$INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX\""
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Homebrew` is installed.

    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If `brew tap` needs to be executed,
    # check if it executed correctly.

    if [ -n "$TAP_VALUE" ]; then # -n : True if the length of string is nonzero.
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
            return 1
        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula.

    # shellcheck disable=SC2086
    if brew list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew install $FORMULA $ARGUMENTS" \
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

    if path="$(brew --prefix 2> /dev/null)"; then
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
        "Homebrew (update)"

}

brew_upgrade() {

    execute \
        "brew upgrade" \
        "Homebrew (upgrade)"

}

mas_install() {

    declare -r APP_STORE_READABLE_NAME="$1"
    declare -r APP_STORE_IDENTIFIER="$2"

    if [ "$CI" == "true" ]; then
        print_warning "$APP_STORE_READABLE_NAME not installed as CI is running and cannot support Mac App Store applications"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Mac App Store command line interface` is installed.

    if ! cmd_exists "mas"; then
        print_error "$APP_STORE_READABLE_NAME ('Mac App Store command line interface' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula.


    execute \
        "mas install $APP_STORE_IDENTIFIER" \
        "$APP_STORE_READABLE_NAME (https://apps.apple.com/au/app/id$APP_STORE_IDENTIFIER)"

}

mas_install_with_confirmation() {

    declare -r APP_STORE_READABLE_NAME="$1"
    declare -r APP_STORE_IDENTIFIER="$2"
    declare -r APP_STORE_NAME_WITH_LINK="$APP_STORE_READABLE_NAME (https://apps.apple.com/au/app/id$APP_STORE_IDENTIFIER)"

    # Install application if previous confirmation reply was 'install all'
    if [[ "$previousInstallApplicationConfirmationReply" =~ ^[aA]$ ]]; then
        mas_install "$@"
    # DON'T install application if previous confirmation reply was 'skip all'
    elif [[ "$previousInstallApplicationConfirmationReply" =~ ^[sS]$ ]]; then
        print_warning "$APP_STORE_NAME_WITH_LINK (not installed)"
    # Otherwise, prompt user and install application based on reply
    else
        local installApplicationConfirmationReply=""
        # Until a valid reply has been entered, keep prompting user
        while [[ -z "$installApplicationConfirmationReply" || "$installApplicationConfirmationReply" =~ ^[^yYnNaAsS]$ ]]; do
            ask_for_install_application_confirmation "Do you want to install $APP_STORE_NAME_WITH_LINK?"
            installApplicationConfirmationReply="$(get_answer)"
        done

        if answer_is_yes || answer_is_yes_to_all; then
            mas_install "$@"
        elif answer_is_no || answer_is_skip_all; then
            print_warning "$APP_STORE_NAME_WITH_LINK (not installed)"
        fi

        previousInstallApplicationConfirmationReply="$(get_answer)"
    fi

}
