return {
  { "zbirenbaum/copilot.lua", enabled = false },
  { "fang2hou/blink-copilot", enabled = false },
  { "zbirenbaum/copilot-cmp", enabled = false },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 16384,
              },
            },
          },
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>uh", function() vim.lsp.inlay_hint.toggle(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Toggle Inlay Hints" },
    },
  },
}