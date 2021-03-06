# Twilight

A light/dark Neovim theme written in lua.

## ✨ Features

Supported plugins

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Glyph Palette](https://github.com/lambdalisue/glyph-palette.vim/)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [Fern](https://github.com/lambdalisue/fern.vim)
- [Barbar](https://github.com/romgrk/barbar.nvim)

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the theme with a package manager:

```vim
" For Vim-Plug
Plug 'jzone1366/twilight.nvim'
```

```lua
-- For Packer
use 'jzone1366/twilight.nvim'
```

## 🚀 Usage

Enable the colorscheme:

```vim
" From vimscript
colorscheme twilight
```

```lua
-- From lua
require('twilight').load()
```

To enable `Twilight` from `Lualine`:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = "twilight"
  }
}
```

To enable `Twilight` from `Lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'twilight'}
```

> ❗️ `twilight` is the only valid theme name. The other names are styles that can be set in the configuration.

### Command

Twilight also provides the following command to load a specific style.

- `:TwilightLoad <style>` load and applies the passed `<style>` (Use tab completion to view options)

## ⚙️ Configuration

Twilight comes with default configuration values. You can view them here:

```lua
{
  style = "light", -- Which style should be applied
  transparent = false, -- Disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening :terminal
  styles = {
    comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
    functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
    keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
    strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
    variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
  },
  colors = {}, -- Override default colors
  hlgroups = {}, -- Override highlight groups
}
```

You can override these values to suite your preferences. An example of this would be as follows:

```lua
local twilight = require('twilight')

-- This function set the configuration of twilight. If a value is not passed in the setup function
-- it will be taken from the default configuration above
twilight.setup({
  style = "dark", -- change the colorscheme to use dark
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "italic,bold" -- styles can be a comma separated list
  },
  colors = {
    red = "#FF000", -- Override the red color for MAX POWER
    bg_alt = "#000000",
  },
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000", style = "italic" },
  }
})

-- Load the configuration set above and apply the colorscheme
twilight.load()
```

For configuration in `vimscript`, wrap the above example in a lua script block.

```vim
" vimscript
lua << EOF
-- example above here
EOF
```

### General

These are general settings and are unrelated to any group of settings.

- `style`: **{string}** The name of the style you which to base the colorscheme on. See [Styles](#styles).
- `transparent`: **{boolean}** If set to true the background color will not be set.
- `terminal_colors`: **{boolean}** If set to true twilight will set the terminal colors for `:terminal`

### Styles

These options set the style for their respecitve highlight groups. See `:help highlight-args`.

- `comments`: **{string}** Style to the applied to comments
- `functions`: **{string}** Style to the applied to functions
- `keywords`: **{string}** Style to the applied to keywords
- `strings`: **{string}** Style to the applied to strings
- `variables`: **{string}** Style to the applied to variables

### Colors

`colors` is a table that defines hex color overrides for the colors returned by
`require('twilight.colors').load()`. To see what values can be overridden, use `vim.inspect` to
print out the returned color table.

```lua
print(vim.inspect(require('twilight.colors').init()))
```

Colors with the suffix `_br` are brighter colors. Colors with the suffix `_dm` are dimmer colors.

To see what colors are defined to what highlight group you can reference the file
[theme.lua](./lua/twilight/theme.lua).

### HLGroup

`hlgroups` is a table that defines overrides for highlight groups. The table consists of the
highlight group name as the key. The value is a table that defines optional values of the highlight
group. These values can be:

- `fg`: The foreground color of the highlight group
- `bg`: The background color of the highlight group
- `style`: The style applied to the highlight group (see `:help hightlight-args`)
- `sp`: Special colors use in GUI. (see `:help hightlight-guisp`)

To use a color defined by twilight's you can use the template format: `${}`. Any value that you can
override in the [colors](#colors) section can be added in the template format. Some examples would
be: `${red}`, `${blue_br}`, `${bg_alt}`.

To see examples of highlight groups that can be overridden reference the file
[theme.lua](./lua/twilight/theme.lua).

To find the hightlight group being applied to a piece of syntax refer to
[syntax highlight group](#syntax-highlight-groups) section.

## ⚙️ Advanced Configuration

### Get color values from twilight

There are different ways to get colors from twilight. Here are some examples:

```lua
-- Get the colors defined in twilight with the color overrides from config applied
local colors = require('twilight.colors').load()

-- Get the color of a specific theme with the color overrides applied from the config
local colors = require('twilight.colors').load('dark')

-- Get the colors defined in twilight without the color overrides applied from the config
local colors = require('twilight.colors').init()

-- Get the color of a specific theme without the color overrides applied from the config
local colors = require('twilight.colors').init("dark")
```

### Syntax highlight groups

This section will help you determine what highlight group is being applied to a piece of syntax.
These sections will output the highlight group for the value under the cursor.

#### Treesitter

If treesitter is the highlighting method for the language in question you can use the command:
`:TSHighlightCapturesUnderCursor`. This command comes from the treesitter [playground] plugin. Make
sure you have this installed as well as [nvim-treesitter].

[playground]: https://github.com/nvim-treesitter/playground
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter

#### Vim highlighting

Add this vimscript function to your configuration.

```vim
" plugin/syntax.vim

" Output the highlight group under the cursor
"
" This function will output the entire stack of hightlight groups being applied. The stack is
" outputted in the correct order from top to bottom. Vim will walk through the stack from top to
" bottom and apply the first defined highlight group found.
function! SynStack()
  for i1 in synstack(line("."), col("."))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, "name")
    let n2 = synIDattr(i2, "name")
    echo n1 "->" n2
  endfor
endfunction

" You can also create a convenience mapping
map <F2> <cmd>call SynStack()<cr>
```

## 🍬 Extra

There are [extra](./extra) configuration files for:

- [alacritty](https://github.com/alacritty/alacritty)
- [fish](https://fishshell.com/)
- [iterm](https://iterm2.com/index.html)
- [kitty](https://sw.kovidgoyal.net/kitty/overview/#configuring-kitty)
- [tmux](https://github.com/tmux/tmux)
- [wezterm](https://wezfurlong.org/wezterm/config/appearance.html#defining-a-color-scheme-in-a-separate-file)
- [xresources](https://wiki.archlinux.org/title/X_resources)
- [konsole](https://konsole.kde.org/)

The generation method used is based off of [tokyonight](https://github.com/folke/tokyonight.nvim).
They are generated by executing lua on the file `lua/twilight/extras/init.lua`. The generated
results are output to the [extra](./extra) folder.

## 🔥Contributing

Pull requests are welcome. For contributing to `extras`, they are generated with a template and run
with each colorscheme style. To add a new template follow these steps:

1. Create new `lua` file under `./lua/twilight/extras/`
1. Add the name and file extension into the `extras` table in `./lua/twilight/extras/init.lua`
1. To execute the template generation `:luafile ./lua/twilight/extras/init.lua`
1. Commit any files generated in `./extra`

## Credits

These themes were used as references and based off this:

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim/)
- [material.nvim](https://github.com/marko-cerovac/material.nvim)
- [onedark.nvim](https://github.com/ful1e5/onedark.nvim)
- [gruvbox-flat.nvim](https://github.com/eddyekofo94/gruvbox-flat.nvim)
- [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)
