local M = {}

function M.setup()
  local icons_ok, icons = pcall(require, "nvim-web-devicons")

  if not icons_ok then
    vim.notify("Could not load nvim-web-devicons")
    return
  end

  icons.setup()
end

function M.has_loaded()
  local icons_ok, icons = pcall(require, "nvim-web-devicons")

  if not icons_ok then
    return false
  end

  return icons.has_loaded()
end

-- function M.get_color()
--   local icons_ok, icons = pcall(require, "nvim-web-devicons")
--
--   icons.get_icon_color()
-- end

return M
