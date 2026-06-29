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
