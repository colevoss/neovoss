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
  require('neovoss.plugins.lsp.lspconfig').setup()
  require('neovoss.plugins.lsp.styles').setup()
end

return M
