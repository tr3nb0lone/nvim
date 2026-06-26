return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cmd = "Copilot",
	keys = {
		{
			"<leader>cp",
			function()
				local client = vim.lsp.get_clients({ name = "copilot" })[1]
				if client and not vim.b.copilot_disabled then
					vim.cmd("Copilot disable")
					vim.notify("Copilot Disabled", vim.log.levels.INFO, { title = "Copilot" })
				else
					vim.cmd("Copilot enable")
					vim.notify("Copilot Enabled", vim.log.levels.INFO, { title = "Copilot" })
				end
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
				next = "<M-y>",
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
	},
}
