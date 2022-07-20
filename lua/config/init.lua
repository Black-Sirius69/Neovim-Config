-- Set the global options
require("config.options")
require("config.keybindings")


require"config.tree"
require"config.alpha"
require "config.telescope"
require "config.lsp"
require "config.cmp"
require "config.autopairs"
require "config.dressing"
require "config.treesitter"
require "config.whichkey"
require "config.project"


-- Set the colorscheme
local theme = require("config.themes")
theme.set_theme("github")
