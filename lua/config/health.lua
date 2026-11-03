-- Neovim 0.12 removed vim.health.report_*; alias them so older plugins
-- (jupytext.nvim) still expose a working :checkhealth entry.
if vim.health and not vim.health.report_start and vim.health.start then
  vim.health.report_start = vim.health.start
  vim.health.report_ok = vim.health.ok
  vim.health.report_warn = vim.health.warn
  vim.health.report_error = vim.health.error
  vim.health.report_info = vim.health.info
end
