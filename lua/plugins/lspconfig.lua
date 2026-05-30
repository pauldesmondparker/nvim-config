local Plugin = { 'neovim/nvim-lspconfig' }
local user = {}

Plugin.dependencies = {
  { 'hrsh7th/cmp-nvim-lsp' },
  -- { 'williamboman/mason-lspconfig.nvim' },
  -- To be changed back once the PR has been merged:
  -- https://github.com/mason-org/mason.nvim/pull/1640
  { 'KingMichaelPark/mason.nvim', opts = { pip = { use_uv = true } } },
  { 'KingMichaelPark/mason-lspconfig.nvim' },
  { 'creativenull/efmls-configs-nvim' },
  { 'prisma/vim-prisma' },
}

Plugin.cmd = { 'LspInfo', 'LspInstall', 'LspUnInstall' }

Plugin.event = { 'BufReadPre', 'BufNewFile' }

function Plugin.init()
  local sign = function(opts)
    -- See :help sign_define()
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({ name = 'DiagnosticSignError', text = '✘' })
  sign({ name = 'DiagnosticSignWarn', text = '▲' })
  sign({ name = 'DiagnosticSignHint', text = '⚑' })
  sign({ name = 'DiagnosticSignInfo', text = '»' })

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
      border = 'rounded',
      source = true,
    },
  })

  vim.o.winborder = 'rounded'
end

function Plugin.config()
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    desc = 'LSP actions',
    callback = user.on_attach,
  })

  vim.lsp.config('*', {
    capabilities = lsp_capabilities,
  })

  require('mason-lspconfig').setup({
    automatic_installation = true,
    ensure_installed = {
      'cssls',
      'efm',
      'eslint',
      'gopls',
      'html',
      'lua_ls',
      'pyright',
      'ts_ls',
    },
  })

  vim.lsp.enable({
    'cssls',
    'efm',
    'eslint',
    'gopls',
    'html',
    'lua_ls',
    'pyright',
    'solidity',
    'ts_ls',
  })
end

function user.on_attach()
  local bufmap = function(mode, lhs, rhs)
    local opts = { buffer = true }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- You can search each function in the help page.
  -- For example :help vim.lsp.buf.hover()

  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
  bufmap({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
  bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
  bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

return Plugin
