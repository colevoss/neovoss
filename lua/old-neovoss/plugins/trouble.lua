local nmap = require('neovoss.core.utils').nmap

local M = {}

function M.setup()
  local status_ok, trouble = pcall(require, "trouble")

  if not status_ok then
    vim.notify("Could not load trouble")
    return
  end

  trouble.setup {}

  nmap("<leader>xx", "<cmd>TroubleToggle<CR>", "Trouble: Toggle", true)
  nmap("<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", "Trouble: Workspace Diagnostics", true)
  nmap("<leader>xf", "<cmd>Trouble document_diagnostics<CR>", "Trouble: Document Diagnostics", true)
  nmap("<leader>xq", "<cmd>Trouble quickfix<CR>", "Trouble: Quick Fix", true)
  nmap("<leader>xr", "<cmd>Trouble lsp_references<CR>", "Trouble: Open LSP References", true)
  nmap("<leader>xd", "<cmd>Trouble lsp_definitions<CR>", "Trouble: Open Defitions", true)
end

return M
