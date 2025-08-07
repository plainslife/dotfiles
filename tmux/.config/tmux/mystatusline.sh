#!/usr/bin/env bash

# NOTE: still working/playing on it

# ===========================================================
# title:      tmux-min                                      |
# author:     plainslife                                    |
# repository: https://github.com/plainslife/tmux-min        |
# ===========================================================

# scripts path
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_PATH="$CURRENT_DIR/src"

# get options
transparent="$(tmux show-option -gv @mystatusline-transparent)"
show_username="$(tmux show-option -gv @mystatusline-show-username)"
show_uptime="$(tmux show-option -gv @mystatusline-show-uptime)" 
separator="$(tmux show-option -gqv @mystatusline-separator)"

# default options
transparent=${transparent:-0}
show_username=${show_username:-1}
show_uptime=${show_uptime:-1}
separator=${separator:-""}

# ======================

# seperator icons

# , , , , , 

#  ,  ,  , 

#  ,  ,  , 

# ======================

# prefix -> not sure about this just playing around
# b -> beginning section of the statusline
# m -> middle section of the statusline
# l -> last section of the statusline

sep_lleft=""
sep_lright=""

if [[ -n "$separator" && "$transparent" -eq 0 ]]; then
  sep_lleft=""
  sep_lright=""
fi

# current window index focus
window_focus_index="#($SCRIPTS_PATH/custom-index.sh #I 'active')"
 
# not current window index focus
window_index="#($SCRIPTS_PATH/custom-index.sh #I 'inactive')"

source $SCRIPTS_PATH/palette.sh
source $SCRIPTS_PATH/format.sh
