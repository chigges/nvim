return {
    -- find/replace for words with different forms
    -- Example usage:
    -- :%Subvert/facilit{y,ies}/building{,s}/g
    {
        "tpope/vim-abolish",
        config = function()
            vim.cmd("let g:abolish_no_mappings = 1")
        end,
    }
}
