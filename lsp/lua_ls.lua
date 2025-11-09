--- Lua language server.
--- `lua-language-server` can be installed by following the instructions [here](https://luals.github.io/#neovim-install).
--- The default `cmd` assumes that the `lua-language-server` binary can be found in `$PATH`.

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
settings = {
Lua = {
     hint = { enable = true },
     telementry = { enable = false },
     diagnostics = { globals = { "vim" } },
 },
},
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
}
