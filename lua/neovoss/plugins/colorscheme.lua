local M = {}

function M.setup()
  local status_ok, nvimpire = pcall(require, 'nvimpire')

  if not status_ok then
    vim.notify('Could not load nvimpire')
    return
  end

  local colorscheme = 'nvimpire'

  local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not colorscheme_status_ok then
    vim.notify("could not set color scheme to nvimpire")
    return
  end

  nvimpire.setup {
    transparent = true
  }
end

return M
