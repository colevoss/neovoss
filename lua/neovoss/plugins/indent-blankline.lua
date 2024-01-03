local M = { 'lukas-reineke/indent-blankline.nvim' }

local highlight = {
  "IndentBlanklineIndent1",
  "IndentBlanklineIndent2",
  "IndentBlanklineIndent3",
  "IndentBlanklineIndent4",
  "IndentBlanklineIndent5",
  "IndentBlanklineIndent6",
}

M.config = function()
  vim.opt.list = true

  require('ibl').setup {
    indent = {
      tab_char = ""
      -- highlight = highlight,
    },
    whitespace = {
      -- highlight = highlight,
      remove_blankline_trail = false,
    },
    scope = {
      enabled = true,
      highlight = highlight
    },
  }
end

return M
