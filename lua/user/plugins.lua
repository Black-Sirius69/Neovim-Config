local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen neovim")
	vim.cmd([[packadd packer.nvim]])
end

local conf = {
	profile = {
		enable = true,
		threshold = 0,
	},

	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

require("packer").init(conf)

return require("packer").startup(function(use)
	-- Packer.nvim
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")

	-- Telescope.nvim
	use({
		"nvim-telescope/telescope-fzy-native.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "ThePrimeagen/git-worktree.nvim" },
		},
	})
	use({ "nvim-treesitter/playground" })

	-- Nvim Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Hop Easymotion for neovim
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
	})

	-- Nvim Tree File tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	-- Comment.nvim
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("user.comment")
		end,
	})

	-- Buffer Line
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Nvim LSP and required plugins
	use({
		"williamboman/nvim-lsp-installer",
		after = "nvim-lspconfig",
		config = function()
			require("user.lsp")
		end,
	})
	use({
		"neovim/nvim-lspconfig",
        after="nvim-cmp"
	})
	use({ "tamago324/nlsp-settings.nvim", after = "nvim-lsp-installer" })

	-- Nvim Completions
	use({
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
		config = function()
			require("user.cmp")
		end,
	})
	use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
	use({ "hrsh7th/cmp-cmdline", after = "cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp", after="nvim-lspconfig" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "cmp-nvim-lsp" })
	use({ "L3MON4D3/LuaSnip", wants = "friendly-snippets"})
	use({
		"jose-elias-alvarez/null-ls.nvim",
        after="nvim-lspconfig"
	})
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("user.autopairs")
		end,
	}) -- Autopairs for brackets and qoutes

	-- Snippets
	use({ "rafamadriz/friendly-snippets", module="cmp_nvim_lsp", event="InsertEnter" })

	-- Themes
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "Rigellute/shades-of-purple.vim" })
	use({ "lalitmee/cobalt2.nvim", requires = "tjdevries/colorbuddy.nvim" })
	use({ "navarasu/onedark.nvim" })
	use({ "sainnhe/everforest" })

	-- Which Key -> To be able to rememeber key bindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("user.whichkey")
		end,
	})
	-- Toggle term for terminal settings
	use({ "akinsho/toggleterm.nvim" })

	-- Discord Presence plugin
	use("andweeb/presence.nvim")

	-- Crates plugin to get crate version and names easily
	use({
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		after = "nvim-cmp",
		config = function()
			require("user.crates")
		end,
	})

	-- Extra rust features
	use({ "simrat39/rust-tools.nvim" })

	-- Using tabnine because copilot is paid
	if vim.fn.has("win32") then
		use({
			"tzachar/cmp-tabnine",
			after = "nvim-cmp",
			run = "powershell ./install.ps1",
			requires = "hrsh7th/nvim-cmp",
		})
	else
		use({
			"tzachar/cmp-tabnine",
			run = "./install.sh",
			requires = "hrsh7th/nvim-cmp",
		})
	end

	-- Vim-Illuminate smth required by LSP from nvim 0.8 onwards i think
	use({ "RRethy/vim-illuminate" })

	use({
		"lewis6991/gitsigns.nvim",
		tag = "release", -- To use the latest release
	})

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
