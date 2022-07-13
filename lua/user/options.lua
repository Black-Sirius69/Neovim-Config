vim.o.background = "dark"
vim.opt.hlsearch = false
vim.opt.errorbells = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.relativenumber = true
vim.o.incsearch = true
vim.o.backup = false
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "80"
vim.o.termguicolors = true
vim.o.autoread = true
vim.g.mapleader = " "
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.o.mouse = "a"
vim.o.autochdir = true
vim.o.splitright = true
if vim.g.neovide == true then
	vim.o.guifont = "JetBrainsMono Nerd Font:h8"
	vim.g.neovide_cursor_vfx_mode = "ripple"
	vim.g.neovide_transparency = 0.95
	vim.g.neovide_floating_opacity = 0.95
end
