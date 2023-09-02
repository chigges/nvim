local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.cmd('set termguicolors') -- for nvim-colorizer #d2a23e
require("lazy").setup({
	-- Colorschemes
	{ "ellisonleao/gruvbox.nvim", }, -- lazy means it will load when the colorscheme is selected
	{ "catppuccin/nvim", priority=1000 },
	{ "folke/tokyonight.nvim", },
	{ "shaunsingh/nord.nvim", },
	{ "marko-cerovac/material.nvim", },
	{ "shaunsingh/seoul256.nvim", },
	{ "shaunsingh/nord.nvim", },
	{ "rose-pine/neovim", },
	{ "sainnhe/sonokai", },
	{ "sainnhe/edge", },
	{ "sainnhe/gruvbox-material", },
	{ "sainnhe/everforest", },
	{ "askfiy/visual_studio_code", },

	-- Pleasing Plugins
	{ "folke/drop.nvim", opts={theme="snow"},config=true }, -- makes snow fall when idle in nvim
	{ "goolord/alpha-nvim", dependencies={ "nvim-tree/nvim-web-devicons" }, opts, config=function()require("alpha").setup(require'alpha.themes.dashboard'.config)end }, -- customizable neovim greeter
	{ "nvim-lualine/lualine.nvim", dependencies='nvim-tree/nvim-web-devicons', config=true }, -- nvim version of airline

	-- Useful plugins
	{ "iamcco/markdown-preview.nvim", build=function() vim.fn["mkdp#util#install"]() end, config=function() vim.g.mkdp_filetypes = { "markdown" }; vim.g.mkdp_browser='/usr/bin/firefox' end, ft="markdown" }, -- use <leader>mp to view the current markdown file
	{ "junegunn/vim-easy-align" }, -- use gaip to align the current block of code
	{ "nvim-lua/plenary.nvim" }, -- telescope dependency, a library for neovim plugins
	{ "nvim-telescope/telescope.nvim", tag='0.1.2', dependencies={ "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" }, config = function() end,}, -- need to install sharkdp/fd and BurntSushi/ripgrep on your machine, fuzzy finder and searcher
	{ "nvim-treesitter/nvim-treesitter", build=":TSUpdate" }, -- accurate syntax hilighting, indentation, and other editing features
	{ "windwp/nvim-autopairs", event = "InsertEnter" }, -- automatically pairs quotes, parenthesis, brackets etc.
	{ "lewis6991/gitsigns.nvim", config=true }, -- git decoations for added, removed, and changed lines
	{ "numToStr/Comment.nvim", config=true }, -- binds gcc toggle comment for current line
	{ "norcalli/nvim-colorizer.lua", opts = {'*'}, config = true }, -- Highlights the background of color codes eg: #558817
	{ "lukas-reineke/indent-blankline.nvim", opts={show_current_context = true, show_current_context_start = true}, config=true}, -- adds indentation guides
	{ "nvim-tree/nvim-tree.lua", view = {width = 30,}, renderer = {group_empty = true,},filters = {dotfiles = true,}, config=true }, -- file explorer
	{ "lervag/vimtex",  ft="tex" },
	{ "kaarmu/typst.vim", ft='typst', lazy=false },
	{ "github/copilot.vim", lazy=false },
	{ "folke/which-key.nvim", event = "VeryLazy", init = function() vim.o.timeout=true vim.o.timeoutlen=750 end, opts = {}},
	{ "folke/zen-mode.nvim", opts = {}},
	{ "akinsho/toggleterm.nvim", verison = "*", config=true},
	{ "neoclide/vim-jsx-improve" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
	{ "dstein64/vim-startuptime" },

	-- LSP Support
	{ "neoclide/coc.nvim", branch="release" }, -- autocomplete
	{ "neoclide/coc-snippets" }, -- snippetscomplete
	{ "neoclide/coc-tsserver" },
	{ "neoclide/coc-prettier" },
	{ "neoclide/coc-eslint" },
	{ "neoclide/coc-tslint" },
	{ "neoclide/coc-css" },
	{ "neoclide/coc-lists" },
	{ "neoclide/coc-highlight" },
})

vim.keymap.set('n', '<leader>l', ":Lazy<CR>", {})
