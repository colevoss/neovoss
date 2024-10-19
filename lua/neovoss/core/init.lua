local M = {}

M.setup = function()
	require("neovoss.core.options").setup()
	require("neovoss.core.mappings").setup()
	require("neovoss.core.netrw").setup()
end

return M
