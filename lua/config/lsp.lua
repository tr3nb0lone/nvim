
-- INFO: read filenames on lsp/ directory and enable those
local lsp_files = {}
local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"

for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
-- Read the first line of the file
local f = io.open(file, "r")
local first_line = f and f:read("*l") or ""
if f then f:close() end

-- Only include the file if it doesn't start with "-- disable"
if not first_line:match("^%-%- disable") then
	local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
	table.insert(lsp_files, name)
 end
end

vim.lsp.enable(lsp_files)

-- Diagnostic Config
-- NOTE: see :help vim.diagnostic.Opts
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
  float = {
	focusable = true,
	style = "minimal",
	border = "rounded",
	source = true,
	header = "",
	prefix = "",
},
signs = {
	text = {
		[vim.diagnostic.severity.HINT] = " ",
		[vim.diagnostic.severity.INFO] = " ",
		[vim.diagnostic.severity.WARN] = " ",
		[vim.diagnostic.severity.ERROR] = " ",
},
},})

vim.api.nvim_create_autocmd("LspAttach", {
desc = "LSP actions",
callback = function(args)
	local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
	if not client then
		return
	end

	-- NOTE:  Disable default formatting
	if client.name == "tsserver" then client.server_capabilities.documentFormattingProvider = false end
	if client.name == "lua_ls" then client.server_capabilities.documentFormattingProvider = false end

	-- NOTE: Remember that Lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself.
	local map = function(keys, func, desc, mode)
		mode = mode or 'n'
		vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
	end

	map("K", vim.lsp.buf.hover, "Open hover")
	map('gd', ":belowright split | lua vim.lsp.buf.definition()<CR>", '[G]oto [D]efinition')
	map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
	map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
	map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
	map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

	-- Diagnostics
        map("<leader>th", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, "Toggle inlay hints")
	map("dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Goto next diagnostic")
	map("dN", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Goto prev diagnostic")
	map("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
	map("<leader>e", vim.diagnostic.open_float, "Open diagnostic float")

  end,
})
