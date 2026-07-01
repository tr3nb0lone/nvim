-- INFO: all the helper snippets I defined go here!
function RunCommand(command)
	-- LOGIC: Split output into lines -> create quickfix items -> populate quickfix list (temporarily) and display
	local output = vim.fn.system(command)
	local lines = {}
	for line in output:gmatch("[^\r\n]+") do
		if line ~= "" then
			table.insert(lines, { filename = "", text = line })
		end
	end
	vim.fn.setqflist({}, " ", { title = "output: " .. command, items = lines })
	vim.cmd("copen 12")
end

-- copilot copilot copilot
-- User commands for explicit control
vim.api.nvim_create_user_command("CopilotSessionStart", function()
	vim.g.copilot_session_enabled = true
	vim.cmd("Copilot enable")
	vim.notify("Copilot Session: ON", vim.log.levels.INFO, { title = "Copilot" })
end, {})

vim.api.nvim_create_user_command("CopilotSessionStop", function()
	vim.g.copilot_session_enabled = false
	vim.cmd("Copilot disable")
	vim.notify("Copilot Session: OFF", vim.log.levels.INFO, { title = "Copilot" })
end, {})

vim.api.nvim_create_user_command("CopilotSessionToggle", function()
	vim.g.copilot_session_enabled = not vim.g.copilot_session_enabled
	if vim.g.copilot_session_enabled then
		vim.cmd("Copilot enable")
		vim.notify("Copilot Session: ON", vim.log.levels.INFO, { title = "Copilot" })
	else
		vim.cmd("Copilot disable")
		vim.notify("Copilot Session: OFF", vim.log.levels.INFO, { title = "Copilot" })
	end
end, {})

vim.api.nvim_create_user_command("CopilotSessionStatus", function()
	local s = vim.g.copilot_session_enabled and "ON" or "OFF"
	vim.notify("Copilot Session: " .. s, vim.log.levels.INFO, { title = "Copilot" })
end, {})
