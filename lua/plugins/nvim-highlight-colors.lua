return {
    -- Highlights the background of color codes eg: #558817, #f00
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            -- Ensure termguicolors is enabled if not already
            vim.opt.termguicolors = true

            require('nvim-highlight-colors').setup({})
        end

    },
}
