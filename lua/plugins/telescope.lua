return {
	{ "nvim-lua/plenary.nvim" }, -- telescope dependency, a library for neovim plugins
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
            
			"debugloop/telescope-undo.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				enabled = vim.fn.executable("make") == 1,
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		config = function()
            -- Set key binds
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files"})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "find (live) grep"})
			vim.keymap.set("v", "<leader>fg", builtin.grep_string, { desc = "find current selection" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers"})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help tags"})
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "find git files" })
			vim.keymap.set("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "fuzzy find current buffer"})

            local keymap = vim.keymap -- For conciseness
            local opts = { noremap = true, silent = true }
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- See available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show	diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            -- end keybinds

			-- telescope-undo extension
			require("telescope").setup({
				extensions = {
					undo = {
						side_by_side = true,
						layout_strategy = "vertical",
						layout_config = {
							preview_height = 0.8,
						},
						mappings = {
							i = {
								["<Tab>"] = require("telescope-undo.actions").yank_additions,
								["<S-Tab>"] = require("telescope-undo.actions").yank_deletions,
								["<cr>"] = require("telescope-undo.actions").restore,
							},
						},
					},
				},
			})
			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>tu", ":Telescope undo<cr>", {})
		end,
	}, -- need to install sharkdp/fd and BurntSushi/ripgrep on your machine, fuzzy finder and searcher
}
