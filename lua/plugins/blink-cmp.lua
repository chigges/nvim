return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                nerd_font_variant = 'mono',
            },

            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
                list = { selection = { preselect = true, auto_insert = false } },
                ghost_text = { enabled = false },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },

            signature = { enabled = true }
        },
        opts_extend = { "sources.default" }
    }
}
