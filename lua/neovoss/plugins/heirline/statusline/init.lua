local colors = require("nvimpire").colors
local settings = require("nvimpire.config").settings
local helpers = require("neovoss.plugins.heirline.helpers")

local Mode = require("neovoss.plugins.heirline.statusline.mode")
local Cwd = require("neovoss.plugins.heirline.statusline.cwd")
local Git = require("neovoss.plugins.heirline.statusline.git")
local File = require("neovoss.plugins.heirline.statusline.file")
local LspDiagnostics = require("neovoss.plugins.heirline.statusline.lsp_diags")

return {
	Mode,
	Cwd,
	Git,

	helpers.Align,

	File,

	LspDiagnostics,

	hl = {
		bg = settings.transparent and colors.none or colors.bg_dark,
	},
}
