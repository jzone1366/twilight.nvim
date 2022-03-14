lua << EOF
-- Useful for me when I am trying to debug and reload my changes
if vim.g.twilight_debug == true then
  package.loaded['twilight'] = nil
  package.loaded['twilight.colors'] = nil
  package.loaded['twilight.theme'] = nil
  package.loaded['twilight.util'] = nil
end

local twilight = require('twilight')
twilight.setup()
twilight._colorscheme_load()
EOF
