#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_warning "This may take awhile, so please be patient!\n"

    if $skipQuestions; then
        "./$(get_os)/main.sh" -y
    else
        "./$(get_os)/main.sh"
    fi

    ./bash-it.sh
    ./jenv.sh
    ./sdkman.sh
    ./node_versions.sh
    ./npm_packages.sh
    ./vim_plugins.sh
    ./tmux_plugins.sh

}

# Pass '-y' to script to skip questions
main "$@"
