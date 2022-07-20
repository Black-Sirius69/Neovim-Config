local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function(use)
	-- themes
	use({ "navarasu/onedark.nvim" })
	use({ "projekt0n/github-nvim-theme" })
	-- UI
	use({
		"stevearc/dressing.nvim",
	})
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Nvim treesitter for a better syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Telescope -> Fuzzy Finding
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"ahmedkhalf/project.nvim",
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
	})
	use({ "hrsh7th/cmp-buffer"})
	use({ "hrsh7th/cmp-path"})
	use({ "saadparwaiz1/cmp_luasnip"})
	use({ "hrsh7th/cmp-nvim-lsp"})
	use({ "hrsh7th/cmp-emoji"})
	use({ "L3MON4D3/LuaSnip"})
	use({ "rafamadriz/friendly-snippets" })
	-- Autopairs
	use({
		"windwp/nvim-autopairs",
	})
	-- Comment
	use({ "numToStr/Comment.nvim"})

	-- LSP
	use({ "williamboman/nvim-lsp-installer"})
	use({
		"neovim/nvim-lspconfig",
	})
	use({ "RRethy/vim-illuminate"})
	use({ "jose-elias-alvarez/null-ls.nvim"})

	-- Rust tools
	use({ "simrat39/rust-tools.nvim"})

	-- Clangd extensions
	use({ "p00f/clangd_extensions.nvim"})

	-- Debug Adapter Protocol (DAP)
	use({ "mfussenegger/nvim-dap"})

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Which key for keybindigs
	use({
		"folke/which-key.nvim",
	})
	-- Packer for it can manage itself
	use({ "wbthomason/packer.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
