local colors = require('nvimpire').colors
local settings = require('nvimpire.config').settings

local Mode = require('neovoss.plugins.heirline.mode')
local Cwd = require('neovoss.plugins.heirline.cwd')
local Git = require('neovoss.plugins.heirline.git')
local LspDiagnostics = require('neovoss.plugins.heirline.lsp_diagnostics')
local Ruler = require('neovoss.plugins.heirline.ruler')
local helpers = require('neovoss.plugins.heirline.helpers')

local M = {
  Mode, Cwd, Git,

  helpers.Align,

  Ruler,

  LspDiagnostics,

  hl = {
    bg = settings.transparent and colors.none or colors.bg_dark
  }
}

return M
