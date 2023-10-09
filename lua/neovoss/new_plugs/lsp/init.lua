local utils = require('neovoss.core.utils')

local M = {}

local plugins = {
  'plugins.lsp.config',
  'plugins.lsp.mason',
  -- 'plugins.lsp.conform', // TODO: Load this outside of this
}

-- function M.setup()
--   utils.load_config(M.load)
-- end
function M.config()
  utils.load_config(plugins)
end

-- return M

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP Installer
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Useful status updates for LSP
    {
      'j-hui/fidget.nvim',
      tag = 'legacy'
    },

    -- Additional lua configuration, makes nvim stuff amazing
    'folke/neodev.nvim',
  },
  lazy = false,
  config = config,
}
