local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end


treesitter.setup {
-- A list of parser names, or "all"
ensure_installed = "all",

-- Install parsers synchronously (only applied to `ensure_installed`)
sync_install = false,

-- Automatically install missing parsers when entering buffer
auto_install = true,

highlight = {
  enable = true,
  additional_vim_regex_highlighting = true,
},
autopairs = {
  enable = true,
},
incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = { enable = true, disable = { "python", "css", "rust" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
    disable = { "xml", "markdown" },
  },
  rainbow = {
    enable = true,
    colors = {
      "#68a0b0",
      "#946EaD",
      "#c7aA6D",
      -- "Gold",
      -- "Orchid",
      -- "DodgerBlue",
      -- "Cornsilk",
      -- "Salmon",
      -- "LawnGreen",
    },
    disable = { "html" },
  },
}
