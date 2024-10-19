local M = {}

M.setup = function()
  vim.g.netrw_banner = 1 -- 0 to disable
  -- Open in current buffer
  vim.keymap.set("n", "<leader>eo", ":Explore<CR>", { silent = true, desc = "Open Netrw" })
  -- Open in vertical buffer
  vim.keymap.set("n", "<leader>el", ":Lexplore<CR>")
  vim.keymap.set("n", "<leader>er", ":Nexplore<CR>")


  local group = vim.api.nvim_create_augroup("NeoVoss", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "netrw",
    callback = function(ev)
      local opts = { buffer = ev.buf, remap = true }

      vim.keymap.set('n', 'l', '<CR>', opts)
      vim.keymap.set('n', 'h', '-', opts)
      vim.keymap.set('n', 'a', '%', opts)
    end
  })
end

return M
