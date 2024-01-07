local M = {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
}

M.config = function()
  local neogen = require("neogen")
  neogen.setup({
    -- snippet_engine = "luasnip"
  })

  vim.keymap.set('n', '<leader>df', function()
    neogen.generate({ type = "func" })
  end)

  vim.keymap.set('n', '<leader>dt', function()
    neogen.generate({ type = "type" })
  end)
end

return M
