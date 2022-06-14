-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- let g:copilot_no_tab_map = v:true
local opts = { silent = true, expr = true }
local keymap = vim.api.nvim_set_keymap
vim.g["copilot_no_tab_map"] = true

keymap("i", "<C-j>", 'copilot#Accept("<CR>")', opts)
