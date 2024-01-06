local M = {
  'RRethy/vim-illuminate'
}

M.config = function()
  local illuminate = require('illuminate')

  illuminate.configure({
    providers = {
      'lsp',
      'treesitter',
      'regex'
    },
    under_cursor = false,
  })
end

return M
