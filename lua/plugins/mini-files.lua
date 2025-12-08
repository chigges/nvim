return {
    {
        'nvim-mini/mini.files',
        version = false,
        config = function()
            local MiniFiles = require("mini.files")

            MiniFiles.setup({
                windows = {
                    preview = true
                },
                mappings = {
                    go_in_plus = 'l',
                    go_in = '',
                },
            })

            -- Open from the path of the current buffer and show root directory
            vim.keymap.set("n", "-", function()
                if not MiniFiles.close() then -- Will close the file viewer if already open. If not open, we will continue to open it
                    local buf_name = vim.api.nvim_buf_get_name(0)
                    local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
                    MiniFiles.open(path)
                    MiniFiles.reveal_cwd()
                end
            end, { desc = "Toggle Open Mini Files" })
        end
    },
}
