local Plugin = {'hrsh7th/nvim-cmp'}

Plugin.dependencies = {
  -- Sources
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'saadparwaiz1/cmp_luasnip'},
  {'hrsh7th/cmp-nvim-lsp'},

  -- Snippets
  {'L3MON4D3/LuaSnip'},
  {'rafamadriz/friendly-snippets'},
}

Plugin.event = 'InsertEnter'

function Plugin.config()
  vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

  local cmp = require('cmp')
  local luasnip = require('luasnip')

  require('luasnip.loaders.from_vscode').lazy_load()

  local select_opts = {behavior = cmp.SelectBehavior.Select}

  -- https://www.nerdfonts.com/cheat-sheet
  local kind_icons = {
    Text = "󰦨",
    Method = "m",
    Function = "󰡱",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
    Copilot = "",
  }
  -- See :help cmp-config
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    sources = {
      {name = 'copilot'},
      {name = 'path'},
      {name = 'nvim_lsp'},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
          copilot = "[Copilot]",
        })[entry.source.name]
        return vim_item
      end,
    },
    -- formatting = {
    --   format = lspkind.cmp_format({
    --     mode = "symbol",
    --     max_width = 50,
    --     symbol_map = { Copilot = "" }
    --   })
    --   -- fields = {'menu', 'abbr', 'kind'},
    --   -- format = function(entry, item)
    --   --   local menu_icon = {
    --   --     nvim_lsp = 'λ',
    --   --     luasnip = '⋗',
    --   --     buffer = 'Ω',
    --   --     Copilot = "",
    --   --     path = '🖫',
    --   --   }
    --   --
    --   --   item.menu = menu_icon[entry.source.name]
    --   --   return item
    --   -- end,
    -- },
    -- See :help cmp-mapping
    mapping = {
      ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
      ['<Down>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<CR>'] = cmp.mapping.confirm({select = false}),

      ['<C-f>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, {'i', 's'}),

      ['<C-b>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {'i', 's'}),

      ['<Tab>'] = cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1

        if cmp.visible() then
          cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end, {'i', 's'}),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item(select_opts)
        else
          fallback()
        end
      end, {'i', 's'}),
    },
  })
end

return Plugin
