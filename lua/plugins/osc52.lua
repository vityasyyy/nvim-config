return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    require("osc52").setup({
      -- The TUI (Terminal User Interface) integration is enabled by default,
      -- so you often don't need to configure much.
      -- This setup will automatically copy on yank.
    })
  end,
}
