local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
	return
end

local servers = {
	"cssls",
	"emmet_ls",
	"clangd",
	"tsserver",
	"pyright",
	"jsonls",
	"rust_analyzer",
	"taplo",
	"sumneko_lua",
}

local settings = {
	ensure_installed = servers,
	ui = {
		icons = {},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},
	log_level = vim.log.levels.INFO,
}

lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}
	server = vim.split(server, "@")[1]

	if server == "sumneko_lua" then
		local sumneko_opts = require("config.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end
	if server == "clangd" then
		opts.capabilities.offsetEncoding = "utf-8"
        local cpp_status_ok, clangd = pcall(require, "clangd_extensions")
        if not cpp_status_ok then
            return 
        end
        clangd.setup({
            server = {
                lspconfig[server].setup(opts)
            }
        })
        goto continue
	end
	if server == "rust_analyzer" then
        local rust_opts = require("config.lsp.settings.rust")
		local rust_status_ok, rust = pcall(require, "rust-tools")
		if not rust_status_ok then
			return
		end
        rust.setup(rust_opts)
        goto continue
	end

	lspconfig[server].setup(opts)
    ::continue::
end
