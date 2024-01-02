local M = {}

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

function M.setup()
  local navic_ok, navic = pcall(require, "nvim-navic")

  if not navic_ok then
    vim.notify('Could not load nvim-navic')
    return
  end

  navic.setup {
    highlight = true,
    icons = icons,
    -- separator = " > ",
    separator = "  ",
    depth_limit = 0,
  }

  vim.g.navic_silence = true
end

return M
