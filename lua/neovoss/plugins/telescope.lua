local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  }
}

M.config = function()
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')
  local themes = require('telescope.themes')

  telescope.setup {}

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

  vim.keymap.set('n', '<leader>p', quick_find_files)
end

return M
