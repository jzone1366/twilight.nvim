#!/usr/bin/env bash

# Twilight colors for Tmux
# Style: twilight_light
# Upstream: https://github.com/jzone1366/twilight.nvim/raw/main/extra/light/twilighttmux.tmux

set -g mode-style "fg=#1c88ce,bg=#ced0ce"

set -g message-style "fg=#1c88ce,bg=#ced0ce"
set -g message-command-style "fg=#1c88ce,bg=#ced0ce"

set -g pane-border-style "fg=#ced0ce"
set -g pane-active-border-style "fg=#1c88ce"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#1c88ce,bg=#e4e6e3"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#0f1926,bg=#1c88ce,bold] #S "
set -g status-right "#[fg=#1c88ce,bg=#e4e6e3] #{prefix_highlight} #[fg=#1c88ce,bg=#ced0ce] %Y-%m-%d | %I:%M %p #[fg=#0f1926,bg=#1c88ce,bold] #h "

setw -g window-status-activity-style "underscore,fg=#0f1926,bg=#e4e6e3"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#0f1926,bg=#e4e6e3"
setw -g window-status-format "#[default] #I | #W #F "
setw -g window-status-current-format "#[fg=#1c88ce,bg=#ced0ce,bold] #I | #W #F "
  