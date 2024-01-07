local M = {
  'colevoss/nvimpire'
}

M.lazy = false
M.priority = 1000

M.config = function()
  local nvimpire = require('nvimpire')

  local colorscheme = 'nvimpire'

  local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not colorscheme_status_ok then
    vim.notify("could not set color scheme to nvimpire")
    return
  end

  nvimpire.setup {
    transparent = true
  }
end

return M
