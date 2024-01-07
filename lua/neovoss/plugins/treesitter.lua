local M = { 'nvim-treesitter/nvim-treesitter' }

M.build = function()
  -- require('nvim-treesitter.install').update({ with_sync = true })
end

M.config = function()
  require('nvim-treesitter.configs').setup({
    -- context_commentstring = {
    --   enable = true
    -- },
    auto_install = false,
    ignore_install = {},
    ensure_installed = {
      "lua",
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
      "templ",

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
  })
end

return M
