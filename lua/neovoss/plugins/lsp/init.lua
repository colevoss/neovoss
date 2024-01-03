local M = {
  'williamboman/mason.nvim',

  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
}

M.lazy = false

M.config = function()
  require('mason').setup()

  require('mason-lspconfig').setup {
    ensure_installed = {
      'lua_ls'
    }
  }

  require('neovoss.plugins.lsp.lspconfig').setup()
end

return M
