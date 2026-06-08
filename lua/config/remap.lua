local remap = vim.keymap.set

-- Leader key set in lazy.lua

-- F keys

remap("n", "<F1>", ":h ")        -- help on some function
remap("n", "<F2>", ":tabe ")     -- open a file in a new tab
remap("n", "<F3>", ":w<cr>")     -- save current file
remap("n", "<F4>", ":q<cr>")     -- close current file
remap("n", "<S-F4>", ":q!<cr>")  -- close current file (without saving!)
remap("n", "<F8>", ":noh<cr>")   -- stop highlight search
remap("n", "<F11>", "!make<cr>") -- run first make rule/target


-- Hacky way to run a simple C file
remap("n", "<F12>", ":w<cr>:!gcc -o placeholder % -lm && ./placeholder && rm -f placeholder<CR>")

-- Quality of Life

vim.g.mapleader = " " -- set leader key to space
remap("n", ";", ":")  -- saves on pressing shift for :
remap("n", "<C-k>", "<C-w>k", { desc = "move up a window" })
remap("n", "<C-j>", "<C-w>j", { desc = "move down a window" })
remap("n", "<C-h>", "<C-w>h", { desc = "move left a window" })
remap("n", "<C-l>", "<C-w>l", { desc = "move right a window" })
remap("n", "<C-Up>", ":resize +2<cr>", { desc = "resize window up" })
remap("n", "<C-Down>", ":resize -2<cr>", { desc = "resize window down" })
remap("n", "<C-Left>", ":vertical resize +2<cr>", { desc = "resize window left" })
remap("n", "<C-Right>", ":vertical resize -2<cr>", { desc = "resize window right" })
--remap("n", "<leader>h", ":split<cr>", { desc = "split window horizontally" })
remap("n", "<leader>v", ":vsplit<cr>", { desc = "split window vertically" })
remap("n", "<leader>q", ":q<cr>", { desc = "close current window" })
remap("n", "<leader>Q", ":q!<cr>", { desc = "force close current window" })
remap("n", "<leader>w", ":w<cr>", { desc = "save current file" })
remap("n", "<leader>W", ":wa<cr>", { desc = "save all files" })

remap("t", "<Esc>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true, desc = "Exit terminal" })

remap("n", "<leader>0", ":tabe ~/.config/nvim/<cr>", { desc = "open nvim config" }) -- open init.lua

remap("n", "<leader>d", vim.diagnostic.open_float, { desc = "open diagnostic" })
remap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "lsp rename" })
remap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })
