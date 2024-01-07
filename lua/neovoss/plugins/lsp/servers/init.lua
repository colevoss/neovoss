local M = {
  lua_ls = require('neovoss.plugins.lsp.servers.lua_ls'),
  tailwindcss = require('neovoss.plugins.lsp.servers.tailwindcss'),
  templ = require('neovoss.plugins.lsp.servers.templ'),
  html = require('neovoss.plugins.lsp.servers.html'),
  gopls = {},
  rust_analyzer = {},
  tsserver = {},
  bashls = {},
  dockerls = {},
  pyright = {},
}

return M
