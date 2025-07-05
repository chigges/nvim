return {
    "RRethy/vim-illuminate",
    config = function()
        function set_illuminate_hl_groups()
            -- Get current Visual highlight definition
            local visual_hl = vim.api.nvim_get_hl(0, { name = "Visual", link = false })
            --visual_hl.bold = true      -- add bold
            visual_hl.underline = true -- add underline

            vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
            vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
            vim.api.nvim_set_hl(0, "IlluminatedWordWrite", visual_hl) -- Writes will be bold and underline
        end

        --- auto update the highlight style on colorscheme change
        vim.api.nvim_create_autocmd({ "ColorScheme" }, {
            pattern = { "*" },
            callback = function(ev)
                set_illuminate_hl_groups()
            end
        })
    end
}
