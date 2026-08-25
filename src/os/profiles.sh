#!/usr/bin/env bash

# Resolve machine roles and development capabilities into an ordered,
# de-duplicated list of profiles. All non-base profiles extend `base`.

declare -r DOTFILES_DEFAULT_PROFILE="workstation"
declare -a DOTFILES_REQUESTED_PROFILES=()
declare -a DOTFILES_RESOLVED_PROFILES=()
declare DOTFILES_SKIP_QUESTIONS=false

dotfiles_profile_is_supported() {
    case "$1" in
        base|workstation|agent-host|node-dev|ios-dev) return 0 ;;
        *) return 1 ;;
    esac
}

dotfiles_profile_dependencies() {
    case "$1" in
        base) ;;
        workstation|agent-host|node-dev|ios-dev) printf "base\n" ;;
    esac
}

dotfiles_profile_is_resolved() {
    local profile=""

    # The `+` expansion keeps empty arrays safe under `set -u` in Bash 3.2,
    # which is still the system Bash on macOS.
    for profile in ${DOTFILES_RESOLVED_PROFILES[@]+"${DOTFILES_RESOLVED_PROFILES[@]}"}; do
        [ "$profile" == "$1" ] && return 0
    done

    return 1
}

dotfiles_add_resolved_profile() {
    local dependency=""
    local profile="$1"

    if ! dotfiles_profile_is_supported "$profile"; then
        printf "Unknown profile: %s\n" "$profile" >&2
        return 1
    fi

    while IFS= read -r dependency; do
        [ -n "$dependency" ] \
            && dotfiles_add_resolved_profile "$dependency" \
            || true
    done < <(dotfiles_profile_dependencies "$profile")

    if ! dotfiles_profile_is_resolved "$profile"; then
        DOTFILES_RESOLVED_PROFILES+=("$profile")
    fi
}

dotfiles_add_requested_profiles() {
    local profile=""
    local profiles="$1"
    local previousIFS="$IFS"

    if [ -z "$profiles" ]; then
        printf "The --profile option requires a value.\n" >&2
        return 1
    fi

    case "$profiles" in
        ,*|*,|*,,*)
            printf "Profile names cannot be empty.\n" >&2
            return 1
            ;;
    esac

    IFS=','
    for profile in $profiles; do
        if [ -z "$profile" ]; then
            printf "Profile names cannot be empty.\n" >&2
            IFS="$previousIFS"
            return 1
        fi

        DOTFILES_REQUESTED_PROFILES+=("$profile")
    done
    IFS="$previousIFS"
}

dotfiles_validate_profile_combination() {
    if dotfiles_profile_is_enabled "workstation" \
        && dotfiles_profile_is_enabled "agent-host"; then
        printf "Profiles 'workstation' and 'agent-host' cannot be combined.\n" >&2
        return 1
    fi
}

dotfiles_parse_profile_arguments() {
    DOTFILES_REQUESTED_PROFILES=()
    DOTFILES_RESOLVED_PROFILES=()
    export DOTFILES_SKIP_QUESTIONS=false

    while [ "$#" -gt 0 ]; do
        case "$1" in
            -y|--yes)
                export DOTFILES_SKIP_QUESTIONS=true
                ;;
            --profile)
                shift
                [ "$#" -gt 0 ] || {
                    printf "The --profile option requires a value.\n" >&2
                    return 1
                }
                dotfiles_add_requested_profiles "$1" || return 1
                ;;
            --profile=*)
                dotfiles_add_requested_profiles "${1#*=}" || return 1
                ;;
            *)
                printf "Unknown option: %s\n" "$1" >&2
                return 1
                ;;
        esac
        shift
    done

    if [ "${#DOTFILES_REQUESTED_PROFILES[@]}" -eq 0 ]; then
        DOTFILES_REQUESTED_PROFILES=("$DOTFILES_DEFAULT_PROFILE")
    fi

    local profile=""
    for profile in ${DOTFILES_REQUESTED_PROFILES[@]+"${DOTFILES_REQUESTED_PROFILES[@]}"}; do
        dotfiles_add_resolved_profile "$profile" || return 1
    done

    dotfiles_validate_profile_combination || return 1
}

dotfiles_profile_is_enabled() {
    dotfiles_profile_is_resolved "$1"
}

dotfiles_print_resolved_profiles() {
    local profile=""
    local separator=""

    printf "Resolved profiles: "
    for profile in ${DOTFILES_RESOLVED_PROFILES[@]+"${DOTFILES_RESOLVED_PROFILES[@]}"}; do
        printf "%s%s" "$separator" "$profile"
        separator=", "
    done
    printf "\n"
}
