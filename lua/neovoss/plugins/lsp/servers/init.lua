local M = {
  lua_ls = require('neovoss.plugins.lsp.servers.lua_ls'),
  gopls = {},
  rust_analyzer = {},
  tsserver = {},
  bashls = {},
  dockerls = {},
  pyright = {},
  tailwindcss = {},
  templ = require('neovoss.plugins.lsp.servers.templ')
}

return M
