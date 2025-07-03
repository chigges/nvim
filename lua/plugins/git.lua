return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
            current_line_blame = true,
		},
		init = function()
            require('gitsigns').setup{
                --...
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                      opts = opts or {}
                      opts.buffer = bufnr
                      vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']h', function()
                      if vim.wo.diff then
                        vim.cmd.normal({']h', bang = true})
                      else
                        gitsigns.nav_hunk('next')
                      end
                    end)

                    map('n', '[h', function()
                      if vim.wo.diff then
                        vim.cmd.normal({'[h', bang = true})
                      else
                        gitsigns.nav_hunk('prev')
                      end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "stage hunk" })
                    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "reset hunk" })
                    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "stage hunk" })
                    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "reset hunk" })
                    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "stage buffer" })
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })
                    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "reset buffer" })
                    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "preview hunk" })
                    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { desc = "blame line" })
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "toggle current line blame" })
                    map('n', '<leader>hd', gitsigns.diffthis, { desc = "diffthis" })
                    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "diffthis" })
                    map('n', '<leader>td', gitsigns.toggle_deleted, { desc = "toggle_deleted" })

                    -- Text object
                    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
              end
            }
        end,
	},
	-- {
	-- 	"github/copilot.vim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.g.copilot_assume_mapped = true
	--
	-- 		-- Change copilot completion keymap
	-- 		vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
	-- 		vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(copilot-next)", { silent = true })
	-- 		vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(copilot-previous)", { silent = true })
	-- 	end,
	-- },
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status"})
			vim.keymap.set("n", "<leader>ga", ":Git add %<cr>", { desc = "Git add current file"})
			vim.keymap.set("n", "<leader>gc", ":Git commit<cr>", { desc = "Git commit"})
			vim.keymap.set("n", "<leader>gp", ":Git push<cr>", { desc = "Git push"})
		end,
	},
    {
        "sindrets/diffview.nvim",
    },
}
