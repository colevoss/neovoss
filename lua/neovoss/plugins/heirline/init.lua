return {
	"rebelot/heirline.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	init = function()
		vim.o.showtabline = 2
	end,

	opts = function()
		local statusline = require("neovoss.plugins.heirline.statusline")
		local winbar = require("neovoss.plugins.heirline.winbar")
		local bufferline = require("neovoss.plugins.heirline.bufferline")

		return {
			tabline = bufferline,
			statusline = statusline,
			winbar = winbar,
		}
	end,
}
