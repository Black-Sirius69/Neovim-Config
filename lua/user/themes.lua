local function set_theme(name)
	if name == "gruvbox" then
		require("gruvbox").setup({
			underline = false,
		})
		vim.cmd([[
        colorscheme gruvbox
        hi Normal guibg=None ctermbg=None
        ]])
	elseif name == "vscode" then
		vim.g.vscode_transparent = 1
		vim.g.vscode_italic_comment = 1
		vim.g.vscode_disable_nvimtree_bg = true
		vim.cmd([[colorscheme vscode]])
	elseif name == "onedark" then
		require("onedark").setup({
			style = "darker",
			transparent = true,
		})
		require("onedark").load()
	elseif name == "everforest" then
		vim.cmd([[
        let g:everforest_better_performance = 1
        let g:everforest_background = 'hard'
        let g:everforest_transparent_background = 1
        colorscheme everforest
        ]])
	end
end

set_theme("onedark")
