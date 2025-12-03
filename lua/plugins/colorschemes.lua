return {
    { "nyoom-engineering/nyoom.nvim" },
    { "bluz71/vim-moonfly-colors" },
    { "Shatur/neovim-ayu" },
    { "kepano/flexoki-neovim" },
    { "haystackandroid/carbonized" },
    { "jdsimcoe/abstract.vim" },
    { "Mofiqul/vscode.nvim" }, -- funny
    {
        "sho-87/kanagawa-paper.nvim", -- god tier
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     vim.cmd("colorscheme kanagawa-paper")
        -- end
    },
    { "AlexvZyl/nordic.nvim", },
    { "slugbyte/lackluster.nvim", },
    {
        "folke/tokyonight.nvim",
        opts = { style = "moon" },
    },
    { "marko-cerovac/material.nvim", },
    { "rose-pine/neovim", },
    {
        "sainnhe/gruvbox-material",  -- god tier
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvbox-material")
        end
    },
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
    { "EdenEast/nightfox.nvim" }, -- Nordfox variant is good. Basically a better nord
    { "catppuccin/nvim" }, -- good
    { "oahlen/iceberg.nvim" },
    { "cocopon/iceberg.vim" },
    {
        "savq/melange-nvim", -- kinda like
    },
    { "xero/miasma.nvim" }, -- not bad
    { "srcery-colors/srcery-vim" },
    { "fenetikm/falcon" },
    { "embark-theme/vim" },
    { "fcpg/vim-fahrenheit" },
    { "ellisonleao/gruvbox.nvim" },
    { "ayu-theme/ayu-vim" },
    { "altercation/vim-colors-solarized" },
    {
        "junegunn/seoul256.vim", -- classic
        config = function()
            -- Dark theme range: 233 (darkest) ~ 239 (lightest)
            -- Default: 237
            -- Light theme range: 252 (darkest) ~ 256 (lightest)
            -- Default: 253
            vim.g.seoul256_background = 234
        end
    },
    { "nordtheme/vim" },
    { "rakr/vim-one" },
    { "maxmx03/solarized.nvim" },
}
