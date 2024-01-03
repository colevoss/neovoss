local M = {}

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end

M.setup = function()
  local lspconfig = require('lspconfig')

  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
            'require',
          }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true)
        }
      }
    }
  }

  vim.keymap.set('n', '<leader>gl', vim.diagnostic.open_float)

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),

    callback = function(ev)
      local opts = { buffer = ev.buf }
      local telescope = require('telescope.builtin')

      vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
      vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)

      vim.keymap.set({ 'v', 'n' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>F', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end
  })
end

return M
