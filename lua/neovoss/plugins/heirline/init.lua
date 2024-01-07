local M = {
  'rebelot/heirline.nvim'
}

M.config = function()
  local heirline = require('heirline')
  local statusline = require('neovoss.plugins.heirline.statusline')
  local bufferline = require('neovoss.plugins.heirline.bufferline')
  local winbar = require('neovoss.plugins.heirline.winbar')

  heirline.setup({
    statusline = statusline,
    tabline = bufferline,
    winbar = winbar,
  })

  vim.o.showtabline = 2
end

return M
