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
	print"Installing packer close and reopen neovim"
	vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
	-- Packer.nvim
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("windwp/nvim-autopairs") -- Autopairs for brackets and qoutes

	-- Telescope.nvim
	use({
		"nvim-telescope/telescope-fzy-native.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "ThePrimeagen/git-worktree.nvim" },
		},
	})
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
		config = function()
			require("nvim-tree").setup({})
		end,
	})

	-- Comment.nvim
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Buffer Line
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Nvim LSP and required plugins
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("tamago324/nlsp-settings.nvim")

	-- Nvim Completions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Snippets
	use("rafamadriz/friendly-snippets")

	-- Themes
	use({ "ellisonleao/gruvbox.nvim" })
	use("Mofiqul/vscode.nvim")

	-- Which Key -> To be able to rememeber key bindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
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
		config = function()
			require("crates").setup()
		end,
	})

	-- Extra rust features
	use("simrat39/rust-tools.nvim")

	-- Tabnine for ai autocompletion as github copilot does not seem to work
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

    -- Github copilot
    use ( {'github/copilot.vim'})

    -- Vim-Illuminate smth required by LSP from nvim 0.8 onwards i think
    use { 'RRethy/vim-illuminate' }

    use {
      'lewis6991/gitsigns.nvim',
       tag = 'release' -- To use the latest release
    }

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
