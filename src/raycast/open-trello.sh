#!/bin/bash
# https://github.com/raycast/script-commands/issues/165

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Trello Personal Board
# @raycast.packageName Trello
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./icons/trello-64x64.png

# Documentation:
# @raycast.description Open Trello Personal Board
# @raycast.author Cheong Yip
# @raycast.authorURL https://github.com/wingy3181

source .env

open $TRELLO_PERSONAL_BOARD_URL
