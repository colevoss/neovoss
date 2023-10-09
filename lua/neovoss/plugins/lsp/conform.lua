local M = {}

function M.setup()
  local conform_ok, conform = pcall(require, 'conform')

  if not conform_ok then
    vim.notify("Could not load conform")
    return
  end

  conform.setup({
    formatters_by_ft = {
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { 'prettierd' },
      typescriptreact = { 'prettierd' },
    },

    format_on_save = {
      lsp_fallback = true,
    }
  })
end

return M
