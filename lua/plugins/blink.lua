return {
    "saghen/blink.cmp",
    event = "LspAttach",
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        cmdline = { enabled = false },
	keymap = {
	preset = "none",
		['<CR>'] = { 'accept', 'fallback' },
		['<TAB>'] = { 'select_next', 'fallback' },
	        ['<Up>'] = { 'select_prev', 'fallback' },
		['<Down>'] = { 'select_next', 'fallback' },
		['<S-TAB>'] = { 'select_prev', 'fallback' },
		['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
},
        fuzzy = {
            implementation = "prefer_rust",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        signature = {
            enabled = true,
            window = { border = "none" },
        },
        completion = {
            documentation = {
                auto_show = true,
                window = { border = "none" },
            },
            menu = { border = "none" },
        },
        appearance = {
            nerd_font_variant = "normal",
        },
    },
}
