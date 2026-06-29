local getFullNvimVersion = function()
	local version = vim.version()
	return "Neovim " .. string.format("%d.%d.%d", version.major, version.minor, version.patch)
end
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
					{ icon = " 󰈆  ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = getFullNvimVersion(), -- the "banner"
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
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = false },
	},
}
