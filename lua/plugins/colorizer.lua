return {
	{
        "norcalli/nvim-colorizer.lua",
        opts = { "*" },
        init = function()
            vim.opt.termguicolors = true -- for nvim-colorizer (example: #d2a23e)
        end
    }, -- Highlights the background of color codes eg: #558817
}
