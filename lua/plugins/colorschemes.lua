return {
    { "nyoom-engineering/nyoom.nvim" },
    { "bluz71/vim-moonfly-colors" },
    { "savq/melange-nvim" },
    { "Shatur/neovim-ayu" },
    { "kepano/flexoki" },
    { "haystackandroid/carbonized" },
    { "jdsimcoe/abstract.vim" },
    { "Mofiqul/vscode.nvim", },
    { "sho-87/kanagawa-paper.nvim", },
    { "AlexvZyl/nordic.nvim", },
    { "slugbyte/lackluster.nvim", },
    {
        "folke/tokyonight.nvim",
        opts = { style = "moon" },
    },
    { "marko-cerovac/material.nvim", },
    { "rose-pine/neovim", },
    { "sainnhe/gruvbox-material", },
    { "rebelot/kanagawa.nvim", },
    {
        "neanias/everforest-nvim",
        version = false,
        config = function()
            require("everforest").setup({
                background = "soft"
            })
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd("colorscheme terafox")
        end,
    },
    { "catppuccin/nvim" },
}
