return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			width = 40,
			preset = {
				pick = nil,
				keys = {
					{ icon = " 󱐌  ", key = "s", desc = "restore-Session", action = ":AutoSession search <CR>" },
					{ icon = "   ", key = "r", desc = "Recent(s)", action = ":FzfLua oldfiles <CR>" },
					{ icon = "   ", key = "H", desc = "checkHealth", action = ":checkhealth <CR>" },
					{
						icon = " 󰒲  ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " 󰈆  ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[ Neovim ]], -- the "banner"
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		input = { enabled = true },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
