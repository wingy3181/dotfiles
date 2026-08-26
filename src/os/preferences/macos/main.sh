#!/usr/bin/env bash

# See https://github.com/herrbischoff/awesome-osx-command-line for more options

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./init.sh
    if $skipQuestions; then
        ./personal.sh -y
    else
        ./personal.sh
    fi
    ./firefox.sh
    ./maps.sh
    ./photos.sh
    ./safari.sh
    ./transmission.sh
    #./xtrafinder.sh

}

# Pass '-y' to script to skip questions
main "$@"
