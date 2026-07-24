return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      separator_style = "thin",
      always_show_bufferline = true,
      name_formatter = function(buf)
        return vim.fn.fnamemodify(buf.name, ":t")
      end,
      diagnostics = "none",
      offsets = {},
      style_preset = require("bufferline").style_preset.minimal,
    },
  },
}
