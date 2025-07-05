return {
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }

            vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", {}) -- markdown preview
            vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", {}) -- markdown stop
            vim.keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", {}) -- markdown toggle
        end,
        ft = "markdown",
    },
}
