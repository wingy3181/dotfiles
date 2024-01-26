#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#install_plugin() {
#    execute "code --install-extension $1" "$2 (plugin)"
#}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Development Tools\n\n"

brew_install_with_confirmation "Arduino IDE" "arduino-ide" "--cask"
brew_install_with_confirmation "codewhisperer" "codewhisperer" "--cask"
brew_install_with_confirmation "direnv" "direnv"
brew_install_with_confirmation "Jetbrains Toolbox" "jetbrains-toolbox" "--cask"
brew_install_with_confirmation "pnpm" "pnpm"
brew_install_with_confirmation "Postman" "postman" "--cask"
brew_install_with_confirmation "Responsively" "responsively" "--cask"
brew_install_with_confirmation "ShellCheck" "shellcheck"
brew_install_with_confirmation "VS Code" "visual-studio-code" "--cask"
brew_install_with_confirmation "yarn" "yarn"

#printf "\n"

# Install the VSCode plugins - https://marketplace.visualstudio.com/vscode
# https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
#install_plugin "EditorConfig.EditorConfig" "EditorConfig"

# Close VSCode
#osascript -e 'quit app "Visual Studio Code"'



