local sumneko_lua = require('neovoss.plugins.lsp.servers.sumneko_lua')
local rust_analyzer = require('neovoss.plugins.lsp.servers.rust_analyzer')
local tsserver = require('neovoss.plugins.lsp.servers.tsserver')
local gopls = require('neovoss.plugins.lsp.servers.gopls')
local bashls = require('neovoss.plugins.lsp.servers.bashls')
local dockerls = require('neovoss.plugins.lsp.servers.dockerls')

local servers = {
  sumneko_lua = sumneko_lua,
  rust_analyzer = rust_analyzer,
  tsserver = tsserver,
  gopls = gopls,
  bashls = bashls,
  dockerls = dockerls,
}

return servers
