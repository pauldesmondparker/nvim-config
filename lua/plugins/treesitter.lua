local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

-- See :help nvim-treesitter-modules
Plugin.opts = {
  highlight = {
    enable = true,
    disable = { 'query', 'regex', 'rust' },
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
    'bash',
    'css',
    'dockerfile',
    'go',
    'javascript',
    'json',
    'lua',
    'markdown',
    'query',
    'python',
    'regex',
    'rust',
    'solidity',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },
  auto_install = true,
}

function Plugin.config(opts)
  require('nvim-treesitter.configs').setup(opts)

  -- nvim-treesitter master ships set-lang-from-info-string! using the old
  -- match-as-single-node signature. nvim 0.11+ passes match[id] as an
  -- array of nodes (quantifier-aware), so node:range() blows up. Re-register
  -- with array handling. https://github.com/nvim-treesitter/nvim-treesitter/issues
  local lang_aliases = {
    bash = 'bash', sh = 'bash', zsh = 'bash',
    js = 'javascript', javascript = 'javascript',
    ts = 'typescript', typescript = 'typescript',
    py = 'python', python = 'python',
    rb = 'ruby', ruby = 'ruby',
  }
  vim.treesitter.query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
    local node = match[pred[2]]
    if type(node) == 'table' then node = node[1] end
    if not node then return end
    local alias = vim.treesitter.get_node_text(node, bufnr):lower()
    metadata['injection.language'] = lang_aliases[alias] or alias
  end, { force = true, all = true })

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
