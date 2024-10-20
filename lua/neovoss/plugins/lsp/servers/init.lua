local M = {
  lua_ls = require('neovoss.plugins.lsp.servers.lua_ls'),
  tailwindcss = require('neovoss.plugins.lsp.servers.tailwindcss'),
  templ = require('neovoss.plugins.lsp.servers.templ'),
  html = require('neovoss.plugins.lsp.servers.html'),
  gopls = {},
  rust_analyzer = {},
  ts_ls = {},
  bashls = {},
  dockerls = {},
  pyright = {},
  elixirls = {},
  clangd = {},
}

return M
