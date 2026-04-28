-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffer switching (better than clicking tabs)
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })

-- Quick buffer close
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close Buffer" })

-- Alternate file (last buffer) — faster than tab switching
vim.keymap.set("n", "<leader><Tab>", "<C-^>", { desc = "Alternate Buffer" })
