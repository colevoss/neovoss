local servers = {
	ts_ls = {},
	gopls = {},
	zls = {},
	rust_analyzer = {},
	lua_ls = {
		settings = {
			Lua = {
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
}

local tools = {
	"stylua",
	"prettierd",
}

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

local diag_config = {
	virtual_text = {
		source = "if_any",
	},
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = false,
	severity_sort = true,
	float = {
		focusable = true,
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

local function on_attach(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"SmiteshP/nvim-navic",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/nvim-cmp",
			"SmiteshP/nvim-navic",
		},
		init = function()
			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, {
					texthl = sign.name,
					text = sign.text,
					numhl = sign.name,
				})
			end

			vim.diagnostic.config(diag_config)
		end,
		config = function()
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			-- KEY BINDS
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("neovoss-lsp-attach", { clear = true }),

				callback = function(event)
					local telescope = require("telescope.builtin")

					-- TELESCOPE
					vim.keymap.set("n", "gd", telescope.lsp_definitions, { buffer = event.buf, desc = "LSP: Go to definition" })
					vim.keymap.set("n", "gr", telescope.lsp_references, { buffer = event.buf, desc = "LSP: Go to references" })
					vim.keymap.set("n", "gi", telescope.lsp_implementations, { buffer = event.buf, desc = "LSP: Go to implementations" })

					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP: Hover" })
					vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "LSP: Signature help" })
					vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { buffer = event.buf, desc = "LSP: Open diagnostics float" })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP: Rename" })
					vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP: Code actions" })
					vim.keymap.set("n", "<leader>tt", vim.diagnostic.setqflist)

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					-- TODO: Figure out more about this
					vim.lsp.codelens.refresh()
					vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
						buffer = event.buf,
						callback = vim.lsp.codelens.refresh,
					})

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						vim.keymap.set("n", "<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end)
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- MASON LSP CONFIG
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = vim.list_extend(vim.tbl_keys(servers), tools),
			})
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}

						server.capabilities = vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
						server.on_attach = on_attach
						lspconfig[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
