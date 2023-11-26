local M = {}

function M.setup()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")

  if not status_ok then
    vim.notify("Could not load Treesitter configs")
    return
  end

  configs.setup {
    -- context_commentstring = {
    --   enable = true
    -- },
    auto_install = true,
    ignore_install = {},
    ensure_installed = {
      "lua",
      "help",
      "bash",
      "markdown",

      "gitcommit",
      "gitignore",

      "typescript",
      "javascript",
      "tsx",
      "html",
      "graphql",
      "css",

      "toml",
      "json",
      "yaml",

      "go",
      "rust",
      "python",
      "ruby",
      "cpp",
      -- "templ",

      "dockerfile",
      "terraform",

      "glsl",
      "wgsl",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      enable = true,

      disable = {
        ""
      },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      -- additional_vim_regex_highlighting = false,
      additional_vim_regex_highlighting = false,

      indent = {
        enable = true,
        disable = { "yaml" }
      }
    },
    -- playground = {
    --   enable = true
    -- }
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn", -- set to `false` to disable one of the mappings
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }
end

return M
