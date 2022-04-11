local opts = {noremap = true, silent = true}
vim.g.maplocalleader = "\\"
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
keymap("n", "<leader>p", ":SymbolsOutline<CR>", opts)
keymap("n", "<leader>x", ":bd<CR>", opts)


-- Bufferline
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", opts)
keymap("n", "<C-p>", ":lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<leader>pf", ":lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>pw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>", opts)
keymap("n", "<leader>pb", ":lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>vh", ":lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
keymap("n", "<leader>gm", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)
keymap("n", "<leader>ou", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
keymap("n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
keymap("n", "gi", ":lua require('telescope.builtin').lsp_implementations()<CR>", opts)

-- For Hop
keymap("n", "<leader>s", ":HopPattern<CR>", opts)
