#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# Use Cursor's installer instead of Homebrew's `cursor-cli` cask. The official
# installer creates both `agent` (primary) and `cursor-agent` (legacy), whereas
# Homebrew exposes only `cursor-agent` and Cursor's shell integration expects
# `~/.local/bin/agent`.
# https://cursor.com/install
# https://github.com/Homebrew/homebrew-cask/issues/246845
install_cursor_agent_cli() {
    if cmd_exists "agent" || [ -x "$HOME/.local/bin/agent" ]; then
        print_success "Cursor Agent CLI"
        return
    fi

    execute \
        "curl https://cursor.com/install -fsS | bash" \
        "Cursor Agent CLI"
}

print_in_purple "\n   Remote Agent Host\n\n"

brew_install "ChatGPT" "chatgpt" "--cask"
brew_install "Codex" "codex" "--cask"
install_cursor_agent_cli
