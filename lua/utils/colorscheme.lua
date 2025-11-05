-- the best nvim colorscheme(s)!
return {
  'RRethy/base16-nvim',
  'bluz71/vim-moonfly-colors',
  name = 'base16-black-metal',
  -- name = 'moonfly',
  lazy = false,
  -- this priority enables the plugin to load before anything!
  priority = 1000,
  config = function()
    -- vim.cmd.colorscheme 'moonfly'
    vim.cmd.colorscheme 'base16-black-metal'
  end,
}
