local highlight = {
	"IndentBlanklineIndent1",
	"IndentBlanklineIndent2",
	"IndentBlanklineIndent3",
	"IndentBlanklineIndent4",
	"IndentBlanklineIndent5",
	"IndentBlanklineIndent6",
}

return {
	"lukas-reineke/indent-blankline.nvim",

	main = "ibl",

	--@module "ibl"
	--@type ibl.config
	opts = {
		indent = {
			tab_char = "",
		},
		whitespace = {
			remove_blankline_trail = false,
		},
		scope = {
			enabled = true,
			highlight = highlight,
		},
	},
}
