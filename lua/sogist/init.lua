vim.deprecate = function() end --TODO: Remove this

-- Set personal vim settings
require("sogist.remap") -- This must come before lazy because it defines leader key
require("sogist.vim-settings")

-- Set OS specific settings
local has = vim.fn.has
local is_mac = has("macunix")
local is_linux = has("unix")
local is_win = has("win32")
local is_wsl = has("wsl")

if is_linux then
	require("sogist.linux")
end
if is_mac then
	require("sogist.macos")
end
if is_win then
	require("sogist.windows")
end
if is_wsl then
	require("sogist.wsl")
end

-- Install Plugins with Lazy.nvim
require("sogist.lazy")

-- Print a nice message in the status line
local a = { "Rip and tear", }
local r = math.random(#a)
print(a[r])
