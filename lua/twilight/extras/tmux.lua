local util = require("twilight.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
	local tmuxColors = {}
	-- use lowercase chars as #F is a formatter in Tmux.
	for k, v in pairs(colors) do
		if type(v) == "string" and string.match(v, "#") then
			tmuxColors[k] = v:lower()
		else
			tmuxColors[k] = v
		end
	end

	local tmux = util.template(
		[[
#!/usr/bin/env bash

# Twilight colors for Tmux
# Style: ${meta.name}
# Upstream: ${meta.url}

set -g mode-style "fg=${blue},bg=${fg_gutter}"

set -g message-style "fg=${blue},bg=${fg_gutter}"
set -g message-command-style "fg=${blue},bg=${fg_gutter}"

set -g pane-border-style "fg=${fg_gutter}"
set -g pane-active-border-style "fg=${blue}"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=${blue},bg=${bg_statusline}"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style ${none}
set -g status-right-style ${none}

set -g status-left "#[fg=${black},bg=${blue},bold] #S "
set -g status-right "#[fg=${blue},bg=${bg_statusline}] #{prefix_highlight} #[fg=${blue},bg=${fg_gutter}] %Y-%m-%d | %I:%M %p #[fg=${black},bg=${blue},bold] #h "

setw -g window-status-activity-style "underscore,fg=${fg_sidebar},bg=${bg_statusline}"
setw -g window-status-separator ""
setw -g window-status-style "${none},fg=${fg_sidebar},bg=${bg_statusline}"
setw -g window-status-format "#[default] #I | #W #F "
setw -g window-status-current-format "#[fg=${blue},bg=${fg_gutter},bold] #I | #W #F "
  ]],
		tmuxColors
	)
	return tmux
end

return M
