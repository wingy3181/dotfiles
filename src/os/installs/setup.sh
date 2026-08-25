#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n * Installs\n"
    print_warning "This may take awhile, so please be patient!\n"

    "./$(get_os)/main.sh" "$@"
}

# Pass '-y' to script to skip questions
main "$@"
