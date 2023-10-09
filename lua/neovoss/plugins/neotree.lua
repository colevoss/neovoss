local nmap = require('neovoss.core.utils').nmap

local M = {}

function M.setup()
  local neotree_ok, neotree = pcall(require, 'neo-tree')

  if not neotree_ok then
    vim.notify('Could not load neotree')
    return
  end

  neotree.setup({
    source_selector = {
      winbar = true,
    },

    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },

    close_if_last_window = true, -- Close neo-tree if it is the last window left in the tab

    popup_border_style = "rounded",

    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,

    window = {
      position = "right",
      width = 40,

      mapping_options = {
        noremap = true,
        nowait = true,
      },

      mappings = {
        -- ["e"] = function()
        --   vim.api.nvim_exec(explorer_focus_cmd, true)
        -- end,
        -- ["b"] = function()
        --   vim.api.nvim_exec(buffer_focus_cmd, true)
        -- end,
        -- ["g"] = function()
        --   vim.api.nvim_exec(git_focus_cmd, true)
        -- end,
        ["<CR>"] = "open",
        ["<esc>"] = "revert_preview",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        -- ["l"] = "focus_preview",
        -- ["<C-h>"] = "open_split",
        ["<C-v>"] = "open_vsplit",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["m"] = "move",
        ["R"] = "refresh",
        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require('neo-tree.sources.filesystem').toggle_directory(state, node)
          else
            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
          end
        end,
        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' then
            if not node:is_expanded() then
              require('neo-tree.sources.filesystem').toggle_directory(state, node)
            elseif node:has_children() then
              require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
            end
          end
        end
      }
    },

    filesystem = {
      filtered_items = {
        -- visible = true,
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = true,

        hide_by_pattern = {
          ".git",
        },

        never_show = {
          ".DS_Store",
        },
      },

      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },

      group_empty_dirs = false,

      -- hijack_netrw_behavior = "open_default",
      hijack_netrw_behavior = "open_current",

      window = {
        position = "right",
        mappings = {
          ["/"] = "fuzzy_finder",
          ["<c-x>"] = "clear_filter"
        }
      },

      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },

        show_unloaded = true,

        window = {
          position = "float",
          mappings = {
            ["bd"] = "buffer_delete",
          }
        }
      },

      document_symbols = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },

        show_unloaded = true,

        window = {
          position = "float",
          mappings = {
            ["l"] = "expand_all_nodes"
          }
        }
      },

      git_status = {
        window = {
          position = "float"
        }
      }
    },

    default_component_configs = {
      container = {
        enable_character_fade = true
      },
      icon = {
        -- folder_closed = "",
        -- folder_open = "",
        -- folder_empty = ""
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
      },

      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          renamed = "",
          untracked = "U",
          ignored = "◌",
          unstaged = "",
          staged = "S",
          conflict = "",
          deleted = "✖"
        }
      },
    }
  })

  -- Filesystem
  -- nmap('<leader>ee', ":Neotree reveal=true source=filesystem<CR>", 'Toggle Nvim Tree', true)
  -- nmap('\\', ":Neotree reveal=true source=filesystem<CR>", 'Toggle Nvim Tree', true)

  nmap('<leader>ee', ":Neotree filesystem reveal right<CR>", 'Toggle Nvim Tree', true)
  nmap('\\', ":Neotree filesystem reveal float<CR>", 'Toggle Nvim Tree', true)

  -- Buffers
  -- nmap('<leader>eb', ":Neotree reveal=true source=buffers<CR>", 'Toggle Nvim Tree', true)
  nmap('<leader>eb', ":Neotree buffers reveal float<CR>", 'Toggle Nvim Tree', true)

  -- Git
  -- nmap('<leader>eg', ":Neotree reveal=true source=git_status<CR>", 'Toggle Nvim Tree', true)
  nmap('<leader>eg', ":Neotree git_status reveal right<CR>", 'Toggle Nvim Tree', true)

  -- Symbols
  nmap('<leader>ed', ":Neotree document_symbols reveal right<CR>", 'Toggle Nvim Tree', true)

  -- Close
  nmap('<leader>ec', ":Neotree close<CR>", 'Toggle Nvim Tree', true)
end

return M
