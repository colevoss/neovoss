local navic = require("nvim-navic")

local WinBar = {
	condition = function()
		return navic.is_available()
	end,

	provider = function()
		return navic.get_location({ highlight = true })
	end,
	update = "CursorMoved",
}

return WinBar
