vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = true
vim.opt.directory = vim.fn.stdpath('data') .. '/swap//'

vim.opt.backup = false

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.showmatch = true

vim.opt.termguicolors = true
vim.opt.wildoptions = "pum"

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "100"
vim.opt.cursorline = true

--vim.opt.lazyredraw = true
vim.opt.updatetime = 50

vim.opt.history = 50

vim.opt.showcmd = true
vim.opt.ruler = true

vim.opt.confirm = true

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- ignore the default vim colorschemes when tab completing
vim.opt.wildignore:append({
	"blue.vim",
	"darkblue.vim",
	"delek.vim",
	"desert.vim",
	"elflord.vim",
	"evening.vim",
	"industry.vim",
	"habamax.vim",
	"koehler.vim",
	"lunaperche.vim",
	"morning.vim",
	"murphy.vim",
	"pablo.vim",
	"peachpuff.vim",
	"quiet.vim",
	"ron.vim",
	"shine.vim",
	"slate.vim",
	"sorbet.vim",
	"retrobox.vim",
	"torte.vim",
	"wildcharm.vim",
	"zaibatsu.vim",
	"zellner.vim",
})

vim.api.nvim_create_user_command(
	"Newc",
	":normal i#include <stdio.h><CR>#include <stdlib.h><CR>#include <stdbool.h><CR>#include <string.h><CR>#include <assert.h><CR><CR>int main(int argc, char* argv[]) {<CR><CR><TAB>return EXIT_SUCCESS;<CR>}<CR>/* vim: set tabstop=4 shiftwidth=4 fileencoding=utf-8 noexpandtab: */<C-Up><C-Up><C-Up><tab>",
	{}
) -- Inserts boilerplate for a new C program
