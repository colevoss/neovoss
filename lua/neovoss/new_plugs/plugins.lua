local load_config = function(path)
  local load_path = 'neovoss.new_plugs.' .. path

  local ok, loaded = pcall(require, load_path)

  if not ok then
    return
  else
    return loaded.config
  end
end

return {
  -- Theme
  {
    dir = "~/codes/neovim/nvimpire",
    lazy = false,
    priority = 1000,
    config = load_config('nvimpire')
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- LSP Installer
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        tag = 'legacy'
      },

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
    lazy = false,
    config = load_config('lsp')
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    dependencies = {
      'nvim-treesitter/playground',
    },
    config = load_config('treesitter')
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    },
    event = "InsertEnter",
    config = load_config('cmp'),
  },

  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = load_config('neotree')
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    lazy = false,
    config = load_config('telescope'),
  },

  -- Heirline
  {
    'rebelot/heirline.nvim',
    lazy = false,
    -- event = "BufEnter",
    config = load_config('heirline')
  }
}
