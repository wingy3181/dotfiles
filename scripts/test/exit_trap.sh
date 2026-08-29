#!/usr/bin/env bash

set -u

cd "$(dirname "${BASH_SOURCE[0]}")" \
    || exit 1

declare -r UTILS_PATH="$(pwd)/../../src/os/utils.sh"
declare output=""

if ! output="$(
    bash -c '
        . "$1"
        kill_all_subprocesses() { printf "cleanup-ran\n"; }
        set_trap "EXIT" "kill_all_subprocesses"
    ' "exit-trap-test" "$UTILS_PATH" "profile-list-must-not-run" 2>&1
)"; then
    printf "FAIL: Exit trap treated a script argument as a command\n%s\n" \
        "$output" >&2
    exit 1
fi

if [ "$output" != "cleanup-ran" ]; then
    printf "FAIL: Exit trap did not run the registered cleanup command\n%s\n" \
        "$output" >&2
    exit 1
fi

printf "PASS: Exit trap preserves its registered cleanup command\n"
