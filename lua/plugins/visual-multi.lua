return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- Optional: VSCode-like keymap
    vim.g.VM_maps = {
      ["Find Under"] = "<D-l>", -- like Cmd+D in VSCode
      ["Find Subword Under"] = "<D-l>",
      ["Select All"] = "<D-h>", -- select all occurrences
    }
  end,
}
