local map = require('neovoss.core.utils')

local M = {}

M.setup = function()
  -- Remap leader
  map.keymap("", "<Space>", "<Nop>", {
    silent = true,
    desc = "Space as leader"
  })

  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- ==============================================
  -- Normal Mappings
  -- ==============================================

  -- Colon Shortcut
  map.nmap(";", ":", "Colon works as semicolon", false)
  map.nmap(":", ";", "Semicolon works as colon", false)

  -- Save Shortcut
  map.nmap("<leader>w", ":w<CR>", "Leader + W save shortcut", false)

  -- Better window navigation
  map.nmap("<C-h>", "<C-w>h", "<C-h> to navigate to left pane", true)
  map.nmap("<C-j>", "<C-w>j", "<C-j> to navigate to down pane", true)
  map.nmap("<C-k>", "<C-w>k", "<C-k> to navigate to up pane", true)
  map.nmap("<C-l>", "<C-w>l", "<C-l> to navigate to right pane", true)

  -- In buffer nav
  map.nmap("<C-d>", "<C-d>zz", "Navigate down and center", true)
  map.nmap("<C-u>", "<C-u>zz", "Navigate up and center", true)

  -- Previous and next buffers
  map.nmap("<C-p>", ":bprevious<CR>", "Go to previous buffer", true)
  map.nmap("<C-n>", ":bnext<CR>", "Go to next buffer", true)

  -- Better full line yank
  map.nmap("<S-y>", "<S-v>y", "Better full line yank", true)

  -- Move to start or end of line
  map.nmap("<C-e>", "$", "Move to start or end of line", true)

  -- ==============================================
  -- Visual Mappings
  -- ==============================================

  -- Stay in indent mode
  map.vmap("<", "<gv", "Indent left", true)
  map.vmap(">", ">gv", "Indent right", true)

  map.keymap("x", "<leader>p", "\"_dp")
end

return M
