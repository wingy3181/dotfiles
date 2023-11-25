#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/bash_aliases"
        "shell/bash_autocomplete"
        "shell/bash_bash-it"
        "shell/bash_direnv"
        "shell/bash_exports"
        "shell/bash_functions"
        "shell/bash_logout"
        "shell/bash_nvm"
        "shell/bash_options"
        "shell/bash_profile"
        "shell/bash_prompt"
        "shell/bash_zoxide"
        "shell/bashrc"
        "shell/curlrc"
        "shell/inputrc"
        "shell/screenrc"

        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"
        "git/git_commit_message_template"

        "npm/npmrc"

        "nvm/nvm/default-packages"

        "vim/vim"
        "vim/vimrc"

        "tmux/tmux.conf"

        "sshrc/sshrc"

        "other/czrc"
        "other/cz-config.js"
        "other/ideavimrc"

    )

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

        if [ "$(readlink "$targetFile")" == "$sourceFile" ]; then

            print_success "$targetFile → $sourceFile"

        elif [ ! -e "$targetFile" ] || $skipQuestions; then # -e : True if file exists (regardless of type).

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
    print_info "Create symbolic links"
    create_symlinks "$@"
}

# Pass '-y' to script to skip questions
main "$@"
