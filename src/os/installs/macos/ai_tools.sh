#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   AI Tools\n\n"

# Research/Knowledge
brew_install_with_confirmation "ChatGPT" "chatgpt" "--cask"
brew_install_with_confirmation "Claude" "claude" "--cask"

# LLM
brew_install_with_confirmation "ollama" "ollama-app" "--cask"

# Image
brew_install_with_confirmation "Diffusion Bee" "diffusionbee" "--cask"

# Development/Coding
brew_install_with_confirmation "Cursor" "cursor" "--cask"
