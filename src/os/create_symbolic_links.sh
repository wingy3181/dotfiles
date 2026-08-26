#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && . "profiles.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/bash_aliases"
        "shell/bash_autocomplete"
        "shell/bash_bash-it"
        "shell/bash_direnv"
        "shell/bash_exports"
        "shell/bash_functions"
        "shell/bash_init"
        "shell/bash_logout"
        "shell/bash_mise"
        "shell/bash_nvm"
        "shell/bash_options"
        "shell/bash_profile"
        "shell/bash_prompt"
        "shell/bash_zoxide"
        "shell/bashrc"
        "shell/curlrc"
        "shell/inputrc"
        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"
        "git/git_commit_message_template"
    )

    if dotfiles_profile_is_enabled "personal"; then
        FILES_TO_SYMLINK+=(
            "vim/vim"
            "vim/vimrc"
        )
    fi

    if dotfiles_profile_is_enabled "workstation"; then
        FILES_TO_SYMLINK+=(
            "shell/screenrc"

            "npm/npmrc"
            "pnpm/config.yaml"
            "bun/bunfig.toml"

            "tmux/tmux.conf"

            "sshrc/sshrc"

            "other/czrc"
            "other/cz-config.js"
            "other/ideavimrc"
        )
    fi

    if dotfiles_profile_is_enabled "agent-host" \
        && ! dotfiles_profile_is_enabled "workstation"; then
        FILES_TO_SYMLINK+=("tmux/tmux.conf")
    fi

    if dotfiles_profile_is_enabled "node-dev" \
        && ! dotfiles_profile_is_enabled "workstation"; then
        FILES_TO_SYMLINK+=(
            "npm/npmrc"
            "pnpm/config.yaml"
            "bun/bunfig.toml"
        )
    fi

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        # sed 'substitute' command (See http://www.grymoire.com/Unix/Sed.html#uh-1)
        # using regex '.*\/\(.*\)' and replacing topic folder with its contents
        # For example, 'shell/bash_aliases' to 'bash_aliases'
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/[^\/]*\/\(.*\)/\1/g")"

        if [ "$i" == "pnpm/config.yaml" ]; then
            targetFile="$HOME/Library/Preferences/pnpm/config.yaml"
        fi

        targetFolder="$(printf "%s" "$targetFile" | sed "s|/[^/]*$||")"

        if [ "$(readlink "$targetFile")" == "$sourceFile" ]; then

            print_success "$targetFile → $sourceFile"

        elif [ ! -e "$targetFile" ] || $skipQuestions; then # -e : True if file exists (regardless of type).

            if [ "$targetFolder" != "$HOME" ]; then
              mkdir -p "$targetFolder"
            fi

            execute_without_spinner \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"
                # ln : make links between files
                # -f : force = remove existing destination files
                # -s : symbolic =make symbolic links instead of hard links (see https://www.youtube.com/watch?v=aO0OkNxDJ3c)

        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    if [ "$targetFolder" != "$HOME" ]; then
                      mkdir -p "$targetFolder"
                    fi

                    execute_without_spinner \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    dotfiles_parse_profile_arguments "$@" || exit 1

    print_in_purple "\n\n * Create symbolic links\n\n"

    create_symlinks "$@"

}

# Pass '-y' to script to skip questions
main "$@"
