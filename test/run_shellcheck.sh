#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../src/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # ' At first you're like "shellcheck is awesome" but then you're
    #   like "wtf are we still using bash" '
    #
    #  (from: https://twitter.com/astarasikov/status/568825996532707330)

    find \
        ../test \
        ../src/bin \
        ../src/shell \
        ../src/os \
        -type f \
        ! -path '../src/bin/**/linux-32' \
        ! -path '../src/bin/**/linux-64' \
        ! -path '../src/bin/**/macos' \
        ! -path '../src/bin/server.py' \
        ! -path '../src/shell/curlrc' \
        ! -path '../src/shell/inputrc' \
        ! -path '../src/shell/screenrc' \
        ! -path '../src/shell/tmux.conf' \
        ! -path '../src/os/preferences/macos/*.applescript' \
        ! -path '../src/os/preferences/macos/*.terminal' \
        -exec shellcheck \
                -e SC1090 \
                -e SC1091 \
                -e SC2155 \
        {} +

    print_result $? "Run code through ShellCheck"

}

main
