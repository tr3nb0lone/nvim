return {
	"ThePrimeagen/99",
	keys = {
		{
			"<leader>9i",
			function()
				require("99").info()
			end,
			mode = "n",
			desc = "99: Info",
		},
		{
			"<leader>9f",
			function()
				require("99").fill_in_function()
			end,
			mode = "n",
			desc = "99: Fill in function",
		},
		{
			"<leader>9v",
			function()
				require("99").visual()
			end,
			mode = "v",
			desc = "99: Visual",
		},
		{
			"<leader>9o",
			function()
				require("99").open()
			end,
			mode = "n",
			desc = "99: Get recent tutorials",
		},
		{
			"<leader>9s",
			function()
				require("99").search()
			end,
			mode = "n",
			desc = "99: Visual Search",
		},
		{
			"<leader>9x",
			function()
				require("99").stop_all_requests()
			end,
			mode = "n",
			desc = "99: Stop all requests",
		},
		{
			"<leader>9t",
			function()
				require("99").tutorial() -- this is sooo OP!
			end,
			mode = "n",
			desc = "99: Generate a Tutorial",
		},
		{
			"<leader>9vv",
			function()
				require("99").visual()
			end,
			mode = "v",
			desc = "99: Visual.",
		},
		{
			"<leader>9vp",
			function()
				require("99").visual_prompt() -- not working ATM
			end,
			mode = "v",
			desc = "99: Visual prompt.",
		},
		{
			"<leader>9fd",
			function()
				require("99").fill_in_function()
			end,
			mode = "n",
			desc = "99: Fill in function (debug)",
		},
	},
	config = function()
		local _99 = require("99")
		_99.setup({
			model = "github-copilot/gpt-4o", -- refer models.dev for naming convention
			provider = _99.Providers.OpenCodeProvider,
			display_errors = true,
			logger = {
				level = _99.DEBUG,
				type = "file",
				path = "/tmp/99.debug",
				print_on_error = true,
			},
			tmp_dir = "/tmp/",
			completion = {
				source = "native",
			},
			-- md_files = { "AGENT.md", },
		})
	end,
}
