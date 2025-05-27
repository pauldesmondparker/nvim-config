local Plugin = { 'neovim/nvim-lspconfig' }
local user = {}

Plugin.dependencies = {
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'williamboman/mason-lspconfig.nvim' },
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

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
  )
end

function Plugin.config()
  local lspconfig = require('lspconfig')
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    desc = 'LSP actions',
    callback = user.on_attach
  })

  -- See :help mason-lspconfig-settings
  require('mason-lspconfig').setup({
    ensure_installed = {
      'cssls',
      'efm',
      'eslint',
      'html',
      'lua_ls',
      'ts_ls',
      'gopls',
    },
    handlers = {
      -- See :help mason-lspconfig-dynamic-server-setup
      -- ['ts_ls'] = function()
      --   lspconfig.ts_ls.setup({
      --     capabilities = lsp_capabilities,
      --     settings = {
      --       completions = {
      --         completeFunctionCalls = true
      --       }
      --     }
      --   })
      -- end,
      ['lua_ls'] = function()
        -- require('plugins.lsp.lua_ls')
        lspconfig.lua_ls.setup({
          capabilities = lsp_capabilities,
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                  'vim',
                  'require'
                },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          }
        })
      end,
      ['efm'] = function()
        local solhint = require("efmls-configs.linters.solhint")
        local prettier_d = require("efmls-configs.formatters.prettier_d")
        local gofumpt = require("efmls-configs.formatters.gofumpt")
        local go_revive = require("efmls-configs.linters.go_revive")
        local python_ruff = require("efmls-configs.formatters.ruff")
        local python_ruff_sort = require("efmls-configs.formatters.ruff_sort")
        local python_ruff_lint = require("efmls-configs.linters.ruff")
        lspconfig.efm.setup({
          filetypes = { "solidity", "typescriptreact", "typescript", "go", "python", },
          init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
          },
          settings = {
            languages = {
              solidity = { solhint, prettier_d },
              javascript = { prettier_d },
              javascriptreact = { prettier_d },
              typescript = { prettier_d },
              typescriptreact = { prettier_d },
              go = { gofumpt, go_revive },
              python = { python_ruff, python_ruff_sort, python_ruff_lint },
            }
          }
        })
      end,
      function(server)
        -- See :help lspconfig-setup
        lspconfig[server].setup({
          capabilities = lsp_capabilities,
          -- on_attach = on_attach,
        })
      end,
    }
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
