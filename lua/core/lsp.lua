vim.lsp.enable({
    "lua_ls",
    "rust-analyzer",
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })

        --[[ This is the "default" nvim method, but I have replaced this in my config with conform.nvim. Rewrote this in that file
        --   Essentially, this checks if there is a client attached that supports formatting and if the current buffer is a lua file.
        --   Then, it formats the buffer on save.
        if client.supports_method('textDocument/formatting', 0) and vim.bo.filetype == "lua" then
            -- Format current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    --vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
        --]]
    end,
})
