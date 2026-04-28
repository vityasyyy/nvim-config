return {
  -- Disable flashy message/command UI
  { "folke/noice.nvim", enabled = false },

  -- Disable heavy statusline (we use custom minimal one)
  { "nvim-lualine/lualine.nvim", enabled = false },

  -- Disable fancy input/select UI
  { "stevearc/dressing.nvim", enabled = false },

  -- Disable colored TODO highlights (visual noise)
  { "folke/todo-comments.nvim", enabled = false },

  -- Disable flash.nvim (prefer native f/t/F/T motions)
  { "folke/flash.nvim", enabled = false },
}
