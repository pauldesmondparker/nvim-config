local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

-- See :help nvim-treesitter-modules
Plugin.opts = {
  highlight = {
    enable = true,
  },
  -- :help nvim-treesitter-textobjects-modules
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  },
  ensure_installed = {
    'css',
    'javascript',
    'json',
    'lua',
    'solidity',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
  },
}

function Plugin.config(opts)
  require('nvim-treesitter.configs').setup(opts)
  require('nvim-treesitter.parsers').get_parser_configs().solidity = {
    install_info = {
      url = "https://github.com/JoranHonig/tree-sitter-solidity",
      files = {"src/parser.c"},
      requires_generate_from_grammar = true,
    },
    filetype = 'solidity'
  }
  vim.opt.formatoptions:append('r', 'o')
end

return Plugin
