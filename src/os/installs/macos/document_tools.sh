#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

install_uv_tool() {
    declare -r readableName="$1"
    declare -r package="$2"
    declare -r executable="$3"

    if cmd_exists "$executable"; then
        print_success "$readableName"
        return
    fi

    execute \
        "uv tool install --python 3.12 '$package'" \
        "$readableName"
}

print_in_purple "\n   Document Tools\n\n"

brew_install "uv" "uv"
install_uv_tool "Docling" "docling" "docling"
install_uv_tool "MarkItDown" "markitdown[all]" "markitdown"
