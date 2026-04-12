-- the best nvim colorscheme(s)!
-- typically I'd rotate around gorgoroth, emperor, dark-funeral and this.
return {
	{ "metalelf0/black-metal-theme-neovim" },
	{
		"bjarneo/aether.nvim",
		branch = "v3",
		name = "aether",
		priority = 1000,
		opts = {
			colors = {
				bg = "#000000",
				dark_bg = "#0e0e0e",
				darker_bg = "#090909",
				lighter_bg = "#2a2a2a",

				fg = "#ffffff",
				dark_fg = "#bfbfbf",
				light_fg = "#ffffff",
				bright_fg = "#ffffff",
				muted = "#9e9e9e",

				red = "#ef5946",
				yellow = "#999b4b",
				orange = "#f17262",
				green = "#6bb465",
				cyan = "#36afa5",
				blue = "#3d8ac4",
				purple = "#981a49",
				brown = "#91443b",

				bright_red = "#f97665",
				bright_yellow = "#b8bb54",
				bright_green = "#90d08a",
				bright_cyan = "#3ed0c4",
				bright_blue = "#5daef8",
				bright_purple = "#ff5ea3",

				accent = "#3d8ac4",
				cursor = "#ffffff",
				foreground = "#ffffff",
				background = "#ffffff",
				selection = "#16070F",
				selection_foreground = "#2a2a2a",
				selection_background = "#2a2a2a",
			},
		},
		-- set up hot reload
		config = function(_, opts)
			require("aether").setup(opts)
			vim.cmd.colorscheme("aether")
			require("aether.hotreload").setup()
		end,
	},
}
