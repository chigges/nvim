return {
    "stevearc/conform.nvim",
    opts = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua", lsp_format = "fallback" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
                cpp = { "clang-format", lsp_format = "fallback" },
            },
        })

        local filetype = vim.bo.filetype
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.lua",
            callback = function(args) require("conform").format({ bufnr = args.buf }) end,
        })

        -- manual format keybind
        vim.keymap.set({ "n", "x" }, "<leader>fm", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format file or visual seletion" })
    end,
}
