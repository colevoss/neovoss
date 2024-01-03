local M = {
  'SmiteshP/nvim-navic'
}

local icons = {
  File          = "󰈙 ",
  Module        = " ",
  Namespace     = "󰌗 ",
  Package       = " ",
  Class         = "󰌗 ",
  Method        = "󰆧 ",
  Property      = " ",
  Field         = " ",
  Constructor   = " ",
  Enum          = "󰕘",
  Interface     = "󰕘",
  Function      = "󰊕 ",
  Variable      = "󰆧 ",
  Constant      = "󰏿 ",
  String        = "󰀬 ",
  Number        = "󰎠 ",
  Boolean       = "◩ ",
  Array         = "󰅪 ",
  Object        = "󰅩 ",
  Key           = "󰌋 ",
  Null          = "󰟢 ",
  EnumMember    = " ",
  Struct        = "󰌗 ",
  Event         = " ",
  Operator      = "󰆕 ",
  TypeParameter = "󰊄 ",
}

M.config = function()
  local navic = require('nvim-navic')

  navic.setup {
    highlight = true,
    icons = icons,
    -- separator = " > ",
    separator = "  ",
    depth_limit = 0,
  }
end

return M
