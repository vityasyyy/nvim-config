return {
  {
    "brianhuster/live-preview.nvim",
    ft = { "markdown", "html" }, -- Load only for these file types
    config = function()
      require("live-preview").set({
        -- Optional configuration options here
        -- For example, you can specify the default browser or port
      })
    end,
  },
  -- other plugins
}
