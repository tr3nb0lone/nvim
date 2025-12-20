return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 500
    end,
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      nes = {
        enabled = false,
        keymap = {
          accept_and_goto = "<C-y>",
          accept = false,
          dismiss = "<Esc>",
        },
      },
    })
  end,
}
