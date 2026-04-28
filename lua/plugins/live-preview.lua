return {
  {
    "brianhuster/live-preview.nvim",
    ft = { "markdown", "html" },
    config = function()
      require("livepreview.config").set({
        -- optional options
      })
    end,
  },
}
