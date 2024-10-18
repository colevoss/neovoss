local M = {}

local function on_attach(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end

local function keybinds()
  vim.keymap.set('n', '<leader>gl', vim.diagnostic.open_float)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),

    callback = function(ev)
      local opts = { buffer = ev.buf }
      local telescope = require('telescope.builtin')

      vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
      vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, opts)

      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)

      vim.keymap.set({ 'v', 'n' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>F', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end
  })
end

local function setup_servers()
  local lspconfig = require('lspconfig')
  local mason_lspconfig = require("mason-lspconfig")
  local utils = require('neovoss.core.utils')
  local servers = require('neovoss.plugins.lsp.servers')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = { exclude = { "clangd" } }
  }

  local base = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      local server_config = servers[server_name]
      local config_type = type(server_config)

      if config_type == "table" then
        lspconfig[server_name].setup(utils.merge(
          base,
          servers[server_name]
        ))
      elseif config_type == "function" then
        lspconfig[server_name].setup(server_config(base))
      else
        lspconfig[server_name].setup(base)
      end
    end
  }
end

print(type(setup_servers))

M.setup = function()
  setup_servers()
  keybinds()
end

return M
