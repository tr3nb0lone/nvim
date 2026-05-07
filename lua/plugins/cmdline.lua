return {
	{
		"nvim-mini/mini.cmdline",
		opts = {
			autocomplete = {
				enable = true,
				-- Delay (in ms) after which to trigger completion
				-- Neovim>=0.12 is recommended for positive values
				delay = 0,
				predicate = nil,
				map_arrows = true,
			},
			autocorrect = {
				enable = true,
				func = nil,
			},
			autopeek = {
				enable = true,
				n_context = 1,
				predicate = nil,
				window = {
					config = {},
					statuscolumn = nil,
				},
			},
		},
	},
}
