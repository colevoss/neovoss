return {
	"ThePrimeagen/harpoon",

	init = function()
		local harpoon_mark = require("harpoon.mark")
		local harpoon_ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", function()
			harpoon_mark.add_file()
		end)

		vim.keymap.set("n", "<C-e>", function()
			harpoon_ui.toggle_quick_menu()
		end)

		vim.keymap.set("n", "<leader>h", function()
			harpoon_ui.nav_file(1)
		end)

		vim.keymap.set("n", "<leader>j", function()
			harpoon_ui.nav_file(2)
		end)

		vim.keymap.set("n", "<leader>k", function()
			harpoon_ui.nav_file(3)
		end)

		vim.keymap.set("n", "<leader>l", function()
			harpoon_ui.nav_file(4)
		end)
		vim.keymap.set("n", "<leader>k", function()
			harpoon_ui.nav_file(3)
		end)
	end,
}
