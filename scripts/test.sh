#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../src/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    ./lint/shell.sh
    print_result $? "Lint shell files"
    ./lint/markdown.sh
    print_result $? "Lint Markdown files"
    ./check_links/markdown.sh
    print_result $? "Check links from Markdown file"

}

main
