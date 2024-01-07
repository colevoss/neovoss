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

  vim.keymap.set('n', '<leader>tn', function()
    trouble.next({ skip_groups = true, jump = true })
  end)

  vim.keymap.set('n', '<leader>tp', function()
    trouble.previous({ skip_groups = true, jump = true })
  end)
end

return M
