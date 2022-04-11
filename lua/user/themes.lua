function set_theme(name)
	if name == "gruvbox" then
		vim.cmd([[colorscheme gruvbox]])
	elseif name == "vscode" then
		vim.g.vscode_style = "dark"
		vim.g.vscode_italic_comment = 1
		vim.g.vscode_transparent = 1
		vim.cmd([[colorscheme vscode]])
	end
end

set_theme("vscode")
