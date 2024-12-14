local conditions = require("heirline.conditions")
local colors = require("nvimpire").colors
local helpers = require("neovoss.plugins.heirline.helpers")

local LspActive = {
	condition = conditions.lsp_attached,
	{
		hl = function(self)
			return {
				fg = colors.bg_lighter,
				bg = self.show_diagnostics and colors.bg_light or colors.none,
			}
		end,
		provider = helpers.LeftBubbleChar,
	},

	{
		provider = function()
			local names = {}

			local current_buff = vim.api.nvim_get_current_buf()
			for _, client in pairs(vim.lsp.get_clients({ bufnr = current_buff })) do
				table.insert(names, client.name)
			end

			return "󰛸 " .. table.concat(names, ", ") .. " "
		end,

		hl = {
			fg = colors.purple,
			bg = colors.bg_lighter,
			bold = true,
		},
	},
}

return LspActive
