local v = vim
local set = vim.opt

-- Sync clipboard
v.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
v.api.nvim_set_hl(0, "CursorLineNr", { fg = "white", bg = "none" })

-- relative number (essential)
set.number = true
set.relativenumber = true


set.mouse = 'a'
set.showmode = false
set.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
set.clipboard = 'unnamedplus'
set.cursorline = true

set.smartcase = true
set.ignorecase = true

set.smartindent = true
set.termguicolors = true

set.backup = false
set.undofile = true
set.swapfile = false
set.undolevels = 10000
set.undodir = os.getenv("HOME") .. "/.nvim/undodir"

-- Lines:
v.api.nvim_set_hl(0, "CursorLineNr", { fg = "white", bg = "none" })

-- Set the colorscheme here, 'cause why not?
v.cmd.colorscheme 'base16-black-metal'
