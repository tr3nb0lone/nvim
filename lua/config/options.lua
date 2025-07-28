local vim = vim

-- relative number (essential)
vim.opt.number = true
vim.opt.relativenumber = true

-- DAD-JOKE: leader of the pack
vim.g.mapleader = " "
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
