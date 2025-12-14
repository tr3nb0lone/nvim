---@brief
--- https://github.com/oxalica/nil
--- A new language server for Nix Expression Language.
---
--- If you are using Nix with Flakes support, run `nix profile install github:oxalica/nil` to install.
--- Check the repository README for more information.

---@type vim.lsp.Config
return {
  cmd = { 'nil' },
  settings = {
    ['nil.nix.flake'] = {
      autoArchive = true,
      autoEvalInputs = true,
    },
  },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
}
