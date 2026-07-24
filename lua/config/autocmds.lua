-- Workaround for Neovim 0.12 bug: inlay_hint "Invalid 'col': out of range"
-- Stale column positions from LSP cause nvim_buf_set_extmark to throw,
-- crashing the decoration provider and breaking all LSP completions.
-- We suppress col-out-of-range errors so inlay hints with valid positions
-- still render while stale ones are skipped gracefully.
local orig = vim.api.nvim_buf_set_extmark
vim.api.nvim_buf_set_extmark = function(buf, ns, row, col, opts)
  local ok, result = pcall(orig, buf, ns, row, col, opts)
  if not ok then
    if tostring(result):match("Invalid 'col'") then
      return -1
    end
    error(result)
  end
  return result
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "vtsls" then
      client.commands["setContext"] = function() end
    end
  end,
})