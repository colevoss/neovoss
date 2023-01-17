local StatusLine = require('neovoss.plugins.heirline.statusline')
local Winbar = require('neovoss.plugins.heirline.winbar')
local Bufferline = require('neovoss.plugins.heirline.bufferline')

local M = {}

function M.setup()
  local heirline_ok, heirline = pcall(require, 'heirline')

  if not heirline_ok then
    vim.notify('Could not load heirline')
    return
  end

  local colors = require('nvimpire').colors

  heirline.setup({
    statusline = StatusLine,
    winbar = Winbar,
    tabline = Bufferline,
  })

  vim.o.showtabline = 2
end

return M
