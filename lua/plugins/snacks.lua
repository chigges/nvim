return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- This plugin is a "best of" QoL plugins.
            -- Not every plugin available is being used.
            --
            -- Activated plugins:
            animate   = { enabled = true },
            bigfile   = { enabled = true },
            gitbrowse = { enabled = true },
            image     = { enabled = true },
            indent    = { enabled = true },
            input     = { enabled = true },
            picker    = { enabled = true },
            scroll    = { enabled = true },
        },
        keys = {
            { "<leader>ff", function() Snacks.picker.smart() end,            desc = "Smart find files" },
            { "<leader>fg", function() Snacks.picker.git_files() end,        desc = "find git files" },
            { "<leader>/",  function() Snacks.picker.grep() end,             desc = "grep" },
            { "<leader>gb", function() Snacks.picker.git_branches() end,     desc = "Git branches" },
            { "<leader>sh", function() Snacks.picker.git_diff() end,         desc = "search git diff" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end,      desc = "search diagnostics" },
            { "<leader>su", function() Snacks.picker.undo() end,             desc = "search undo history" },
            { "<leader>sh", function() Snacks.picker.help() end,             desc = "search help pages" },
            { "<leader>st", function() Snacks.picker.todo_comments() end,    desc = "search todo comments" },
            { "<leader>cc", function() Snacks.picker.colorschemes() end,     desc = "colorschemes" },
            -- LSP
            { "gd",         function() Snacks.picker.lsp_definitions() end,  desc = "goto definition" },
            { "gD",         function() Snacks.picker.lsp_declarations() end, desc = "goto declaration" },

            { "<leader>bg", function() Snacks.gitbrowse() end,               desc = "Browse Git" }
        },
    },
    {
        "folke/flash.nvim",
        optional = true,
        specs = {
            {
                "folke/snacks.nvim",
                opts = {
                    picker = {
                        win = {
                            input = {
                                keys = {
                                    ["<a-s>"] = { "flash", mode = { "n", "i" } },
                                    ["s"] = { "flash" },
                                },
                            },
                        },
                        actions = {
                            flash = function(picker)
                                require("flash").jump({
                                    pattern = "^",
                                    label = { after = { 0, 0 } },
                                    search = {
                                        mode = "search",
                                        exclude = {
                                            function(win)
                                                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~=
                                                    "snacks_picker_list"
                                            end,
                                        },
                                    },
                                    action = function(match)
                                        local idx = picker.list:row2idx(match.pos[1])
                                        picker.list:_move(idx, true, true)
                                    end,
                                })
                            end,
                        },
                    },
                },
            },
        },
    }
}
