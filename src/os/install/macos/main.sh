#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # http://stackoverflow.com/questions/3236871/how-to-return-a-string-value-from-a-bash-function
    # - All variables declared inside a function will be shared with the calling environment.
    # - All variables declared local will not be shared.
    # shellcheck disable=SC2034
    if $skipQuestions; then
        export previousInstallApplicationConfirmationReply="a"
    else
        export previousInstallApplicationConfirmationReply=""
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./xcode.sh
    ./homebrew.sh
    ./bash.sh
    ./apps.sh

}

# Pass '-y' to script to skip questions
main "$@"
