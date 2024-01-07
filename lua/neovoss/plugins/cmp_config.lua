local M = {
  'hrsh7th/nvim-cmp',

  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim',
  }
}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

M.config = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')

  cmp.setup({
    preselect = cmp.PreselectMode.None,
    completion = {
      completeopt = 'menu,menuone,noinsert'
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = "buffer" },
      { name = "path" },
    }),

    mapping = {
      -- ['<C-k>'] = cmp.mapping.select_prev_item(),
      -- ['<C-j>'] = cmp.mapping.select_next_item(),

      ['<C-Space>'] = function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        else
          fallback()
        end
      end,

      ['<CR>'] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
          -- if cmp.visible() and cmp.get_active_entry() then
          --   cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          -- else
          --   fallback()
          -- end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),

      -- ["<CR>"] = cmp.mapping({
      --   i = cmp.mapping.confirm({ behavior = cmp.mapping.close(), c = cmp.mapping.close() }),
      --   c = function(fallback)
      --     if cmp.visible() then
      --       -- cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
      --       cmp.complete()
      --     else
      --       fallback()
      --     end
      --   end
      -- }),

      -- ["<C-e>"] = cmp.mapping {
      --   i = cmp.mapping.abort(),
      --   c = cmp.mapping.close(),
      -- },

      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },

    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

        vim_item.menu = " " .. ({
          nvim_lsp = "(lang)",
          nvim_lua = "(NVM_LUA)",
          luasnip = "(snip)",
          buffer = "(buff)",
          path = "(path)",
        })[entry.source.name]
        return vim_item
      end,
    },
  })
end

return M
