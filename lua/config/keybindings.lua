local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = true
}

-- Window mappings
map("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
map("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
map("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
map("n", "<C-l>", "<cmd>wincmd l<CR>", opts)

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<CR>", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>", opts)
map("i", "<A-j>", "<esc><cmd>m .+1<CR>==gi", opts)
map("i", "<A-k>", "<esc><cmd>m .-2<CR>==gi", opts)
map("v", "<A-j>", "<esc><cmd>m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", "<esc><cmd>m '<-2<CR>gv=gv", opts)

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
