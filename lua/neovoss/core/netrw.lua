local M = {}

M.setup = function()
  vim.g.netrw_banner = 1 -- 0 to disable
  -- vim.g.netrw_browse_split = 4
  -- vim.g.netrw_liststyle = 3 -- tree view

  -- Open in current buffer
  vim.keymap.set("n", "<leader>eo", ":Explore<CR>")
  -- Open in vertical buffer
  vim.keymap.set("n", "<leader>el", ":Lexplore<CR>")

  vim.keymap.set("n", "<leader>er", ":Nexplore<CR>")
end

return M
