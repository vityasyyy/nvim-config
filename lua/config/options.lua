vim.o.winborder = "single"

vim.opt.showtabline = 2

vim.opt.laststatus = 3

local branch_cache = { val = "", tick = 0 }

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

  local branch = ""
  local head = vim.b.gitsigns_head
  if not head or head == "" then
    local tick = vim.b.changedtick or 0
    if branch_cache.tick ~= tick then
      branch_cache.tick = tick
      local gitdir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
      if gitdir ~= "" then
        local head_file = gitdir .. "/HEAD"
        if vim.fn.filereadable(head_file) == 1 then
          local content = vim.fn.readfile(head_file)[1] or ""
          head = content:match("ref: refs/heads/(.+)")
          if not head then
            head = content:sub(1, 7)
          end
        end
      end
      branch_cache.val = head or ""
    end
    head = branch_cache.val
  end
  if head and head ~= "" then
    branch = " | " .. head
  end

  return string.format("[%s] %s%s%s", mode_str, filename, modified, branch)
end

vim.opt.statusline = "%!v:lua.MinimalStatusline()"

function _G.MinimalStatusline()
  return minimal_statusline()
end

vim.opt.cmdheight = 1

vim.opt.shortmess:append("I")

vim.opt.ruler = false
vim.opt.showmode = false
