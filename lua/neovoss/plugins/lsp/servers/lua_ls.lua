local M = {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'require',
        }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}

return M
