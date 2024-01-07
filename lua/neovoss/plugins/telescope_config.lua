local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  }
}

M.lazy = false
M.priority = 999

M.config = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  local builtin = require('telescope.builtin')
  local themes = require('telescope.themes')
  local trouble = require("trouble.providers.telescope")


  telescope.setup({
    defaults = {
      hidden = true,
      prompt_prefix = " ",
      selection_caret = "",
      -- path_display = { "smart" },
      file_ignore_patterns = {
        "^.git/",
        "node_modules",
      },
      mappings = {
        n = {
          ["<c-t>"] = trouble.open_with_trouble,
          ['<c-d>'] = actions.delete_buffer
        },
        i = {
          -- ["<esc>"] = actions.close,
          ['<C-u>'] = false,
          ["<c-t>"] = trouble.open_with_trouble,
          ['<c-d>'] = actions.delete_buffer
        }
      }
    },
    pickers = {
      find_files = {
        prompt_prefix = "🔍",
        hidden = true,
        command = "rg",
      }
    },
  })

  local project_files = function(pf_opts)
    builtin.find_files(pf_opts)
  end

  local quick_find_files = function()
    project_files(
      themes.get_dropdown({
        previewer = false,
        hidden = false
      })
    )
  end

  local find_directory_files = function()
    builtin.find_files({ cwd = vim.fn.expand('%:p:h') })
  end

  local incoming_lsp_calls = function()
    builtin.lsp_incoming_calls(themes.get_ivy())
  end

  local find_buffer = function()
    builtin.buffers(themes.get_ivy())
  end

  local live_grep = function()
    builtin.live_grep()
  end

  -- Find files
  vim.keymap.set('n', '<leader>p', quick_find_files)
  vim.keymap.set('n', '<leader>.', find_directory_files)
  vim.keymap.set('n', '<leader>b', find_buffer)

  -- LSP
  vim.keymap.set('n', '<leader>gi', incoming_lsp_calls)
  vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)

  -- Grep
  vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find)
  vim.keymap.set('n', '<leader>ft', live_grep)

  -- Misc
  vim.keymap.set('n', '<leader>?', builtin.resume)

  -- VIM
  vim.keymap.set('n', '<leader>tk', builtin.keymaps)
  vim.keymap.set('n', '<leader>th', builtin.highlights)
  vim.keymap.set('n', '<leader>fm', builtin.marks)
  vim.keymap.set('n', '<leader>fr', builtin.registers)

  -- TEST
  vim.keymap.set('n', '<leader>d', builtin.diagnostics)
end

return M
