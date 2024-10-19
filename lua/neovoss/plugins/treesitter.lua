return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  opts = {
    auto_install = true,

    highlight = {
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      -- additional_vim_regex_highlighting = false,
      additional_vim_regex_highlighting = false,
    },

    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stats, vim.api.nvim_buf_get_name(buf))

      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    ensure_installed = {
      "bash",
      "cpp",
      "css",
      "dockerfile",
      "elixir",
      "gitcommit",
      "gitignore",
      "glsl",
      "go",
      "graphql",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "markdown",
      "python",
      "ruby",
      "rust",
      "templ",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "wgsl",
      "yaml",
      "hcl",
      "svelte",
      "vimdoc",
      "zig",
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
