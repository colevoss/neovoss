local utils = require('neovoss.core.utils')

local M = {}

M.load = {
  'plugins.lsp.config',
  'plugins.lsp.mason',
  'plugins.lsp.null-ls',
}

function M.setup()
  utils.load_config(M.load)
end

return M
