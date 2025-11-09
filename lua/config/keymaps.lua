
-- General remapps:
vim.keymap.set('n', '<leader>so', ':source <CR>', {desc = "[S]ource the config."})
vim.keymap.set('n', '<leader>o', ':Oil <CR>', {desc = "Launch [O]il.nvim"})

-- Diagnostics:
vim.keymap.set('n', '<leader>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, {desc ="[T]oggle [D]iagnostic messages."})
vim.keymap.set('n', '<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf }) end, {desc = '[T]oggle Inlay [H]ints'})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
