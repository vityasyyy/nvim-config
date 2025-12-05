-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>sf", function()
  require("telescope.builtin").live_grep({
    search_dirs = { vim.fn.expand("%:p") },
    attach_mappings = function(_, map)
      map("i", "<C-q>", require("telescope.actions").smart_send_to_qflist)
      map("n", "<C-q>", require("telescope.actions").smart_send_to_qflist)
      return true
    end,
  })
end, { desc = "Live Grep (Current File → Quickfix)" })
