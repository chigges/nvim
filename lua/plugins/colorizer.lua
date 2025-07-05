return {
    -- Highlights the background of color codes eg: #558817, Wheat, #f00
    {
        "norcalli/nvim-colorizer.lua",
        opts = { "*" },
        init = function()
            vim.opt.termguicolors = true -- for nvim-colorizer (example: #d2a23e)
        end
    },
}
