return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      -- Minimal: no icons, no close buttons
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      separator_style = "thin", -- or "slant", "padded_slant", "thick", "thin"
      always_show_bufferline = true,
      -- Show just filename, no path
      name_formatter = function(buf)
        return vim.fn.fnamemodify(buf.name, ":t")
      end,
      -- No diagnostics in tab (clean look)
      diagnostics = false,
      -- No offsets (no file tree sidebar offset)
      offsets = {},
      -- Simple style
      style_preset = require("bufferline").style_preset.minimal,
    },
  },
}
