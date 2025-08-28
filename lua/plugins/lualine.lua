return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            vim.opt.cmdheight = 0
            vim.opt.laststatus = 3

            require('lualine').setup()
        end,
    }, -- nvim version of airline
}
