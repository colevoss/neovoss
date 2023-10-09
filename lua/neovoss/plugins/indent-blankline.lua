local M = {}

local highlight = {
  "Whitespace",
}

function M.setup()
  local status_ok, blankline = pcall(require, "ibl")

  if not status_ok then
    vim.notify("Could not load blankline")
    return
  end

  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  -- vim.opt.listchars:append "tab:-"
  vim.opt.listchars:append "eol:↴"

  blankline.setup {
    indent = {
      highlight = highlight,
      char = ""
    },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    },
    scope = {
      enabled = true,
      highlight = highlight
    },
  }
end

return M
