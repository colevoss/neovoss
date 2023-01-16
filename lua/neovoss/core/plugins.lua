local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- TODO: Make this more callable

local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })

    print("Installing packer. Close and reopen Neovim...")
    local cmd = "packadd packer.nvim"
    vim.cmd(cmd)

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({
        border = "rounded"
      })
    end,
  }
})

return packer.startup(function(use)
  -- Have packer manage itself
  use { 'wbthomason/packer.nvim' }

  -- Theme
  -- use { 'colevoss/nvimpire' }
  use '~/codes/neovim/nvimpire'

  -- ==============================================
  -- LSP and Language Features
  -- ==============================================

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground',
    },
    -- TODO: Run this in treesitter config file
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      -- LSP Installer
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    }
  }

  -- CMP
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    }
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- ==============================================
  -- UI/UX Features
  -- ==============================================

  -- Neotree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Heirline
  use {
    'rebelot/heirline.nvim'
  }

  -- Trouble
  use {
    'folke/trouble.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs'
  }

  -- Indent blankline
  use {
    'lukas-reineke/indent-blankline.nvim'
  }

  -- Illuminate
  use {
    'RRethy/vim-illuminate'
  }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- Navic (Winbar)
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua'
  }

  -- Maybe move this to a user's plugins
  use {
    "fladson/vim-kitty"
  }

  if packer_bootstrap then
    packer.sync()
  end
end)
