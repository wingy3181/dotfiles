#!/usr/bin/env bash

# Ensure the following is executed as if this script was in
# the project root.
#
# Note: The main reason for doing this is to simplify the
#       output and also have it relative to the project root.

cd "$(dirname "${BASH_SOURCE[0]}")/../.."

main() (
    npx nodemon@^3.0 --exec "./scripts/lint/shell.sh" --ext "sh"
)

main

