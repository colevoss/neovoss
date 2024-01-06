local utils = require('neovoss.plugins.utils')
-- local plugin = utils.plugin

local M = {}

M.setup = function()
  utils.initLazy()
  
  require('lazy').setup({
    require('neovoss.plugins.nvimpire'),
    require('neovoss.plugins.telescope_config'),
    require('neovoss.plugins.treesitter'),
    require('neovoss.plugins.autopairs'),
    require('neovoss.plugins.indent-blankline'),
    require('neovoss.plugins.gitsigns'),
    require('neovoss.plugins.navic'),
    require('neovoss.plugins.lsp'),
    require('neovoss.plugins.fidget'),
    require('neovoss.plugins.comment'),
    require('neovoss.plugins.trouble'),
    require('neovoss.plugins.cmp_config'),
    require('neovoss.plugins.heirline'),
    require('neovoss.plugins.conform'),
    require('neovoss.plugins.illuminate')
  })
end

return M
