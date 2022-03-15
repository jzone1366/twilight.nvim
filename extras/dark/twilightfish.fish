# Twilight Color Palette
# Style: twilight_dark
# Upstream: https://github.com/jzone1366/twilight.nvim/raw/main/extra/dark/twilightfish.fish
set -l foreground FDFFFC
set -l selection 202226
set -l comment 91A5C2
set -l red 800E13
set -l orange E66A17
set -l yellow DED03C
set -l green 0D751B
set -l purple C91457
set -l cyan 3B8395
set -l pink D46D8D
# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment
# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
  