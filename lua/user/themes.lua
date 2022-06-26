local function set_theme(name)
	if name == "gruvbox" then
		vim.cmd([[colorscheme gruvbox]])
	elseif name == "vscode" then
		vim.cmd([[colorscheme darkplus]])
	elseif name == "shades of purple" then
		vim.cmd([[colorscheme shades_of_purple]])
	elseif name == "cobalt" then
		require("colorbuddy").colorscheme("cobalt2")
	elseif name == "onedark" then
		require("onedark").setup({
			style = "darker",
		})
		require("onedark").load()
    end
end

set_theme("onedark")
