#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# https://en.wikipedia.org/wiki/Java_version_history
declare -a JAVA_VERSIONS=()

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local os=""
    os="$(get_os)" \
        || print_error "failed to get the kernel name"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ "$os" == "macos" ]; then
        JAVA_VERSIONS=(
            /Library/Java/JavaVirtualMachines/*/Contents/Home
        )
    fi

    declare -r JENV_DIRECTORY="$HOME/.jenv"
    declare -r JENV_GIT_REPO_URL="https://github.com/gcuisinier/jenv.git"

    # Set macos system environment variable for JAVA_HOME just before 'jenv init -'
    # https://github.com/gcuisinier/jenv/issues/44
    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Java Version Manager

export JENV_DIR=\"$JENV_DIRECTORY\"

[ -d \"\$JENV_DIR\" ] \\
    && export PATH=\"\$JENV_DIR/bin:\$PATH\"

if which jenv > /dev/null && which launchctl > /dev/null && test -z \"$TMUX\"; then eval launchctl setenv JAVA_HOME \"\$(jenv javahome)\"; fi
if which jenv > /dev/null && which launchctl > /dev/null && ! test -z \"$TMUX\"; then eval launchctl setenv JAVA_HOME \"\$(jenv javahome)\"; fi
if which jenv > /dev/null; then eval \"\$(jenv init -)\"; fi
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Git` is installed

    if ! cmd_exists "git"; then
        print_error "Git is required, please install it!\n"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install `jenv` and add the necessary configs to `~/.bash.local`

    if [ ! -d "$JENV_DIRECTORY" ]; then # -d : True if file exists and is a directory.

        execute \
            "git clone --quiet $JENV_GIT_REPO_URL $JENV_DIRECTORY" \
            "jenv (install)" || return 1

        # '>>' : file to append to
        execute_without_spinner \
            "printf '%s' '$CONFIGS' >> $HOME/.bash.local \
                && . $HOME/.bash.local" \
            "jenv (update ~/.bash.local)"

    fi

    if [ -d "$JENV_DIRECTORY" ]; then # -d : True if file exists and is a directory.
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Ensure the latest version of `jenv` is used

        execute \
            "cd $JENV_DIRECTORY \
                && git fetch --quiet origin \
                && git checkout --quiet \$(git describe --abbrev=0 --tags) \
                && . $HOME/.bash.local" \
            "jenv (upgrade)"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Remove all currently registered java versions with jenv
        # Done by looking at https://github.com/gcuisinier/jenv/blob/master/libexec/jenv-remove
        # and seeing how it removes a version.
        # Awaiting my PR that adds `remove-all` (https://github.com/gcuisinier/jenv/pull/146)
        execute \
            "cd $JENV_DIRECTORY \
                && rm -f ./versions/* \
                && rm -f *.time \
                && jenv rehash" \
            "jenv (remove all versions)"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Install the specified `java` versions

        for i in "${JAVA_VERSIONS[@]}"; do
            execute_without_spinner \
                "jenv add ${i}" \
                "jenv (add: ${i})"
        done

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # By default, use version 12.0 of `java`

        execute_without_spinner \
            "jenv global 12.0" \
            "jenv (set 12.0 as global default - See ~/.jenv/version)"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Re-source ~/.bash_profile to pick jenv in current terminal

        execute_without_spinner \
            ". '$HOME/.bash_profile'" \
            "Re-source ~/.bash_profile"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Enable jenv plugins so that other command line tools are aware of which JDK is activated via jenv
        # See README.md of https://github.com/gcuisinier/jenv for more info

        execute_without_spinner \
            "jenv enable-plugin ant \
             && jenv enable-plugin export \
             && jenv enable-plugin gradle \
             && jenv enable-plugin groovy \
             && jenv enable-plugin maven \
             && jenv enable-plugin springboot" \
            "jenv (enable plugins)"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        print_in_green "\n  ---\n\n"

    fi

}

main
