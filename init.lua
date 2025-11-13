require("config.lazy")
require("config.lsp")
require("config.options")
require("config.keymaps")
require("config.autocmds")


-- Set the colorscheme here, 'cause why not?
vim.cmd.colorscheme 'base16-black-metal'

-- Sync clipboard
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
