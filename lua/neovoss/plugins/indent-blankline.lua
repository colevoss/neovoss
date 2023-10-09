local M = {}

local highlight = {
  "IndentBlanklineIndent1",
  "IndentBlanklineIndent2",
  "IndentBlanklineIndent3",
  "IndentBlanklineIndent4",
  "IndentBlanklineIndent5",
  "IndentBlanklineIndent6",
}

function M.setup()
  local status_ok, blankline = pcall(require, "ibl")

  if not status_ok then
    vim.notify("Could not load blankline")
    return
  end

  vim.opt.list = true

  blankline.setup {
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
