local M = {}

M.setup = function()
	-- Leader space
	vim.keymap.set("", "<Space>", "<Nop>", { silent = true })
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	-- Colon shortcut
	vim.keymap.set("n", ";", ":", { silent = false, desc = "Semi-colon shortcut" })
	vim.keymap.set("n", ":", ";", { silent = false })

	vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = false, desc = "Leader + w save shortcut" })

	vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left pane" })
	vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to down pane" })
	vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to up pane" })
	vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right pane" })

	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up" })
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down" })

	vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Move down and center" })
	vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Move down and center" })

	vim.keymap.set("n", "<C-p>", ":bprevious<CR>", { silent = true, desc = "Go to previous buffer" })
	vim.keymap.set("n", "<C-n>", ":bnext<CR>", { silent = true, desc = "Go to next buffer" })

	vim.keymap.set("n", "<S-y>", "<S-v>y", { silent = true, desc = "Shift Y to yank full line" })

	-- [In/out]dent and then reselect
	vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Outdent and reselect" })
	vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent and reselect" })

	vim.keymap.set("x", "<leader>p", '"_dp')
	vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww sessionizer<CR>")

	-- quick fix list
	vim.keymap.set("n", "<leader>cn", "<cmd>silent cn<CR>")
	vim.keymap.set("n", "<leader>cp", "<cmd>silent cp<CR>")
	vim.keymap.set("n", "<leader>co", "<cmd>silent copen<CR>")
	vim.keymap.set("n", "<leader>cc", "<cmd>silent cclose<CR>")
end

return M
