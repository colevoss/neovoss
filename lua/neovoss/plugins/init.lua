local utils = require('neovoss.plugins.utils')
local plugin = utils.plugin

local M = {}

M.setup = function()
  utils.initLazy()

  require('lazy').setup({
    plugin('nvimpire'),
    plugin('telescope'),
    plugin('treesitter'),
    plugin('autopairs'),
    plugin('indent-blankline'),
    plugin('gitsigns'),
  })
end

return M
