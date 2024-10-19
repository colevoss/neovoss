local js_formatters = {
	-- { "prettierd", "prettier" },
	{ "prettierd" },
	-- { "eslint_d",  "eslint" },
}

local lua_formatters = {
	"stylua",
}

return {
	"stevearc/conform.nvim",

	init = function()
		vim.keymap.set("n", "<leader>F", function()
			require("conform").format({
				lsp_format = "fallback",
			})
		end)
	end,

	opts = {
		format_on_save = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			javascript = js_formatters,
			javascriptreact = js_formatters,
			typescript = js_formatters,
			typescriptreact = js_formatters,
			graphql = js_formatters,
			json = js_formatters,

			lua = lua_formatters,
		},
	},
}
