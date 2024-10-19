return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },

  init = function()
    local builtin = require("telescope.builtin")

    -- Find
    vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Telescope: Find project files" })
    vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope: Open buffers list" })
    vim.keymap.set('n', '<leader>ft', builtin.live_grep, { desc = "Telescope: Search text" })

    -- Vim
    vim.keymap.set('n', '<leader>tk', builtin.keymaps)
    vim.keymap.set('n', '<leader>th', builtin.highlights)
    vim.keymap.set('n', '<leader>tm', builtin.marks)
    vim.keymap.set('n', '<leader>fr', builtin.registers)

  end,

  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        prompt_prefix = " ",
        selection_caret = "",
      },
      pickers = {
        find_files = {
          -- theme = "dropdown",
          theme = "ivy",
          -- previewer = false,
        },

        buffers = {
          theme = "ivy",
          mappings = {
            n = {
              -- TODO: Maybe delete this if the auto delete works in heirline
              ["<C-d>"] = actions.delete_buffer
            },
          }
        },
      }
    }
  end,
}
