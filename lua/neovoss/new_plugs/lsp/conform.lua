local M = {}

local js_formatters = {
  { "prettierd", "prettier" },
  { "eslint_d",  "eslint" },
}

function M.setup()
  local conform_ok, conform = pcall(require, 'conform')

  if not conform_ok then
    vim.notify("Could not load conform")
    return
  end

  conform.setup({
    formatters_by_ft = {
      javascript = js_formatters,
      javascriptreact = js_formatters,
      typescript = js_formatters,
      typescriptreact = js_formatters,
    },

    format_on_save = {
      lsp_fallback = true,
    }
  })
end

return M
