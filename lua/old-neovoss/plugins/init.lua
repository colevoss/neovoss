local utils = require('neovoss.core.utils')

local M = {}

M.plugins = {
  'plugins.icons',
  'plugins.colorscheme',

  -- LSP/Langage Features
  'plugins.lsp',
  'plugins.cmp',

  -- UI
  'plugins.treesitter',
  'plugins.telescope',
  'plugins.trouble',
  'plugins.gitsigns',
  'plugins.neotree',
  'plugins.illuminate',
  'plugins.navic',
  'plugins.comment',
  'plugins.autopairs',
  'plugins.indent-blankline',

  'plugins.heirline',
}

function M.setup()
  utils.load_config(M.plugins)
end

return M
