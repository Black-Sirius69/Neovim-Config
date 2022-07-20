local M = {}

function M.set_theme(theme)
    if theme == "onedarker" then
        require("onedark").setup({
            style="darker"
        })
        require("onedark").load()
    elseif theme == "github" then
        require("github-theme").setup({

        })
    end
end

return M
