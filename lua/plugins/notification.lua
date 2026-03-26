return {

	"nvim-mini/mini.notify",
	version = "*",
	opts = {
		-- Content management
		content = {
			-- Function which formats the notification message
			-- By default prepends message with notification time
			format = nil,

			-- Function which orders notification array from most to least important
			-- By default orders first by level and then by update timestamp
			sort = nil,
		},

		-- Notifications about LSP progress
		lsp_progress = {
			enable = false, -- fidget got me covered
			level = "INFO",
			duration_last = 1000,
		},

		window = {
			-- Floating window config
			config = {},

			-- Maximum window width as share (between 0 and 1) of available columns
			max_width_share = 0.433,

			-- Value of 'winblend' option
			winblend = 25,
		},
	},
}
