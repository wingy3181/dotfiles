#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_ssh_configs() {
    printf "%s\n" \
        "Host github.com" \
        "  IdentityFile $1" \
        "  LogLevel ERROR" >> ~/.ssh/config
    print_result $? "Add SSH configs"
}

copy_public_ssh_key_to_clipboard () {
    # pbcopy normally means OS X
    if cmd_exists "pbcopy"; then

        pbcopy < "$1"
        print_result $? "Copy public SSH key to clipboard"

    else
        print_warning "Please copy the public SSH key ($1) to clipboard"
    fi

}

generate_ssh_keys() {
    ask "Please provide an email address (email): " && printf "\n"
    ssh-keygen -t rsa -b 4096 -C "$(get_answer)" -f "$1"
    #           │      │       │                  └───── The file name of the key
    #           │      │       └────── Comment for key. The email address prompted is used in this particular case
    #           │      └───────────── number of bits in the key. 4096 in this particular case
    #           └─────────────────── type of key to generate. RSA V2 in this particular case
    print_result $? "Generate SSH keys"
}

open_github_ssh_page() {

    declare -r GITHUB_SSH_URL="https://github.com/settings/ssh"

    if cmd_exists "open"; then
        open "$GITHUB_SSH_URL"
    else
        print_warning "Please add the public SSH key to GitHub ($GITHUB_SSH_URL)"
    fi

}

set_github_ssh_key() {

    local sshKeyFileName="$HOME/.ssh/github"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If there is already a file with that
    # name, generate another, unique, file name

    if [ -f "$sshKeyFileName" ]; then # -f : True if file exists and is a regular file.
        sshKeyFileName="$(mktemp -u "$HOME/.ssh/github_XXXXX")"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "Set up the SSH keys"

    generate_ssh_keys "$sshKeyFileName"

    add_ssh_configs "$sshKeyFileName"

    copy_public_ssh_key_to_clipboard "${sshKeyFileName}.pub"

    open_github_ssh_page

    test_ssh_connection \
        && rm "${sshKeyFileName}.pub"

}

test_ssh_connection() {

    while true; do

        ssh -T git@github.com &> /dev/null
        [ $? -eq 1 ] && break

        sleep 5

    done

    print_result $? "Set up the SSH keys"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    if is_git_repository; then

        ssh -T git@github.com &> /dev/null
        # Returns error code 1 when successfully authenticated but
        # because GitHub does not provide shell access
        # When it fails to successfully authenticate, it returns 255
        [ $? -ne 1 ] && set_github_ssh_key

        # Update content and remove untracked files
        git fetch --all 1> /dev/null \
            && git reset --hard origin/master 1> /dev/null \
            && git clean -fd 1> /dev/null

        print_result $? "Update content"

    fi

}

main
