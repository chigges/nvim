return {
    {
        "numToStr/Comment.nvim",
        config = function()
            vim.keymap.set('n', '<leader>cc', "gcc", { desc = "toggle comment" })
        end
    },
}
