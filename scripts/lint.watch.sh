#!/usr/bin/env bash

main() (
    npx concurrently@^8.2 \
        --names "shell,markdown" \
        --prefix-colors "bgBlue.bold,bgMagenta.bold" \
        --prefix "[{name}]" \
        --kill-others \
        "./scripts/lint/shell.watch.sh" \
        "./scripts/lint/markdown.watch.sh"
)

main

