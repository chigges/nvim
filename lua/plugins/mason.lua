return {
    "mason-org/mason.nvim",
    opts = {
        ensure_installed = {
            "clangd",
        }
    },
    config = function(_, opts)
        require("mason").setup(opts)
        vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason" })
    end,
}
