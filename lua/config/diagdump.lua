local M = {}

function M.dump()
  local diags = vim.diagnostic.get(nil, { workspace = true })
  local lines = {}

  -- Build lines BEFORE creating the floating window
  for _, d in ipairs(diags) do
    local filename = vim.api.nvim_buf_get_name(d.bufnr)
    if filename == "" then
      filename = "[No Name]"
    end

    local lnum = (d.lnum or 0) + 1
    local col = (d.col or 0) + 1
    local msg = d.message or ""

    -- Safe escape order
    msg = msg:gsub("\\", "\\\\"):gsub("\r", "\\r"):gsub("\n", "\\n"):gsub("%%", "%%%%"):gsub("[\1-\31]", "?")

    local line = string.format("%s:%d:%d: %s", filename, lnum, col, msg)
    table.insert(lines, line)
  end

  -- Create scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Apply lines AFTER they exist
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Floating window sizing
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- Important: make this buffer non-file but safe
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
end

return M
