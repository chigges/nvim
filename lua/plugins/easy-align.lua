return {
	{
		"junegunn/vim-easy-align",
		config = function()
			vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
			vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
		end,
	},
}
