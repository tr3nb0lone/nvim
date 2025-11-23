local map = vim.keymap.set

-- General remapps:
map('n', '<leader>so', ':source <CR>', {desc = "[S]ource the config."})
map('n', '<leader>o', ':Oil --float <CR>', {desc = "Launch [O]il.nvim"})
map("n", "-", function () vim.cmd('botright split') vim.cmd('resize 15') vim.cmd('Oil') end, {desc = "Lauch Oil - Emacs-style"}) -- split, rezise , launch

-- Diagnostics:
map('n', '<leader>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, {desc ="[T]oggle [D]iagnostic messages."})
map('n', '<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf }) end, {desc = '[T]oggle Inlay [H]ints'})
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Custom:
map('n', '<leader>mn', function()
    local command = vim.fn.input("Run a command:  ")
    if command ~= "" then RunCommand(command) end
end)
map("n", "-", function () vim.cmd('botright split') vim.cmd('resize 15') vim.cmd('Oil') end, {desc = "Lauch Oil - Emacs-style"})
