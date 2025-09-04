-- ~/.config/nvim/lua/plugins/copilot.lua

return {
  -- 1. The main Copilot plugin
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          -- You can customize keymaps here if you want
          keymap = {
            accept = "<C-l>",
            dismiss = "<C-h>",
          },
        },
        panel = {
          enabled = false,
        },
      })
    end,
  },

  -- 2. The nvim-cmp source for Copilot
  {
    "zbirenbaum/copilot-cmp",
    -- This is the crucial line that fixes the error 🧩
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
