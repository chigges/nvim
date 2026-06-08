-- Set personal vim settings
require("config.remap") -- This must come before lazy because it defines leader key
require("config.vim-settings")

-- Set OS specific settings
local has      = vim.fn.has
local is_mac   = has("macunix")
local is_linux = has("unix")
local is_win   = has("win32")
local is_wsl   = has("wsl")

-- These will set nvim to use the OS's clipboard
if is_mac then
    require("config.macos")
elseif is_wsl then
    require("config.wsl")
elseif is_linux then
    require("config.linux")
elseif is_win then
    require("config.windows")
end

-- Install Plugins with Lazy.nvim
require("config.lazy")

-- Some colorschemes can redraw after this print when loaded.
-- Using the schedule wrapper ensures it will be written after the UI has settled.
vim.schedule(function()
    -- Print a nice message in the status line
    local welcome_messages = { "Rip and tear", "Wake up time to die", "War never changes", "Finish him!",
        "Heaven or hell?", "All your base are belong to us", "Nothing is true, everything is permitted",
        "You exist because we allow it", }
    local random_index = math.random(#welcome_messages)
    print(welcome_messages[random_index])
end)
