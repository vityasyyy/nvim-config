-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Minimal winborder
vim.o.winborder = "single"

-- Keep tabline visible for bufferline
vim.opt.showtabline = 2

-- Single global statusline
vim.opt.laststatus = 3

-- Minimal statusline: [MODE] filename + | git_branch
local function minimal_statusline()
  local mode = vim.api.nvim_get_mode().mode
  local mode_map = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",
    c = "COMMAND",
    t = "TERMINAL",
  }
  local mode_str = mode_map[mode] or mode:upper()

  local filename = vim.fn.expand("%:t")
  if filename == "" then
    filename = "[No Name]"
  end

  local modified = vim.bo.modified and " +" or ""

  -- Git branch: try gitsigns first, then read .git/HEAD directly
  local branch = ""
  local head = vim.b.gitsigns_head
  if not head or head == "" then
    local gitdir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
    if gitdir ~= "" then
      local head_file = gitdir .. "/HEAD"
      if vim.fn.filereadable(head_file) == 1 then
        local content = vim.fn.readfile(head_file)[1] or ""
        head = content:match("ref: refs/heads/(.+)")
        if not head then
          head = content:sub(1, 7) -- detached HEAD, show short sha
        end
      end
    end
  end
  if head and head ~= "" then
    branch = " | " .. head
  end

  return string.format("[%s] %s%s%s", mode_str, filename, modified, branch)
end

-- Set statusline using autocmd to update dynamically
vim.opt.statusline = "%!v:lua.MinimalStatusline()"

function _G.MinimalStatusline()
  return minimal_statusline()
end

-- Hide command line when not typing (cleaner bottom area)
vim.opt.cmdheight = 1

-- No intro message on startup
vim.opt.shortmess:append("I")

-- Reduce visual noise: no ruler (we have statusline), no showmode (statusline shows it)
vim.opt.ruler = false
vim.opt.showmode = false
