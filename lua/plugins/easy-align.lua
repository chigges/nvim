return {
    {
        "junegunn/vim-easy-align",
        config = function()
            vim.api.nvim_set_keymap("x", "gs", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
            vim.api.nvim_set_keymap("n", "gs", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
        end,
    },
}
