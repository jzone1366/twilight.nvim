#!/usr/bin/env bash

# Twilight colors for Tmux
# Style: twilight_dark
# Upstream: https://github.com/jzone1366/twilight.nvim/raw/main/extra/dark/twilighttmux.tmux

set -g mode-style "fg=#1c88ce,bg=#27303b"

set -g message-style "fg=#1c88ce,bg=#27303b"
set -g message-command-style "fg=#1c88ce,bg=#27303b"

set -g pane-border-style "fg=#27303b"
set -g pane-active-border-style "fg=#1c88ce"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#1c88ce,bg=#0f1926"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#0f1926,bg=#1c88ce,bold] #S "
set -g status-right "#[fg=#1c88ce,bg=#0f1926] #{prefix_highlight} #[fg=#1c88ce,bg=#27303b] %Y-%m-%d | %I:%M %p #[fg=#0f1926,bg=#1c88ce,bold] #h "

setw -g window-status-activity-style "underscore,fg=${fg_sidebar},bg=#0f1926"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=${fg_sidebar},bg=#0f1926"
setw -g window-status-format "#[default] #I | #W #F "
setw -g window-status-current-format "#[fg=#1c88ce,bg=#27303b,bold] #I | #W #F "
  