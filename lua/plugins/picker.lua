return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
      ui_select = true,
      layout = {
        cycle = true,
        preset = function()
          return vim.o.columns >= 120 and "default" or "vertical"
        end,
      },
      win = {
        input = {
          keys = {
            ["<C-q>"] = { "qflist", mode = { "i", "n" } },
            ["<a-i>"] = { "toggle_preview", mode = { "i", "n" } },
            ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
          },
        },
      },
    },
  },
  keys = {
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files (Root Dir)" },
    { "<leader>fF", function() Snacks.picker.files({ cwd = "~" }) end, desc = "Find Files (Home)" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live Grep" },
    { "<leader>fG", function() Snacks.picker.grep({ cwd = "~" }) end, desc = "Live Grep (Home)" },
    { "<leader>sf", function() Snacks.picker.lines() end, desc = "Grep Current File" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (Root Dir)" },
    { "<leader>sG", function() Snacks.picker.grep({ cwd = "~" }) end, desc = "Grep (Home)" },
    { "<leader>sb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>sh", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume Last Search" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>fC", function() Snacks.picker.commands() end, desc = "Find Commands" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Find Symbols (Buffer)" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Find Symbols (Workspace)" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>f'", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Recent (cwd)" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log (Line)" },
  },
}
