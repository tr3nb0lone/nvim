return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    require('telescope').setup {
      --  All the info you're looking for is in `:help telescope.setup()`
	 defaults = { theme = "get_ivy", },
      extensions = {},
  colorscheme = { enable_preview = true },
  }

   -- NOTE: Remember the Lua is also a language rehtoric"
   -- See `:help telescope.builtin`
    local set = vim.keymap.set
    local builtin = require 'telescope.builtin'
    set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
    set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
    set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
    set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
    set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
    set('n', '<leader>cs', builtin.colorscheme, { desc = '[F]ind [C]olor[s]cheme' })
    set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    set('n', '<leader>fn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = '[F]ind [N]eovim files' })
  end,
}
