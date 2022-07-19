local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function(use)
	-- themes
    use({"navarasu/onedark.nvim"})

	-- UI
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.config.dressing")
		end,
	})
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- Nvim treesitter for a better syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.config.treesitter")
		end,
	})

	-- Telescope -> Fuzzy Finding
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.config.telescope")
		end,
	})
    use({"ahmedkhalf/project.nvim", after="telescope", config = function() require("plugins.config.project") end})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
		config = function()
			require("plugins.config.cmp")
		end,
	})
	use({ "hrsh7th/cmp-buffer", after = "LuaSnip" })
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "LuaSnip" })
	use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
	use({ "L3MON4D3/LuaSnip", wants = "friendly-snippets", after = "friendly-snippets" })
	use({ "rafamadriz/friendly-snippets" })

	-- Comment
	use({ "numToStr/Comment.nvim" })

	-- LSP
	use({ "williamboman/nvim-lsp-installer", after = "cmp-nvim-lsp" })
	use({
		"neovim/nvim-lspconfig",
		after = "nvim-lsp-installer",
		config = function()
			require("plugins.config.lsp")
		end,
	})
	use({ "RRethy/vim-illuminate", after = "nvim-lsp-installer" })
	use({ "jose-elias-alvarez/null-ls.nvim", after = "nvim-lsp-installer" })

	-- Rust tools
	use({ "simrat39/rust-tools.nvim", after = "nvim-lsp-installer" })

	-- Debug Adapter Protocol (DAP)
	use({ "mfussenegger/nvim-dap", after="nvim-lsp-installer" })

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("plugins.config.autopairs")
		end,
	})

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		cmd = "NvimTreeToggle",
		config = function()
			require("plugins.config.tree")
		end,
	})

	-- Which key for keybindigs
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.config.whichkey")
		end,
	})
	-- Packer for it can manage itself
	use({ "wbthomason/packer.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
