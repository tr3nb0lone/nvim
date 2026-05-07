return {
	"dmtrKovalenko/fff.nvim",
	build = "nix run .#release",
	opts = { -- (optional)
		title = "fff.nvim",
		prompt = "FFF:  ",
	},
	-- No need to lazy-load with lazy.nvim.
	-- This plugin initializes itself lazily.
	lazy = false,
	keys = {
		{
			"<leader><leader>", -- typical usage
			function()
				require("fff").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>g", -- live grep
			function()
				require("fff").live_grep()
			end,
			desc = "Find by [G]rep",
		},
		{
			"<leader>fn", -- nvim config
			function()
				require("fff").find_files_in_dir(vim.fn.stdpath("config"))
			end,
			desc = "[F]ind [N]eovim files",
		},
	},
}
