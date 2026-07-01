return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	keys = {
		{
			"<leader>cp",
			function()
				vim.cmd("CopilotSessionToggle")
			end,
			desc = "Toggle Copilot",
		},
	},
	opts = {
		panel = {
			enabled = false,
		},
		suggestion = {
			enabled = true,
			auto_trigger = false,
			debounce = 75,
			keymap = {
				accept = "<C-y>",
				accept_word = false,
				accept_line = false,
				next = "<M-c>",
				prev = "<M-p>",
				dismiss = "<C-]>",
			},
		},
		filetypes = {
			go = true,
			lua = true,
			c = true,
			make = true,
			nix = true,
			sh = function()
				if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
					return false -- disable for .env files
				end
				return true
			end,
			["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
		},
		copilot_node_command = "node",
		server_opts_overrides = {
			settings = {
				advanced = {
					secretStorage = "file", -- Forces it to use file storage instead of keytar/libsecret
				},
			},
		},
		config = function(_, opts)
			require("copilot").setup(opts)
			vim.g.copilot_session_enabled = false -- this makes is  ACTUALLY efficient.
			vim.schedule(function()
				vim.cmd("Copilot disable")
			end)
		end,
	},
}
