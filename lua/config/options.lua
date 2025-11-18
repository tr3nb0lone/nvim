-- Sync clipboard
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "white", bg = "none" })

-- relative number (essential)
vim.opt.number = true
vim.opt.relativenumber = true
-- DAD-JOKE: leader of the pack
vim.g.mapleader = " "

vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.clipboard = 'unnamedplus'

-- Lines:
vim.opt.cursorline = true
