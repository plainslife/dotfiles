#!/usr/bin/env bash

# based on gruvbox colors
declare -A PALETTE=(
  ["background"]="#302C2B"
  ["background-light"]="#413B38"
  ["black"]="#000000"
  ["aqua"]="#689D6A"
  ["red"]="#CC241D"
  ["purple"]="#8F3F71"
  ["blue"]="#458588"
  ["yellow"]="#D79921"
  ["green"]="#98971A"
  ["gray"]="#A89984"
  ["orange"]="#D65D0D"
  ["light_gray"]="#EBDBB2"
  ["light_red"]="#FB4934"
  ["dark_purple"]="#502C3C"
) 

# statusline bg color
STATUSLINE_BG=${PALETTE["background"]}

# tmux session
PREFIX_INVOKE_FG=${PALETTE["light_gray"]}
PREFIX_NOT_INVOKE_FG=${PALETTE["black"]}
PREFIX_BG=${PALETTE["blue"]}
SESSION_NAME=${PALETTE["black"]}

# tmux window
WINDOW_ACTIVE_FG=${PALETTE["black"]}
WINDOW_ACTIVE_BG=${PALETTE["purple"]}
WINDOW_FG=${PALETTE["gray"]}
WINDOW_BG=${PALETTE["background-light"]}

# uptime
UPTIME_FG=${PALETTE["black"]}
UPTIME_BG=${PALETTE["aqua"]}

# overide for transparent theme
if [ "$transparent" -eq 1 ]; then
  STATUSLINE_BG="default"

  # for minimal theme
  PREFIX_INVOKE_FG=${PALETTE["red"]}
  PREFIX_NOT_INVOKE_FG=${PALETTE["aqua"]}
  PREFIX_BG=${STATUSLINE_BG}
  SESSION_NAME=${PALETTE["aqua"]}

  WINDOW_ACTIVE_FG=${PALETTE["gray"]}
  WINDOW_ACTIVE_BG=${STATUSLINE_BG}
  WINDOW_FG=${PALETTE["gray"]}
  WINDOW_BG=${STATUSLINE_BG}

  UPTIME_FG=${PALETTE["aqua"]}
  UPTIME_BG="default"
fi
