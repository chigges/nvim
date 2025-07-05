return {
    { "nvim-lua/plenary.nvim" }, -- telescope dependency, a library for neovim plugins
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",

            "debugloop/telescope-undo.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = vim.fn.executable("make") == 1,
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
        },
        config = function()
            -- telescope-undo extension
            require("telescope").setup({
                extensions = {
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.8,
                        },
                        mappings = {
                            i = {
                                ["<Tab>"] = require("telescope-undo.actions").yank_additions,
                                ["<S-Tab>"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore,
                            },
                        },
                    },
                },
            })
            require("telescope").load_extension("undo")
            vim.keymap.set("n", "<leader>tu", ":Telescope undo<cr>", {})
        end,
    }, -- need to install sharkdp/fd and BurntSushi/ripgrep on your machine, fuzzy finder and searcher
}
