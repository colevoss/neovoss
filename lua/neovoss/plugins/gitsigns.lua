return {
	"lewis6991/gitsigns.nvim",

	opts = {
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},

		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 500,
			ignore_whitespace = false,
		},
	},
}
