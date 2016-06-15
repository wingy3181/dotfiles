#!/usr/bin/env bash

declare -a JDKS_DIRECTORIES_TO_REMOVE=()

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# OS X

if [ "$TRAVIS_OS_NAME" = "osx" ]; then

    # Install `ShellCheck` (required for testing)
    brew install shellcheck

    # To better simulate a clean macOS install, remove certain things
    # included by default by Travis CI with brew
    brew cask uninstall java6
    brew cask uninstall java7
    brew cask uninstall java

    # Export directory where Java binaries are located in linux
    JDKS_DIRECTORIES_TO_REMOVE=(
        /Library/Java/JavaVirtualMachines/*.jdk
    )

fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# To better simulate a clean OS install, remove certain things
# included by default by Travis CI

rm -rf "$NVM_DIR"
for i in "${JDKS_DIRECTORIES_TO_REMOVE[@]}"; do
    sudo rm -rf "${i}"
done
