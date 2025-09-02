return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- Optional: VSCode-like keymap
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>", -- like Cmd+D in VSCode
      ["Find Subword Under"] = "<C-d>",
      ["Select All"] = "<C-a>", -- select all occurrences
    }
  end,
}
