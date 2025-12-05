-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Dump all diagnostics (workspace) into a new scratch buffer
vim.api.nvim_create_user_command("DiagnosticsDump", function()
  require("config.diagdump").dump()
end, {})
