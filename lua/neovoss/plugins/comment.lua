local M = {
  'numToStr/Comment.nvim',

  --    dependencies = {
  --      'JoosepAlviste/nvim-ts-context-commentstring'
  --    }
}

M.config = function()
  require('Comment').setup {}
end

return M
