require("config.options")
require("config.os")
require("config.mise-shims")
require("core.lazy")
require("core.lsp")
require("config.keymaps")
require("config.autocmds")

-- Some colorschemes can redraw after this print when loaded.
-- Using the schedule wrapper ensures it will be written after the UI has settled.
vim.schedule(function()
    print("Config loaded")
end)
