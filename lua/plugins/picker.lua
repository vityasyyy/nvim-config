-- Use snacks.picker (built into LazyVim) instead of fzf-lua or telescope
-- Zero extra plugins, fast, minimal UI
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
      ui_select = true, -- replace vim.ui.select
      layout = {
        cycle = true,
        --- Use the default layout or vertical split
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
    -- Find files
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files (Root Dir)" },
    { "<leader>f", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files (Root Dir)" },
    { "<leader>fF", function() Snacks.picker.files({ cwd = "~" }) end, desc = "Find Files (Home)" },
    -- Grep
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live Grep" },
    { "<leader>fG", function() Snacks.picker.grep({ cwd = "~" }) end, desc = "Live Grep (Home)" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (Root Dir)" },
    { "<leader>sG", function() Snacks.picker.grep({ cwd = "~" }) end, desc = "Grep (Home)" },
    { "<leader>sf", function() Snacks.picker.lines() end, desc = "Grep Current File" },
    -- Buffers & recent
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>sb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Recent (cwd)" },
    { "<leader>sh", function() Snacks.picker.recent() end, desc = "Recent Files" },
    -- Help & commands
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>fC", function() Snacks.picker.commands() end, desc = "Find Commands" },
    -- Symbols
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Find Symbols (Buffer)" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Find Symbols (Workspace)" },
    -- Config & registers
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>f'", function() Snacks.picker.registers() end, desc = "Registers" },
    -- Quickfix & resume
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume Last Search" },
    -- Git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log (Line)" },
  },
}
