local M = {
  'stevearc/conform.nvim',
}

local js_formatters = {
  { "prettierd", "prettier" },
  { "eslint_d",  "eslint" },
}

local lua_formatters = {
  'stylua'
}

M.config = function()
  local conform = require('conform')

  conform.setup({
    formatters_by_ft = {
      javascript = js_formatters,
      javascriptreact = js_formatters,
      typescript = js_formatters,
      typescriptreact = js_formatters,
      graphql = js_formatters,

      lua = lua_formatters,
    },

    format_on_save = {
      lsp_fallback = true
    }
  })
end

return M
