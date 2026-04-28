return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    win_options = {
      signcolumn = "yes:2",
    },
    keymaps = {
      ["l"] = "actions.select", -- enter dir / open file
      ["h"] = "actions.parent", -- go up
      ["<CR>"] = "actions.select",
      ["q"] = "actions.close",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd", -- jump back to project root
      ["g."] = "actions.toggle_hidden",
    },
  },
  keys = {
    { "-", "<cmd>Oil --float<cr>", desc = "Open Oil (parent directory)" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
