#!/bin/bash
# https://github.com/raycast/script-commands/issues/165

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create Trello Highlight Card
# @raycast.packageName Trello
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ./icons/trello-64x64.png
# @raycast.argument1 { "type": "text", "placeholder": "Card title" }
# @raycast.argument2 { "type": "text", "placeholder": "Due date (e.g. today)", "optional": true }

# Documentation:
# @raycast.description Create a new Trello Highlight card
# @raycast.author Cheong Yip
# @raycast.authorURL https://github.com/wingy3181

source libs/load-node.sh

node scripts/create-trello-card.mjs "$1" "$2"
