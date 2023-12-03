#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_homebrew_to_path() {

    # Check if `brew` is available.

    if command -v brew &> /dev/null; then
        return
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If not, add it to the PATH.

    HARDWARE="$(uname -m)"
    prefix=""

    if [ "$HARDWARE" == "arm64" ]; then
        prefix="/opt/homebrew"
    elif [ "$HARDWARE" == "x86_64" ]; then
        prefix="/usr/local"
    else
        print_error "Homebrew is only supported on Intel and ARM processors!"
    fi

    #PATH="$prefix/bin:$PATH"
    eval "$($prefix/bin/brew shellenv)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Inform the user about the availability of `brew`.

    command -v brew &> /dev/null
    print_result $? "Add to PATH"
}

get_homebrew_git_config_file_path() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --repository 2> /dev/null)/.git/config"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Get Homebrew git config file path"
        return 1
    fi

}

install() {

    if ! cmd_exists "brew"; then
        ask_for_sudo
        printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    print_result $? "Install"

}

opt_out_of_analytics() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Try to get the path of the `Homebrew` git config file.

    path="$(get_homebrew_git_config_file_path)" \
        || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Opt-out of Homebrew's analytics.
    # https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out

    if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
        git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
        print_result $? "Opt-out of analytics"
    fi

}

update() {
    execute \
        "brew update" \
        "Update"
}

upgrade() {
    execute \
        "brew upgrade" \
        "Upgrade"
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Homebrew\n\n"

    install
    add_homebrew_to_path
    opt_out_of_analytics

    update
    upgrade

}

main
