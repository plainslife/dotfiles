#!/usr/bin/env bash

if [[ "$transparent" -eq 0 ]]; then
  # minimal format 
  tmux set -g window-status-current-format "#{?window_zoomed_flag,#[bg=${WINDOW_ACTIVE_BG}]#[fg=${WINDOW_ACTIVE_FG}] 󰄶 #W$window_focus_index󱇬 ,#[bg=${WINDOW_ACTIVE_BG}]#[fg=${WINDOW_ACTIVE_FG}] 󰄶 #W$window_focus_index }"
  tmux set -g window-status-format "#[fg=${WINDOW_FG}]#[bg=${WINDOW_BG}] 󰄷 #W$window_index "
  tmux set -g status-left "#{?client_prefix,#[fg=${PREFIX_INVOKE_FG}]#[bg=${PREFIX_BG}] ,#[fg=${PREFIX_NOT_INVOKE_FG}]#[bg=${PREFIX_BG}] } #[fg=${SESSION_NAME}]#[bg=${PREFIX_BG}]#S "
else
  # with seperator format
  tmux set -g window-status-current-format "#[fg=#2D2A29, bg=#8F3F71]${separator}#{?window_zoomed_flag,#[bg=${WINDOW_ACTIVE_BG}]#[fg=${WINDOW_ACTIVE_FG}]󰄶 #W$window_focus_index󱇬,#[bg=${WINDOW_ACTIVE_BG}]#[fg=${WINDOW_ACTIVE_FG}]󰄶 #W$window_focus_index}#[fg=#8F3F71, bg=#2D2A29]${separator}"
  tmux set -g window-status-format "#[fg=#2D2A29]#[bg=${WINDOW_BG}]${separator}#[fg=${WINDOW_FG}]#[bg=${WINDOW_BG}]󰄷 #W$window_index#[fg=${WINDOW_BG}]#[bg=#2D2A29]${separator}"
  tmux set -g status-left "#{?client_prefix,#[fg=${PREFIX_INVOKE_FG}]#[bg=${PREFIX_BG}] 󱟱,#[fg=${PREFIX_NOT_INVOKE_FG}]#[bg=${PREFIX_BG}] 󱟲} #[fg=${SESSION_NAME}]#[bg=${PREFIX_BG}]#S #[fg=#458588, bg=#2D2A29]${separator}"
fi

tmux set -g status-right ""
tmux set -g window-status-separator ""
tmux set -g status-style bg="${STATUSLINE_BG}"

tmux set -g status-left-length 30

tmux set -g message-style "bg=${STATUSLINE_BG},fg=${PALETTE[gray]}"

if [ "$show_uptime" -eq 1 ]; then
  tmux set -ag status-right "#[fg=${UPTIME_BG},bg=#2D2A29]${sep_lleft}#[fg=${UPTIME_FG},bg=${UPTIME_BG}] #(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',') "
fi

if [ "$show_username" -eq 1 ]; then
  tmux set -ag status-right "|#[fg=${UPTIME_FG},bg=${UPTIME_BG}] #(whoami) #[fg=${UPTIME_BG},bg=#2D2A29]${sep_lright}"
fi




