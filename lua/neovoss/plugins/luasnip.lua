local M = {
  'L3MON4D3/LuaSnip',
  dependencies = {

    'rafamadriz/friendly-snippets'
  },
  build = "make install_jsregexp"
}

M.config = function()
  local luasnip = require('luasnip')
  require("luasnip.loaders.from_vscode").lazy_load()

  luasnip.filetype_extend("javascript", { "jsdoc" })
  luasnip.filetype_extend("typescript", { "jsdoc" })
  luasnip.filetype_extend("react", { "jsdoc" })
end

return M
