return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                ['<C-k>'] = {},  -- unmap, restoring default digraph behavior
            },

            appearance = {
                nerd_font_variant = 'mono',
            },

            completion = {
                accept = { auto_brackets = { enabled = true }, },
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
                list = { selection = { preselect = true, auto_insert = false } },
                ghost_text = { enabled = false },

                menu = { -- For nvim-highlight-colors
                    draw = {
                        components = {
                            -- customize the drawing of kind icons
                            kind_icon = {
                                text = function(ctx)
                                  -- default kind icon
                                  local icon = ctx.kind_icon
                                    -- if LSP source, check for color derived from documentation
                                    if ctx.item.source_name == "LSP" then
                                        local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                                        if color_item and color_item.abbr ~= "" then
                                          icon = color_item.abbr
                                        end
                                    end
                                    return icon .. ctx.icon_gap
                                end,
                                highlight = function(ctx)
                                    -- default highlight group
                                    local highlight = "BlinkCmpKind" .. ctx.kind
                                    -- if LSP source, check for color derived from documentation
                                    if ctx.item.source_name == "LSP" then
                                        local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                                        if color_item and color_item.abbr_hl_group then
                                          highlight = color_item.abbr_hl_group
                                        end
                                    end
                                    return highlight
                                end,
                            },
                        },
                    },
                },

            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lsp = {
                        name = 'LSP',
                        module = 'blink.cmp.sources.lsp',
                        enabled = true,
                        async = true,
                        timeout_ms = 200,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },

            signature = { enabled = true },
        },
        opts_extend = { "sources.default" }
    }
}
