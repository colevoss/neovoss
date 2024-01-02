local nmap = require('neovoss.core.utils').nmap

local M = {}

function M.setup()
  local telescope_ok, telescope = pcall(require, "telescope")

  if not telescope_ok then
    vim.notify("Could not load Telescope")
    return
  end

  local actions = require("telescope.actions")
  local trouble = require("trouble.providers.telescope")

  telescope.setup {
    defaults = {
      hidden = true,
      prompt_prefix = " ",
      selection_caret = "",
      path_display = { "smart" },
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
  }

  local builtin = require('telescope.builtin')
  local themes = require('telescope.themes')

  local project_files = function(pf_opts)
    -- vim.fn.system("git rev-parse --is-inside-work-tree")
    -- if vim.v.shell_error == 0 then
    --   builtin.git_files(pf_opts)
    -- else
    --   builtin.find_files(pf_opts)
    -- end
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

  local incoming_lsp_calls = function()
    builtin.lsp_incoming_calls(themes.get_ivy())
  end

  local live_grep = function()
    builtin.live_grep()
  end

  local find_buffer = function()
    builtin.buffers(
      themes.get_ivy()
    )
  end

  -- Show files in current directory
  vim.keymap.set('n', '<leader>.', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)


  -- nmap("<leader>?", builtin.oldfiles, "Telescope: Recently Opened Files", true)
  -- nmap("<leader>ft", project_files, "Telescope: Find files", true)
  nmap("<leader>fb", builtin.current_buffer_fuzzy_find, "Telescope: Find files", true)
  nmap("<leader>ff", builtin.find_files, "Telescope: Find files", true)
  nmap("<leader>p", quick_find_files, "Telescope: Quick find files (without preview)", true)
  nmap("<leader>gi", incoming_lsp_calls, "Telescope: LSP Incoming Calls", true)
  nmap("<leader>ft", live_grep, "Telescope: Live Grep", true)
  nmap("<leader>fm", builtin.marks, "Telescope: Marks", true)
  nmap("<leader>fr", builtin.registers, "Telescope: Registers", true)
  nmap("<leader>b", find_buffer, "Telescope: Buffers", true)
  nmap("<leader>fs", builtin.lsp_document_symbols, "Telescope: LSP Symbols", true)
  nmap("<leader>?", builtin.resume, "Telescope: Resume", true)
  nmap("<leader>tk", builtin.keymaps, "Telescope: Keymaps", true)
  nmap("<leader>th", builtin.highlights, "Telescope: Keymaps", true)
end

return M
