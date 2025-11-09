require("config.lazy")
require("config.options")
require("config.keymaps")


-- Set the colorscheme here, 'cause why not?
vim.cmd.colorscheme 'base16-black-metal'

-- INFO: Temporary fix!
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
		cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
		init_options = {
			fallbackFlags = { "-std=c++17" },
		},
})

lspconfig.opts = {
    servers = {
	clangd = {
	mason = false,
    },
  },
}
