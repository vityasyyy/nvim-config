-- GUI and stale tmux launches do not source ~/.zshrc, so pipx-installed CLIs
-- (jupytext, etc.) can be missing from Neovim's PATH.
local bin = vim.fn.expand("~/.local/bin")
local path = vim.env.PATH or ""
if vim.fn.isdirectory(bin) == 1 and not (":" .. path .. ":"):find(":" .. bin .. ":", 1, true) then
  vim.env.PATH = bin .. ":" .. path
end
