local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General remapps:
map("n", "<leader>so", ":source <CR>", { desc = "[S]ource the config." })
map("n", "<leader>o", ":Oil <CR>", { desc = "Launch [O]il.nvim" })
map("n", "<leader>r", ":resize <CR>", { desc = "Zoom In / Resize" })

-- Diagnostics / QF:
map("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "[T]oggle [D]iagnostic messages." })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- buffer
map("n", "<C-n>", "<cmd>bprev<CR>", opts)
map("n", "<C-p>", "<cmd>bnext<CR>", opts)

map("n", "{", "<cmd>bprev<CR>", opts)
map("n", "}", "<cmd>bnext<CR>", opts)

-- split resize
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Custom:
map("n", "<leader>mn", function()
	local command = vim.fn.input("Run a command:  ")
	if command ~= "" then
		RunCommand(command)
	end
end)
map("n", "-", function()
	vim.cmd("Oil")
end, { desc = "Lauch Oil" })
map("n", "<leader>a", function()
	vim.cmd("Alpha")
end, { desc = "Launch [A]lpha dashboard" })
map("n", "<leader>md", function()
	vim.cmd("RenderMarkdown toggle")
end, { desc = "Toggle Markdown Preview" })
