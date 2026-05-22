return {
	{ "glacambre/firenvim", build = ":call firenvim#install(0)" },
	{ "shortcuts/no-neck-pain.nvim", version = "*", opts = {
		width = 150,
	} },
	{
		"ej-shafran/compile-mode.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "m00qek/baleia.nvim" }, -- just to enable coloring of ANSI escape codes in
		},
		config = function()
			---@type CompileModeOpts
			vim.g.compile_mode = {
				input_word_completion = true, -- completion
				baleia_setup = true,

				default_command = {
					python = "python %",
					lua = "lua %",
					javascript = "bun %",
					typescript = "bun %",
					c = "cc -o %:r % && ./%:r",
					cpp = "cc -std=c++23 -o %:r % && ./%:r",
					go = "go run %",
				},
			}
		end,
	},
}
