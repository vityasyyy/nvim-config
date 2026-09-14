return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.g.vimtex_version_check = 0
    vim.g.vimtex_view_method = "skim"
  end,
}
