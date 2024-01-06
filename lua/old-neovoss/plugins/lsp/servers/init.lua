-- local sumneko_lua = require('neovoss.plugins.lsp.servers.sumneko_lua')
local lua_ls = require('neovoss.plugins.lsp.servers.lua_ls')
local rust_analyzer = require('neovoss.plugins.lsp.servers.rust_analyzer')
local tsserver = require('neovoss.plugins.lsp.servers.tsserver')
local gopls = require('neovoss.plugins.lsp.servers.gopls')
local bashls = require('neovoss.plugins.lsp.servers.bashls')
local dockerls = require('neovoss.plugins.lsp.servers.dockerls')
local astro = require('neovoss.plugins.lsp.servers.astro')
local pyright = require('neovoss.plugins.lsp.servers.pyright')
local tailwindcss = require('neovoss.plugins.lsp.servers.tailwind')
local templ = require('neovoss.plugins.lsp.servers.templ')

local servers = {
  lua_ls = lua_ls,
  rust_analyzer = rust_analyzer,
  tsserver = tsserver,
  gopls = gopls,
  bashls = bashls,
  dockerls = dockerls,
  astro = astro,
  pyright = pyright,
  tailwindcss = tailwindcss,
  templ = templ
}

return servers