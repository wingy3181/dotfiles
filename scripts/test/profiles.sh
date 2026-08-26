#!/usr/bin/env bash

set -u

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../src/os/profiles.sh"

declare testsRun=0

assert_equals() {
    local actual="$1"
    local expected="$2"
    local message="$3"

    testsRun=$((testsRun + 1))

    if [ "$actual" != "$expected" ]; then
        printf "FAIL: %s\nExpected: %s\nActual:   %s\n" \
            "$message" "$expected" "$actual" >&2
        exit 1
    fi
}

resolved_profiles() {
    local IFS=','
    printf "%s" "${DOTFILES_RESOLVED_PROFILES[*]}"
}

dotfiles_parse_profile_arguments
assert_equals "$(resolved_profiles)" "base,personal,workstation" \
    "No arguments default to base plus personal and workstation"

dotfiles_parse_profile_arguments --profile agent-host,node-dev
assert_equals "$(resolved_profiles)" "base,personal,agent-host,node-dev" \
    "Agent hosts include personal tools and compose from base"

dotfiles_parse_profile_arguments --profile=personal
assert_equals "$(resolved_profiles)" "base,personal" \
    "Personal tools can be selected without a machine role"

dotfiles_parse_profile_arguments --profile=base
assert_equals "$(resolved_profiles)" "base" \
    "Base can be selected by itself"

dotfiles_parse_profile_arguments --profile workstation,workstation
assert_equals "$(resolved_profiles)" "base,personal,workstation" \
    "Duplicate profiles are removed"

dotfiles_parse_profile_arguments --yes --profile ios-dev
assert_equals "$DOTFILES_SKIP_QUESTIONS" "true" \
    "The yes flag is preserved"
assert_equals "$(resolved_profiles)" "base,ios-dev" \
    "A development capability composes from base"

if dotfiles_parse_profile_arguments --profile unknown 2> /dev/null; then
    printf "FAIL: Unknown profiles must be rejected\n" >&2
    exit 1
fi
testsRun=$((testsRun + 1))

if dotfiles_parse_profile_arguments --profile 2> /dev/null; then
    printf "FAIL: Missing profile values must be rejected\n" >&2
    exit 1
fi
testsRun=$((testsRun + 1))

if dotfiles_parse_profile_arguments --profile agent-host, 2> /dev/null; then
    printf "FAIL: Empty profile names must be rejected\n" >&2
    exit 1
fi
testsRun=$((testsRun + 1))

if dotfiles_parse_profile_arguments \
    --profile workstation,agent-host 2> /dev/null; then
    printf "FAIL: Machine roles must be mutually exclusive\n" >&2
    exit 1
fi
testsRun=$((testsRun + 1))

printf "PASS: %s profile tests\n" "$testsRun"
