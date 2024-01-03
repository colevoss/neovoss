local M = {
  'folke/trouble.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
}

M.config = function()
  local trouble = require('trouble')

  trouble.setup()

  vim.keymap.set('n', '<leader>tt', function()
    trouble.toggle('workspace_diagnostics')
  end)
end

return M
