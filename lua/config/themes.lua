local M = {}

function M.set_theme(theme)
    local colorscheme = ""
    if theme == "onedarker" then
        require("onedark").setup({
            style="darker"
        })
        require("onedark").load()
    end

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
        return
    end
end

return M
