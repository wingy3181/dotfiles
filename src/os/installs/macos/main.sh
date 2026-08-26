#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh" \
    && . "../../profiles.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    dotfiles_parse_profile_arguments "$@" || exit 1

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

    # Preserve the original workstation installation path.
    if dotfiles_profile_is_enabled "workstation"; then
        ./xcode.sh
        ./rosetta_2.sh
        ./homebrew.sh
        . "./homebrew.sh" && add_homebrew_to_path
        ./../bash.sh

        ./git.sh

        ./../nvm.sh
        ./../npm.sh
        ./../tmux.sh
        ./personal.sh

        ./core_tools.sh
        ./ai_tools.sh
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
        ./misc_tools.sh
        ./music.sh
        ./networking_tools.sh
        ./office_tools.sh
        ./remote_access_tools.sh
        ./system_utilities.sh
        ./video_tools.sh
        ./virtualisation_tools.sh

        if dotfiles_profile_is_enabled "document-tools"; then
            ./document_tools.sh
        fi

        return
    fi

    # Minimal common installation path for dedicated hosts and capabilities.
    ./xcode.sh --command-line-tools-only
    ./homebrew.sh
    . "./homebrew.sh" && add_homebrew_to_path
    ./../bash.sh
    ./git.sh
    ./base_tools.sh

    if dotfiles_profile_is_enabled "personal"; then
        ./personal.sh
    fi

    if dotfiles_profile_is_enabled "agent-host"; then
        ./agent_host.sh
    fi

    if dotfiles_profile_is_enabled "node-dev"; then
        ./../nvm.sh
        ./../npm.sh
        ./node_tools.sh
    fi

    if dotfiles_profile_is_enabled "ios-dev"; then
        ./xcode.sh
        ./rosetta_2.sh
        brew_install "CocoaPods" "cocoapods"
        brew_install "Watchman" "watchman"
    fi

    if dotfiles_profile_is_enabled "document-tools"; then
        ./document_tools.sh
    fi

}

# Pass '-y' to script to skip questions
main "$@"
