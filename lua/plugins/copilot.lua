-- Copilot with blink.cmp integration (LazyVim handles blink-copilot)
-- We just configure the copilot.lua core here
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          dismiss = "<C-h>",
          next = "<C-j>",
          prev = "<C-k>",
        },
      },
      panel = { enabled = false },
    })
  end,
}
