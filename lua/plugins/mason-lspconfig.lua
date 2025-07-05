return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        -- Default handler (runs for every installed server)
        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local capabilities = require('blink.cmp').get_lsp_capabilities()
                    require("lspconfig")[server_name].setup { capabilities = capabilities }
                end
            },
        })
    end,
}
