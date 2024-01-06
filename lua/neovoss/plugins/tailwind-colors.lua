local M = {
  "themaxmarchuk/tailwindcss-colors.nvim",
}

M.config = function()
  require('tailwindcss-colors').setup()
end

return M
