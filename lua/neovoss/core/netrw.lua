local M = {}

M.setup = function()
  vim.g.netrw_banner = 0
  -- vim.g.netrw_browse_split = 4
  vim.g.netrw_liststyle = 3
  vim.keymap.set("n", "<leader>e", ":Explore<CR>")
end

return M
