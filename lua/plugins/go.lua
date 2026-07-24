return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        gopls = function(_, opts)
          Snacks.util.lsp.on({ name = "gopls" }, function(_, client)
            if not client.server_capabilities.semanticTokensProvider then
              local semantic = client.config.capabilities
                  and client.config.capabilities.textDocument
                  and client.config.capabilities.textDocument.semanticTokens
              if semantic then
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end
          end)
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    config = function(_, _)
      local lint = require("lint")
      lint.linters_by_ft = vim.tbl_deep_extend("force", lint.linters_by_ft, {
        go = { "golangcilint" },
      })
      lint.linters.golangcilint.args = function()
        local ok, version_info = pcall(vim.fn.system, { "golangci-lint", "version" })
        if not ok then
          return { "run", "--output.json.path=stdout", "--issues-exit-code=0", "--show-stats=false", "--path-mode=abs" }
        end

        local go_mod_location
        ok, go_mod_location = pcall(vim.fn.system, { "go", "env", "GOMOD" })
        if not ok then
          return { "run", "--output.json.path=stdout", "--issues-exit-code=0", "--show-stats=false", "--path-mode=abs" }
        end

        local filename_modifier = ":h"
        go_mod_location = go_mod_location:gsub("%s+", "")
        if go_mod_location == "/dev/null" or go_mod_location == "" then
          filename_modifier = ":p"
        end

        if string.find(version_info, "version v1") or string.find(version_info, "version 1") then
          return {
            "run",
            "--out-format",
            "json",
            "--issues-exit-code=0",
            "--show-stats=false",
            "--print-issued-lines=false",
            "--print-linter-name=false",
            function()
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), filename_modifier)
            end,
          }
        end

        if string.find(version_info, "version v2.0.") or string.find(version_info, "version 2.0.") then
          return {
            "run",
            "--output.json.path=stdout",
            "--output.text.path=",
            "--output.tab.path=",
            "--output.html.path=",
            "--output.checkstyle.path=",
            "--output.code-climate.path=",
            "--output.junit-xml.path=",
            "--output.teamcity.path=",
            "--output.sarif.path=",
            "--issues-exit-code=0",
            "--show-stats=false",
            function()
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), filename_modifier)
            end,
          }
        end

        return {
          "run",
          "--output.json.path=stdout",
          "--output.text.path=",
          "--output.tab.path=",
          "--output.html.path=",
          "--output.checkstyle.path=",
          "--output.code-climate.path=",
          "--output.junit-xml.path=",
          "--output.teamcity.path=",
          "--output.sarif.path=",
          "--issues-exit-code=0",
          "--show-stats=false",
          "--path-mode=abs",
          function()
            return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), filename_modifier)
          end,
        }
      end
    end,
  },
}