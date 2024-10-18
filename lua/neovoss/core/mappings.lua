local M = {}

M.setup = function()
  -- Leader space
  vim.keymap.set("", "<Space>", "<Nop>", {
    silent = true,
  })
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Colon shortcut
  vim.keymap.set("n", ";", ":", {
    silent = false
  })

  vim.keymap.set("n", ":", ";", {
    silent = false
  })

  vim.keymap.set("n", "<leader>w", ":w<CR>", {
    silent = false,
    desc = "Leader + w save shortcut"
  })

  vim.keymap.set("n", "<C-h>", "<C-w>h")
  vim.keymap.set("n", "<C-j>", "<C-w>j")
  vim.keymap.set("n", "<C-k>", "<C-w>k")
  vim.keymap.set("n", "<C-l>", "<C-w>l")

  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")

  vim.keymap.set("n", "<C-p>", ":bprevious<CR>")
  vim.keymap.set("n", "<C-n>", ":bnext<CR>")

  vim.keymap.set("n", "<S-y>", "<S-v>y")

  vim.keymap.set("v", "<", "<gv")
  vim.keymap.set("v", ">", ">gv")

  vim.keymap.set("x", "<leader>p", "\"_dp")
  vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww sessionizer<CR>")

  vim.keymap.set("n", "<leader>cn", "<cmd>silent cn<CR>")
  vim.keymap.set("n", "<leader>cp", "<cmd>silent cp<CR>")
end

return M
