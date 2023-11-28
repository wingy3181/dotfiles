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

    ./git.sh

    ./../nvm.sh
    ./../npm.sh

    ./../bash-it.sh   #
    ./android_tools.sh
    ./browsers.sh
    ./capture_tools.sh
    ./cli_utilities.sh
    ./communication_tools.sh
    ./compression_tools.sh
    ./desktop_utilities.sh
    ./development_tools.sh
    ./downloaders.sh
    ./gaming.sh
    ./image_tools.sh
    ./../jenv.sh      #
    ./misc_tools.sh
    ./music.sh
    ./networking_tools.sh
    ./office_tools.sh
    ./remote_access_tools.sh

    ./../sdkman.sh    #
    ./system_tools.sh
    ./../tmux.sh
    ./video_tools.sh
    ./virtualisation_tools.sh
    ./../vim.sh

}

# Pass '-y' to script to skip questions
main "$@"
